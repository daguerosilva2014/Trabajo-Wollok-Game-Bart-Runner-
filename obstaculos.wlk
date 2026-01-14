
import bart.*
import mainRunner.*
import pantalla.*


class Obstaculo{
    const nombre = "obstaculo"
    const posicion0EnX =28 //las const son para que no se pierda el inicial, ya que randomUpTo hace de la constante que pusiste, en este caso 28, hasta el maximo, en este caso 50
    const posicion0EnY = 0
    var positionVarEnX = 0
    var positionVarEnY = 0
    const alturaMaxima

    var property position = game.at(28,0)
    method nombre() = nombre
    method image() = self.nombre() + ".png"

    method volverAPosicionAleatoria(){
        positionVarEnX=posicion0EnX.randomUpTo(50)
        positionVarEnY=posicion0EnY.randomUpTo(alturaMaxima) //ponele

        position = game.at(positionVarEnX,positionVarEnY)
    }

    method volverAPosicionOriginal(){
        position = game.at(28,0)
    }

    method posicion() = position

    method irHaciaBart() {
        position = position.left(1)
    }


 //Hitbox

    const base
    const altura
    method posx()= self.position().x()
    method posy()= self.position().y()

    var abajoIzquierda= new Pair(x=self.posx(),y=self.posy())
    var arribaDerecha= new Pair(x=self.posx()+base,y=self.posy()+altura)

    method abajoIzquierda()=abajoIzquierda
    method arribaDerecha()=arribaDerecha

    method actualizarPosiciones(){
        abajoIzquierda = new Pair(x=self.posx(),y=self.posy())
        arribaDerecha = new Pair(x=self.posx()+base,y=self.posy()+altura)     
    }

    method colisionaCon(otraHitbox) {
        return self.abajoIzquierda().x() < otraHitbox.arribaDerecha().x() &&
        self.arribaDerecha().x() > otraHitbox.abajoIzquierda().x() &&
        self.abajoIzquierda().y() < otraHitbox.arribaDerecha().y() &&
        self.arribaDerecha().y() > otraHitbox.abajoIzquierda().y()
    }

    method colisionarCon(bart) 


}

class ObstaculoNormal inherits Obstaculo{
    override method colisionarCon(bart){
        vida.pierdeVida()

        if( vida.puntos() <= 0){
            game.removeTickEvent("logicaObstaculos")
            game.removeTickEvent("volverAbajo")
            game.removeVisual(bart)
            game.removeVisual(vida)
            game.removeVisual(self)
            game.addVisual(gameOver)
            

        }
    }
}

class DuffVida inherits Obstaculo{
    override  method colisionarCon(bart){
        vida.sumaVida()
    }
}

