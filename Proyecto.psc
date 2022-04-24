SubProceso MENU1()//Selección de la opción
	Escribir "";
	Escribir "Elija una opción.";
	Escribir "1. Cargar datos.";
	Escribir "2. Ver datos según DNI.";
	Escribir "3. Visualizar todo el curso.";
	Escribir "4. Ver si corresponde beca.";
	Escribir "5. Ver abanderados.";
	Escribir "6. Modificar datos.";
	Escribir "7. Salir";
FinSubProceso
SubProceso MENU2()//Modificación de datos 
	Escribir "";
	Escribir "¿Qué desea modificar?";
	Escribir "1. DNI.";
	Escribir "2. Nombre.";
	Escribir "3. Nota en matemática.";
	Escribir "4. Nota en prácticas del lenguaje.";
	Escribir "5. Nota en ciencias sociales.";
	Escribir "6. Nota en ciencias naturales.";
	Escribir "7. Salir";
FinSubProceso
Proceso principal
	definir DNI,MAT,LENG,SOC,NAT,OP,OP2,i,Buscar_Dni,j,k,pos como enteros;
	definir NOM como cadena;
	definir CONT1,CONT2,Busqueda Como Logico;
	Definir PROM,aux Como Real;
	dimension DNI[10],MAT[10],LENG[10],SOC[10],NAT[10],NOM[10],PROM[10],PROM1[10];
	//Ideas: Busqueda por nota-Curso- Inscripcion a cursos
	CONT1<-verdadero; //Continuar con el programa.
	i<-0; //Contador de estudiantes.
	j<-0; //Contador de búsqueda.
	
	Escribir "Bienvenido al sistema de boletin de alumnos 2022";
	Escribir "";
	
	Mientras CONT1==verdadero Hacer
		//Opciones del programa.
		MENU1();
		Leer OP;
		Segun OP Hacer
			1:
				//Pedido de datos para el registro del nuevo estudiante al sistema.
				Escribir "Ingrese DNI: ";
				Leer DNI[i];
				Escribir "Ingrese nombre: ";
				Leer NOM[i];
				Escribir "Nota en matemática: ";
				Leer MAT[i];
				Escribir "Nota en lengua: ";
				Leer LENG[i];
				Escribir "Nota en ciencias sociales: ";
				Leer SOC[i];
				Escribir "Nota en ciencias naturales: ";
				Leer NAT[i];
				//Promedio automático
				PROM[i]<-(MAT[i]+LENG[i]+SOC[i]+NAT[i])/4;
				i<-i+1;
				Escribir "";
				Escribir "¡¡¡ Los datos fueron cargados con éxito !!!";
				Escribir "";
			2:
				//Búsqueda de estudiante mediante DNI.
				Escribir "Ingrese el DNI: ";
				Leer Buscar_Dni;
				Busqueda<-Falso;
				j<-0;
				Mientras Busqueda==Falso y j<i Hacer
					si DNI[j]==Buscar_Dni Entonces
						Busqueda<-Verdadero;
					SiNo
						j<-j+1;
					FinSi
				FinMientras
				si Busqueda==Falso entonces
					Escribir "";
					Escribir "No se encontró al estudiante";
					Escribir "";
				SiNo
					Escribir "Los datos que corresponden al DNI ", DNI[j], " son:";
					Escribir "";
					Escribir "DNI: ", DNI[j];
					Escribir "Nombre: ", NOM[j];
					Escribir "Nota en matemática: ", MAT[j];
					Escribir "Nota en lengua: ", LENG[j];
					Escribir "Nota en ciencias sociales: ", SOC[j];
					Escribir "Nota en ciencias naturales: ", NAT[j];
					Escribir "Promedio: ", PROM[j];
					Escribir "";
				FinSi
			3:
				//Visualizar todo el curso.
				k<-0;
				para k<-0 hasta (i-1) con paso 1 Hacer
					Escribir "Alumno ", (k + 1), ":";
					Escribir "DNI: ", DNI[k];
					Escribir "Nombre: ", NOM[k];
					Escribir "Nota en matemática: ", MAT[k];
					Escribir "Nota en lengua: ", LENG[k];
					Escribir "Nota en ciencias sociales: ", SOC[k];
					Escribir "Nota en ciencias naturales: ", NAT[k];
					Escribir "Promedio: ", PROM[k];
					Escribir "";
				FinPara
				//Si no hay estudiantes cargados al sistema muestra el siguiente mensaje.
				Si i==0 Entonces
					Escribir "";
					Escribir "No se registró ningún estudiante al sistema.";
					Escribir "";
				FinSi
			4:
				//Ver estudiantes que le corresponden beca.
				Para k<-0 hasta (i-1) con paso 1 Hacer
					Si PROM[k] >= 8 Entonces
						Escribir "Al estudiante ", NOM[k], " SI le corresponde beca.";
					SiNo
						Escribir "";
						Escribir "Al estudiante ", NOM[k], " NO le corresponde beca.";
					FinSi
				FinPara
				//Si no hay estudiantes cargados al sistema muestra el siguiente mensaje.
				Si i==0 Entonces
					Escribir "";
					Escribir "No se registró ningún estudiante al sistema.";
					Escribir "";
				FinSi
			5:
				//Ver 3 promedios mas altos para buscar  a los abanderados
				para j<-1 hasta (i-1) con paso 1 hacer 
					pos<-j;
					aux<-PROM[j];
					mientras (pos>0 y PROM[pos-1]>aux) Hacer
						pos<-pos-1;
					FinMientras
					PROM1[pos]<-aux;
				FinPara
				
				Escribir "Los abanderados son: ";
				
				Para i<-2 Hasta 0 Con Paso -1 Hacer
					Escribir NOM[i], " ", PROM1[i];
				FinPara
			6:
				//Modificar datos
				//Visualizar todo el curso.
				k<-0;
				para k<-0 hasta (i-1) con paso 1 Hacer
					Escribir "Alumno ", (k + 1), ":";
					Escribir "DNI: ", DNI[k];
					Escribir "Nombre: ", NOM[k];
					Escribir "Nota en matemática: ", MAT[k];
					Escribir "Nota en lengua: ", LENG[k];
					Escribir "Nota en ciencias sociales: ", SOC[k];
					Escribir "Nota en ciencias naturales: ", NAT[k];
					Escribir "Promedio: ", PROM[k];
					Escribir "";
				FinPara
				//Si no hay estudiantes cargados al sistema muestra el siguiente mensaje.
				Si i==0 Entonces
					Escribir "";
					Escribir "No se registró ningún estudiante al sistema.";
					Escribir "";
				FinSi
				
				Escribir "¿De cuál estudiante desea modificar los datos?: ";
				Leer pos;
				
				MENU2();
				Leer OP2;
				
				
					Segun OP2 Hacer
						1:
							Escribir "Ingrese el nuevo DNI: ";
							Leer DNI[pos-1];
						2:
							Escribir "Ingrese el nuevo nombre: ";
							Leer NOM[pos-1];
						3:
							Escribir "Ingrese la nueva nota en matemática: ";
							Leer MAT[pos-1];
						4:
							Escribir "Ingrese la nueva nota en prácticas del lenguaje: ";
							Leer LENG[pos-1];
						5:
							Escribir "Ingrese la nueva nota en ciencias sociales: ";
							Leer SOC[pos-1];
						6:
							Escribir "Ingrese la nueva nota en ciencias naturales: ";
							Leer NAT[pos-1];
					FinSegun
				
			7:
				CONT1<-Falso;
			De Otro Modo:
				Escribir "Opción incorrecta. Por favor, ingrese otra opción.";
		FinSegun
	FinMientras
	
	
FinProceso


