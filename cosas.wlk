// ==================== ELEMENTOS ===================
object knightRider {
	method peso() = 500
	method nivelPeligrosidad() = 10
	method cantBultos() = 1
	method accidentar() {}
}

object arenaAGranel {
	var property peso = 0


	method nivelPeligrosidad() = 1
	method cantBultos() = 1
	method accidentar() { peso += 20 }
}

object bumblebeeAuto {
	var modoAuto = true

	method peso() = 800
	method nivelPeligrosidad() = if (modoAuto) {15} else {30}
	method cantBultos() = 2
	method accidentar() { modoAuto = !modoAuto }
}

object bumblebeeRobot {
	var modoAuto = false

	method peso() = 800
	method nivelPeligrosidad() = if (modoAuto) {15} else {30}
	method cantBultos() = 2
	method accidentar() { modoAuto = !modoAuto }
}

object ladrillos {
	var property cantLadrillos = 0


	method peso() = 2*cantLadrillos
	method nivelPeligrosidad() = 2

	method cantBultos() = if (cantLadrillos <= 100){
		1
	} else if(cantLadrillos <= 300){
		2
	} else{3}

	method accidentar() { if(cantLadrillos > 12){self.cantLadrillos(cantLadrillos-12)} else{self.cantLadrillos(0)} }
}

object bateriaAntiaereaConMisiles {
	var tieneMisiles = true

	method peso() = if (tieneMisiles) {300} else {200}
	method nivelPeligrosidad() = if (tieneMisiles) {100} else {0}
	method cantBultos() = 2
	method accidentar() { tieneMisiles = false }
}

object bateriaAntiaereaSinMisiles {
	method peso() = 200
	method nivelPeligrosidad() = 0
	method cantBultos() = 1
	method accidentar() {}
}

object residuosRadioactivos {
	var property peso = 0


	method nivelPeligrosidad() = 200
	method cantBultos() = 1
	method accidentar() {peso+=15}
}

object contenedorPortuario {
	const carga = #{}

	method cargar(elemento) {
		carga.add(elemento)
	}

	method descargar(elemento) {
		carga.remove(elemento)
	}

	method peso() = 100 + carga.sum({c => c.peso()})

	method nivelPeligrosidad() = if (!carga.isEmpty()){
		self.cosaMasPeligrosaCargada().nivelPeligrosidad()
	} else{0}

	method cosaMasPeligrosaCargada() = carga.max({c=>c.nivelPeligrosidad()})

	method cantBultos() = 1 + carga.sum({c=>c.cantBultos()}) // usa 1 bulto más de la cantidad de bultos que usan las cosas que tiene adentro.

	method accidentar() {carga.forEach({c=>c.accidentar()})}
}

object embalajeDeSeguridad {
	var elementoQueEnvuelve = null   //ya se que no va null, pero tampoco quiero asignarle un objeto como valor inicial; debería funcionar como  una palabra reservada para actuar como un puntero nulo, lo que significa que una referencia que no está apuntando a ningún objeto y por ende deberías ponerle algo, en los tests, para que funcionen...

	method envolver(elemento) {
		elementoQueEnvuelve = elemento
	}

	method peso() = elementoQueEnvuelve.peso()
	method nivelPeligrosidad() = elementoQueEnvuelve.nivelPeligrosidad()/2
	method cantBultos() = 2

	method accidentar() {}
}



