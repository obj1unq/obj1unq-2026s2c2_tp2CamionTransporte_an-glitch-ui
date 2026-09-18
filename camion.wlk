import cosas.*

object camion {
	const property cosas = #{}
	const peso = 1000


	method cargar(unaCosa) {
		self.validarCargaDe(unaCosa)
		cosas.add(unaCosa)
	}

	method descargar(cosa) {
		self.validarDescargaDe(cosa)
		cosas.remove(cosa)
	}

	method validarCargaDe(c){
		if (self.elElementoEstaCargado(c)){
			self.error("No se puede cargar: "+c+" porque ya se encuentra cargado en el camión...")
		}
	}

	method validarDescargaDe(c) {
		if (!self.elElementoEstaCargado(c)){
			self.error("No se puede descargar: "+c+" ya que no se encuentra cargado en el camión...")
		}
	}

	method elElementoEstaCargado(e) = cosas.contains(e)

	method todosTienenPesoPar() = cosas.all({c => c.peso().even()})

	method hayAlgunElementoQuePese(p) = cosas.any({c => c.peso() == p})

	method seExcedeDelPeso() = self.pesoTotal() > 2500

	method pesoTotal() = peso + cosas.sum({c => c.peso()})

	method elementoConPeligrosidad(p) = cosas.find({c => c.nivelPeligrosidad() == p})

	method cosasMasPeligrosasQueLaPeligrosidadDe(p) = cosas.filter({c => c.nivelPeligrosidad() > p})

	method cosasMasPeligrosasQue(c) = self.cosasMasPeligrosasQueLaPeligrosidadDe(c.nivelPeligrosidad())

	method puedeCircularEnRutaDeNivel(n) = not self.seExcedeDelPeso() && self.cosasMasPeligrosasQueLaPeligrosidadDe(n).isEmpty()

	//2.8

}
