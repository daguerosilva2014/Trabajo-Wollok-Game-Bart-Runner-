import obstaculos.*
import bart.*


object spawner {

    var obstaculoActual = null
    

    method crearObstaculoAleatorio() {
        var nuevoObstaculo
        var random = 0.randomUpTo(1)

        if(random < 0.35) {
            nuevoObstaculo = new ObstaculoNormal(nombre = "rosquilla",base=2,altura=2, alturaMaxima=3)
        } else if(random >= 0.35 && random < 0.7) {
            nuevoObstaculo = new ObstaculoNormal(nombre = "auto",base=6,altura=2.5, alturaMaxima=0.2)
        }
        else {
            nuevoObstaculo = new DuffVida(nombre = "duff", base = 2, altura =2, alturaMaxima = 2)
        }

        random = 0.randomUpTo(1)

        nuevoObstaculo
        .volverAPosicionAleatoria()
        nuevoObstaculo.actualizarPosiciones()

        return nuevoObstaculo
    }

    method iniciar() {
        obstaculoActual = self.crearObstaculoAleatorio()
        obstaculoActual.actualizarPosiciones()
        game.addVisual(obstaculoActual)
    }

    method procesarObstaculos() {
        
        bart.actualizarPosiciones()
        obstaculoActual.actualizarPosiciones()

        if (obstaculoActual.colisionaCon(bart) or obstaculoActual.posicion().x() < -5) {

            if (obstaculoActual.colisionaCon(bart)) {
                obstaculoActual.colisionarCon(bart)
            }

            game.removeVisual(obstaculoActual)

            obstaculoActual = self.crearObstaculoAleatorio()
            // obstaculoActual.actualizarPosiciones()

            game.addVisual(obstaculoActual)

        } else {
            obstaculoActual.irHaciaBart()
            obstaculoActual.actualizarPosiciones()
        }
    }
}
