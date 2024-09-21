import camion.*

object almacen {
  
  const cosas = #{}

  method agregarCosa(cosa) {
    cosas.add(cosa)
  }

  method bultosMax(){
    return self.cantidadBultos() < 3  
  }

  method cantidadBultos(){
    return cosas.sum({cosas => cosas.bulto()})
  }
}