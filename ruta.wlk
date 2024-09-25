import camion.*


object ruta9 {

  method nivelPeligrosidad() = 11
  
  method sePuedeUsarRuta() =  camion.puedeCircularEnRuta(11)
}

object caminosVecinales {
  
  var property pesoMaximo = 0

  method  sePuedeUsarRuta() = pesoMaximo > camion.pesoTotal()

}