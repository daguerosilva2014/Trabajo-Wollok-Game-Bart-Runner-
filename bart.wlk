
import game.*


object bart{
    
    var property position = game.at(4,0)
    method nombre() = "bart"
    method image() = self.nombre() + ".png"
    var saltosDisponibles = 3

    method lastimado(){
        game.say(self, "Ay caramba!")
    }

    method saltar() {
        if(saltosDisponibles > 0 && position.y() < game.height()-1){
            position = position.up(3)
            saltosDisponibles -= 1
        }
    }

    method volverAbajo(){
        position = position.down(0.5)
    }

    method procesarGravedad(){
        if(position.y() > 0) {
            position = position.down(0.5)
        } else {
            saltosDisponibles = 3
        }
    }

//Hitbox

    const base=3
    const altura=3
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
}




object vida {

    var property position = game.at(28,9)
    method nombre() = "vida"
    method image() {
        return vida.toString() + "vidas.png"
    }
    

    var vida = 3

    method vidaActual() = vida

    method puntos() = vida

    method pierdeVida() {
        vida = vida - 1
    }

    method sumaVida() {
        if (vida < 3){
            vida += 1
        }
    }

}
