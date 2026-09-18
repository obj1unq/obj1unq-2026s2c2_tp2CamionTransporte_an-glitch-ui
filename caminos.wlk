import camion.*
import almacen.*
import cosas.*

object ruta9 {
    method soporta() = 20

    method puedeSoportar(elementos) = elementos.any({e => })   // ningun elemento supere los 20 de peligrosidad
}

object caminoVecinal {
    var pesoMaximo = 0


    method pesoMaximo(_pesoMaximo) {
        pesoMaximo = _pesoMaximo
    }

    method soporta() = pesoMaximo

    method puedeSoportar(elementos) = elementos   // ningun elemento supere el peso maximo que fue configurado 
}
