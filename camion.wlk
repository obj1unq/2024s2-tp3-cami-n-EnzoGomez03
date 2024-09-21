import almacen.*
import cosas.*
import ruta.*


object camion {
	const property cosas = #{}
	
	method cargar(unaCosa) {
		cosas.add(unaCosa)
		unaCosa.consecuenciaDeCarga()
	}

	method descargar(unaCosa) {
	  cosas.remove(unaCosa)
	}

	method todoPesoPar() = cosas.all({cosas => cosas.peso() % 2 == 0})
	
	method hayAlgunoQuePesa(peso) = cosas.any({cosas => cosas.peso() == peso })

	method elDeNivel(nivel) = cosas.find({cosas => cosas.nivelPeligrosidad() == nivel })
	
	method pesoTotal(){
		const tara = 1000
		return tara + self.pesoTotalDeCarga()
	}

	method pesoTotalDeCarga() = cosas.sum({cosas => cosas.peso()})

	method excedidoDePeso(){
		const pesoMaximo = 2500
		return self.pesoTotal() > pesoMaximo
	}

	method objetosQueSuperanPeligrosidad(nivel) = cosas.filter{cosas => cosas.nivelPeligrosidad() > nivel}
	
	method puedeCircularEnRuta(nivelMaximoPeligrosidad) = not(self.excedidoDePeso()) and cosas.all({cosas =>cosas.nivelPeligrosidad() <= nivelMaximoPeligrosidad})
	
	method tieneAlgoQuePesaEntre(min,max) = cosas.any({cosas =>cosas.peso() >= min and cosas.peso() <= max })
	

	method cosaMasPesada() = cosas.max({cosas => cosas.peso()})
	

   method pesos() = cosas.map({cosas => cosas.peso()})
   

   method totalBultos(){
	return cosas.sum({cosas => cosas.bulto()})
}
 
   method descargarCosasEnAlmacen(destino){
	cosas.forEach({cosas => destino.agregarCosa(cosas) self.descargar(cosas)})
   }

   method transportar(destino,camino){
	self.validarViaje(camino)
	self.descargarCosasEnAlmacen(destino)
   }

   method validarViaje(camino){
	 if(not(camino.sePuedeUsarRuta())){
		self.error('No se puede ulitizar este camino rey')
	}
   }
}

