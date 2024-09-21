object knightRider {
	
	method peso() {
		 return 500
	 }
	
	method nivelPeligrosidad() {
		 return 10
	 }

   method bulto() = 1

   method consecuenciaDeCarga(){

   }
}

object bumblebee {
  var transformacion = auto
  
  
  method peso()=800

  method transformado() = transformacion

  method transformar(estado) {
	transformacion = estado
  }

  method nivelPeligrosidad(){
	return transformacion.nivelPeligrosidad()
  } 

  method bulto() = 2 

  method consecuenciaDeCarga(){
    self.transformar(robot)
  }

}

object auto {

  method nivelPeligrosidad(){
	return 15
  }
}

object robot {
  
  method nivelPeligrosidad() = 30
}

object paqueteLadrillos {
  
  var canLadrillos = 1

  method canLadrillos() = canLadrillos

  method canLadrillos(cantidad) {
    canLadrillos += cantidad
  } 

  method peso() = 2 * canLadrillos

  method nivelPeligrosidad() = 2

  method bulto(){
    return if(canLadrillos <= 100){
       1
    }
    else if(canLadrillos >= 101 and canLadrillos < 301 ){
        2
    }
    else{
      3
    }
  }

  method consecuenciaDeCarga(){
    self.canLadrillos(12)
  }

}

object arenaGranel {

  var property peso = 0

  method peso() = peso

  method peso(agregar) {
    peso += agregar
  } 

  method nivelPeligrosidad(){
    return 1
  }

  method bulto() = 1

  method consecuenciaDeCarga(){
    self.peso(20)
  }
}

object bateriaAntiaerea {
  var property municion = misil

  method peso() = municion.peso() 

  method nivelPeligrosidad() = municion.nivelPeligrosidad()

  method bulto(){
    
    return municion.bulto()
  
  }

  method consecuenciaDeCarga(){
    self.municion(misil)
  }
}

object misil {
  
  method peso() = 300

  method nivelPeligrosidad()=100

  method bulto(){
    return 1
  }
}

object balas {
  
  method peso()=200

  method nivelPeligrosidad() = 0

  method bulto(){
   return 2
  }
}

object contenedorPortuario {

  const cosasAdentro = []

  method agregarCosa(cosa){

    cosasAdentro.add(cosa)

  }

   method quitarCosa(cosa){
    cosasAdentro.remove(cosa)
   }
  
  method peso(){
    
    return 100 + self.pesoTotalDeCosas()

  }

  method pesoTotalDeCosas(){
    return cosasAdentro.sum({cosas =>cosas.peso()})
  }

  method nivelPeligrosidad(){
  
  return  if(cosasAdentro.isEmpty()){
      0
    }
    else{
      cosasAdentro.max({cosa => cosa.nivelPeligrosidad()}).nivelPeligrosidad()
    }

  }  

  method bulto(){
    return 1 + cosasAdentro.sum({cosas => cosas.bulto()})
  }

  method consecuenciaDeCarga(){
    cosasAdentro.forEach({cosas => cosas.consecuenciaDeCarga()})
  }
  
}

object residuosRadioactivos {
  
  var property peso = 0

  method nivelPeligrosidad() = 200

  method bulto() = 1

  method consecuenciaDeCarga(){
    self.peso(15)
  }

}
object embalajeSeguridad {

  var property cobertura = misil

  method peso() = cobertura.peso()

  method nivelPeligrosidad() = cobertura.nivelPeligrosidad() / 2

  method bulto() = 2

  method consecuenciaDeCarga(){
    
  }
}

