import taller.*


object dominic { 
const autos = []

method comprar(unAuto){autos.add(unAuto)}


  
method autosNoEnCondiciones() {
  return autos.filter({a => not a.enCondiciones()})
}

method autosEnCondiciones() {
  return autos.filter({a => a.enCondiciones()})
}

method mandarAutosAlTaller() {
  taller.recibirAutos(self.autosNoEnCondiciones())
}
 method hacerPrueba() {
   autos.forEach({a => a.hacerPrueba()})
 }
 method venderAutos() {
   autos.clear()
 }

  method promedioVelocidad() {
    return autos.sum({a => a.velocidadMaxima()}) / autos.size()
  }


  method masRapido() {
    return self.autosEnCondiciones().max({a => a.velocidadMaxima()})
  }


  method hayUnAutoMuyRapido() = self.masRapido().velocidadMaxima() > 2 * self.promedioVelocidad()
}




object ferrari {
  var motor = 87
  method enCondiciones() {
    return motor >= 65
  }
  method reparar() {
    motor = 100
  }
  method velocidadMaxima() = 110 + if(motor > 75) 15 else 0

  method hacerPrueba() {
    motor = (motor - 30).max(0)
  }

}



object flecha {
  var nivelCombustible = 100
  var property tipoCombustible = gasolina
  var property color = azul


  method enCondiciones() {
    return nivelCombustible > tipoCombustible.nivelMinimo() 
  }
  

  method hacerPrueba() {
    nivelCombustible = (nivelCombustible -5).max(0)
  }

  method reparar() {
    nivelCombustible = nivelCombustible * 2
    color = color.cambiarDeColor()
  }
  method velocidadMaxima() {
    return nivelCombustible * 2 + tipoCombustible.calculoAdicional(nivelCombustible)
  }

}



object gasolina {
  method nivelMinimo() {
    return 85
  }
  method calculoAdicional(listros) {
    return 10
  }
}

object nafta {
  method nivelMinimo() {
    return 50
  }
  method calculoAdicional(litros) {
    return -1 * (litros * 2) * 0.10
  }
}


object nitrogeno {
  method nivelMinimo() {
    return 0
  }
  method calculoAdicional(litros) {
    return litros * 2 * 10
  }
}

object azul {
  method cambiarDeColor() {
    return verde
  }
}

object rojo {
  method cambiarDeColor() {
    return azul
  }
}

object verde {
  method cambiarDeColor() {
    return rojo
  }
}

object intocable {
   var property enCondiciones = true 
   method hacerPrueba() {
     enCondiciones = false
   }    

   method reparar() {
     enCondiciones = true
   }

   method velocidadMaxima() {
     return 45
   }
}

object inventado {
  
  var reproEnLaEcu = false
  var cubiertasNuevas = 4

 method enCondiciones(){
  return reproEnLaEcu && cubiertasNuevas >= 2
 }

 method reparar() {
   cubiertasNuevas = 3
    reproEnLaEcu = true
 }

 method hacerPrueba() {
   cubiertasNuevas = 0
   reproEnLaEcu = false
 }

method velocidadMaxima() =
    if (reproEnLaEcu) 110 * 2 else 110

}

