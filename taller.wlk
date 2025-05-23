object taller {
  const autosAReparar = [] 

method recibirAutos(unaListaDeAutos) {
  autosAReparar.addAll(unaListaDeAutos)
}

method repararAutos() {
  autosAReparar.forEach({a => a.reparar()})
  autosAReparar.clear()
}

}