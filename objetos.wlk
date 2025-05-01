/** First Wollok example */
import wollok.game.*

object lionel {

	var property image = "lionel-titular.png"
	
	var property bocha = pelota

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

	method patearBocha() {
		self.validarSiEstaLaPelotaEnLionel()
		bocha.position(bocha.posicionDeLaPelotaPateada())
	}

	method validarSiEstaLaPelotaEnLionel() {
		if(not self.estaLaPelotaEnLionel())	{
			self.error("No está la pelota en Lionel.")
		}
	}

	method estaLaPelotaEnLionel() {
		return bocha.position() == self.position()
	}

	method taquito(){
		self.validarSiEstaLaPelotaEnLionel()
		bocha.moverConTaco()

	}
}


object pelota {
	const property image="pelota.png"
	var property position = game.at(5,5)

	method posicionDeLaPelotaPateada() {
		return game.at(self.posicionEnXDeLaPelotaPateada(), position.y())
	}

	method posicionEnXDeLaPelotaPateada() {
		return (game.width() - 1).min(position.x() + 3)
	}

	method moverConTaco(){
		position = game.at(0.max(position.x() - 2), position.y()) 
	}
}
