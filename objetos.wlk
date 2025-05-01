/** First Wollok example */
import wollok.game.*

object lionel {
	var property image = "lionel-titular.png"
	var property position = game.at(3,5)

	method retroceder() {
		position = game.at(0.max(position.x() - 1), position.y()) 
	}
	
	method avanzar() {
		position = game.at((game.width() - 1).min(position.x() + 1), position.y()) 
	}
	
	method cambiarCamiseta(){
		self.validarCambioCamiseta()
		if (self.esTitular()){
			self.image("lionel-suplente.png")
		} else {
			self.image("lionel-titular.png")
		}
	}

	method esTitular(){
		return self.image() == "lionel-titular.png"
	} 

	method validarCambioCamiseta() {
	  if (not self.estaEnBordeIzq()){
		 self.error("No estoy en el borde izquierdo")
	  }
	}

	method estaEnBordeIzq(){
		return self.position().x() == 0
	}
}


object pelota {
	const property image="pelota.png"
	var property position = game.at(5,5)	
}


//commit