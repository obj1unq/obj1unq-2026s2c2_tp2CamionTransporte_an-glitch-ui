import camion.*
import almacen.*
import cosas.*

object ruta9 {
    var pesoMaximo = 20


    method pesoMaximo(_pesoMaximo) {
        pesoMaximo = _pesoMaximo
    }

    //method puedeSoportar(elementos) = !elementos.any({e => e.nivelPeligrosidad()==20})   // ningun elemento supere los 20 de peligrosidad
    method puedeSoportar(elementos) =
        1000 + elementos.sum({e => e.peso()}) <= 2500 and
        !elementos.any({e => e.nivelPeligrosidad() > pesoMaximo})
}

object caminoVecinal {
    var pesoMaximo = 0


    method pesoMaximo(_pesoMaximo) {
        pesoMaximo = _pesoMaximo
    }

    //method puedeSoportar(elementos) = !elementos.any({e => e.nivelPeligrosidad() <= pesoMaximo})   // ningun elemento supere el peso maximo que fue configurado 
    method puedeSoportar(elementos) = 1000 + elementos.sum({e => e.peso()}) <= pesoMaximo
}
