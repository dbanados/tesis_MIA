int init () // Función de Inicialización del Agente.
{
// Carga en Memoria parámetros del Agente
	seed = 345;  		//Semilla del generador de número aleatorio. Cada agente utiliza su propia Semilla
	inst = 'EUR/USD'; 	//Instrumento
	TP = 30;		// número de pips de Target de utilidad desde la apertura
	SL = -15;		// número de pips de Target de pérdida desde la apertura.
	Bal = 1000;		// Balance Inicial de la Cuenta
}

int start()	// Función que se ejecuta cada 5 minutos donde evalúa y genera operaciones.
{
	string tend = Tendencia(); 	// función que obtiene la predicción de la tendencia del día siguiente
	GestionDeCierre();  	// función que evalúa las operaciones abiertas
	GestionDeApertura();  	// función que evalúa entrar en una operación
	EscribeSaldo();	// función que escribe en un archivo el saldo instantáneo de la cuenta
}


int GestionDeCierre() // función que evalúa las operaciones abiertas y valida cerrarlas
{
	for (todas las operaciones abiertas) {
		if (operacion=='Compra' && Precio en área de Sobre Compra && (utilidad_operacion > TP or utilidad_operacion < SL) cierraOperacion();
		if (operacion=='Venta'     && Precio en área de Sobre Venta  && (utilidad_operacion > TP or utilidad_operacion < SL) cierraOperacion();	
	}
}


int GestionDeApertura() //función que evalúa abrir una operación
{
	int Prob = MathMod (MathRand(),100) +1; // Genera un número aleatorio entre 1 y 100
		
	if ((Prob > 90) &&	(Precio en área de Sobre Venta)	&&  tend = 'Sube'	) {
		int Vol = DetermVolumen ();         	// función que determina el volumen de la operación
		int tkt = OrderSend (inst,OP_BUY,Vol,Ask); // función que envía una orden de Compra 
	}
	if ((Prob > 90) &&	(Precio en área de Sobre Compra)	&&  tend = 'Baja'	) {
		int Vol = DetermVolumen ();         	// función que determina el volumen de la operacion
		int tkt = OrderSend (inst,OP_SELL,Vol,Bid); // función que envía una orden de Venta 
	}
}
int  DetermVolumen ()  // función que determina el volumen de una operación de forma aleatoria
{
	int Lotes = 0;	
	int Prob = MathMod (MathRand(),100) +1; // Genera un número aleatorio entre 1 y 100
	
	If (Prob <= 50) 	  Lotes= 1;
	If (Prob > 50 && Prob <= 85) Lotes= 2;	
	If (Prob > 85 && Prob <= 95) Lotes= 3;
	If (Prob > 95) 		  Lotes= 4;	
	return (Lotes);
}

int EscribeSaldo ();    // Función que escribe en un archivo de texto cada 5 minutos se utiliza como output para obtener la performance del agente
           // y agregar los datos con otros agentes para contar con la performance del sistema multiagentes.
{
	string ARCHIVO= "Saldo_5M_"+seed+".csv";
	int handle = FileOpen (ARCHIVO,FILE_READ | FILE_WRITE | FILE_CSV,";");
	FileSeek (handle,0,SEEK_END);
	FlieWrite (handle, seed, TimeCurrent();AccountEquity());
}
