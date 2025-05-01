/** First Wollok example */
import wollok.game.*

object lionel {
	
	var property bocha = pelota
	var property position = game.at(3,5)
	
	method image() {
		return "lionel-titular.png"
	}

	method retroceder() {
		position = game.at(0.max(position.x() - 1), position.y()) 
	}
	
	method avanzar() {
		position = game.at((game.width() - 1).min(position.x() + 1), position.y()) 
	}
	
	method taquito(){
		self.validarPosicion()
		bocha.moverConTaco()
		

	}

	method validarPosicion(){
		if (!self.mismaPosicionPelota()){
	
			self.error("No estoy donde esta la pelota bobo")
		}
	
		
	}

	method mismaPosicionPelota() = position== bocha.position()
}


object pelota {
	const property image="pelota.png"
	var property position = game.at(5,5)	

	method moverConTaco(){
		position = game.at(0.max(position.x() - 2), position.y()) 
	}
}


//commit