// ==================== ELEMENTOS ===================
object knightRider {
	method peso() = 500
	method nivelPeligrosidad() = 10
}

object arenaAGranel {
	var property peso = 0


	//method peso(_peso) { 
	//	peso = _peso 
	//}

	//method peso() = peso

	method nivelPeligrosidad() = 1
}

object bumblebeeAuto {
	method peso() = 800
	method nivelPeligrosidad() = 15
}

object bumblebeeRobot {
	method peso() = 800
	method nivelPeligrosidad() = 30 
}

object ladrillos {
	var cantLadrillos = 0


	method peso() = 2*cantLadrillos
	method nivelPeligrosidad() = 2
	method cantLadrillos(_cantLadrillos) {
	    cantLadrillos = _cantLadrillos
	}
}

object bateriaAntiaereaConMisiles {
	method peso() = 300
	method nivelPeligrosidad() = 100
}

object bateriaAntiaereaSinMisiles {
	method peso() = 200
	method nivelPeligrosidad() = 0
}



object residuosRadioactivos {
	var property peso = 0


	method nivelPeligrosidad() = 200
}

object contenedorPortuario {
	const carga = #{}

	method cargar(elemento) {
		carga.add(elemento)
	}

	method descargar(elemento) {
		carga.remove(elemento)
	}

	method peso() = 100

	method nivelPeligrosidad() = if (!carga.isEmpty()){
		self.cosaMasPeligrosaCargada().peso()
	} else{0}

	method cosaMasPeligrosaCargada() = carga.max({c=>c.nivelPeligrosidad()})
}

object embalajeDeSeguridad {
	var elementoQueEnvuelve = null   //ya se que no va null, pero tampoco quiero asignarle un objeto como valor inicial; debería funcionar como  una palabra reservada para actuar como un puntero nulo, lo que significa que una referencia que no está apuntando a ningún objeto y por ende deberías ponerle algo, en los tests, para que funcionen...

	method envolver(elemento) {
		elementoQueEnvuelve = elemento
	}

	method peso() = elementoQueEnvuelve.peso()
	method nivelPeligrosidad() = elementoQueEnvuelve.nivelPeligrosidad()/2
}



