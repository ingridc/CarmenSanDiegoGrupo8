package appModel

import java.util.List
import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.uqbar.commons.model.ObservableUtils
import tp1.CarmenSanDiego
import tp1.Caso
import tp1.Pais

@Accessors
@Observable
class AppModelPartida{
	
	CarmenSanDiego model
	Caso casoActual
	Pais ubicacionActual
	Pais destinoElegido
	List<Pais> recorridoCorrecto = new ArrayList<Pais>
	List<Pais> recorridoIncorrecto = new ArrayList<Pais>
	List<Pais> recorrido = new ArrayList<Pais>
	
	new(CarmenSanDiego modelo, Caso caso){
		model = modelo
		casoActual = caso
		ubicacionActual = caso.lugarDeRobo
	}
	
	def actualizarUbicacion() {
		recorrido.add(ubicacionActual)
		ubicacionActual = destinoElegido
		ObservableUtils.firePropertyChanged(this,"ubicacionActual")
		val ultimo = recorrido.last()
		if (casoActual.planDeEscape.contains(ultimo)){
			recorridoCorrecto.add(ultimo)
		}
		else{
			recorridoIncorrecto.add(ultimo)
		}
	}
	
	
}