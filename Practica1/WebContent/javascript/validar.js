var cedula;
var nombre;
var apellido;
var correo;
var contra1;


function validarCampos() {
	console.log("joajajajaj")
	var bandera = true;
	for (var i = 0; i < document.forms[0].elements.length; i++) {
		var elemento = document.forms[0].elements[i]
		if (elemento.type == 'text') {
			if (elemento.id == 'nombre') {
				document.getElementById('mensajeNombre').style = 'display:none;'
				nombre = document.getElementById("nombre").value;
				if (val_letra(nombre) == false) {
					document.getElementById('mensajeNombre').style = 'display:block; color:rgb(144, 248, 41); font-size:20px;'
					document.getElementById('mensajeNombre').innerHTML = '<b>No se permite numeros'
				}
			}
			if (elemento.id == 'apellido') {
				document.getElementById('mensajeApellido').style = 'display:none;'
				apellido = document.getElementById("apellido").value;
				console.log(apellido)
				if (val_letra(apellido) == false) {
					document.getElementById('mensajeApellido').style = 'display:block; color:rgb(144, 248, 41); font-size:20px;'
					document.getElementById('mensajeApellido').innerHTML = '<b>No se permite numeros'
				}

			}
			if (elemento.id == 'cedula') {
				document.getElementById('mensajeCedula').style = 'display:none;'
				cedula = document.getElementById("cedula").value;
				if (val_numero(cedula) == false) {
					document.getElementById('mensajeCedula').style = 'display:block; color:rgb(144, 248, 41); font-size:20px;'
					document.getElementById('mensajeCedula').innerHTML = '<b>No se permite letras'
				} else {
					validaCedula();
				}
			}

			if (elemento.id == 'email') {
				document.getElementById('mensajeCorreo').style = 'display:none;'
				correo = document.getElementById('correo').value;
				if (validarCorreo(correo) == 0) {

					document.getElementById('mensajeCorreo').style = 'display:block; color:rgb(144, 248, 41); font-size:20px;'
					document.getElementById('mensajeCorreo').innerHTML = '<b>Inicio corto'
				}
				if (validarCorreo(correo) == -1) {

					document.getElementById('mensajeCorreo').style = 'display:block; color:rgb(144, 248, 41); font-size:20px;'
					document.getElementById('mensajeCorreo').innerHTML = '<b>Extension Invalida'
				}
			}

		}
		bandera = false

	}

}
function init() {
	var enviar = document.getElementById("boton");
	enviar.onclick = function(e) {
		validarCampos();

	}

}
function validaCedula() {
	console.log(cedula.length)
	// Preguntamos si la cedula consta de 10 digitos
	if (cedula.length == 10) {
		// Obtenemos el digito de la region que sonlos dos primeros digitos
		var digito_region = cedula.substring(0, 2);

		// Pregunto si la region existe ecuador se divide en 24 regiones
		if (digito_region >= 1 && digito_region <= 24) {

			// Extraigo el ultimo digito
			var ultimo_digito = cedula.substring(9, 10);

			// Agrupo todos los pares y los sumo
			var pares = parseInt(cedula.substring(1, 2))
					+ parseInt(cedula.substring(3, 4))
					+ parseInt(cedula.substring(5, 6))
					+ parseInt(cedula.substring(7, 8));

			// Agrupo los impares, los multiplico por un factor de 2, si la
			// resultante es > que 9 le restamos el 9 a la resultante
			var numero1 = cedula.substring(0, 1);
			var numero1 = (numero1 * 2);
			if (numero1 > 9) {
				var numero1 = (numero1 - 9);
			}

			var numero3 = cedula.substring(2, 3);
			var numero3 = (numero3 * 2);
			if (numero3 > 9) {
				var numero3 = (numero3 - 9);
			}

			var numero5 = cedula.substring(4, 5);
			var numero5 = (numero5 * 2);
			if (numero5 > 9) {
				var numero5 = (numero5 - 9);
			}

			var numero7 = cedula.substring(6, 7);
			var numero7 = (numero7 * 2);
			if (numero7 > 9) {
				var numero7 = (numero7 - 9);
			}

			var numero9 = cedula.substring(8, 9);
			var numero9 = (numero9 * 2);
			if (numero9 > 9) {
				var numero9 = (numero9 - 9);
			}

			var impares = numero1 + numero3 + numero5 + numero7 + numero9;

			// Suma total
			var suma_total = (pares + impares);

			// extraemos el primero digito
			var primer_digito_suma = String(suma_total).substring(0, 1);

			// Obtenemos la decena inmediata
			var decena = (parseInt(primer_digito_suma) + 1) * 10;

			// Obtenemos la resta de la decena inmediata - la suma_total esto
			// nos da el digito validador
			var digito_validador = decena - suma_total;

			// Si el digito validador es = a 10 toma el valor de 0
			if (digito_validador == 10)
				var digito_validador = 0;

			// Validamos que el digito validador sea igual al de la cedula
			if (digito_validador == ultimo_digito) {
				console.log('la cedula:' + cedula + ' es correcta');
				document.getElementById('mensajeCedula').style = 'display:none;'

			} else {
				console.log('la cedula:' + cedula + ' es incorrecta');
				document.getElementById('mensajeCedula').style = 'display:block; color:rgb(144, 248, 41); font-size:20px;'
				document.getElementById('mensajeCedula').innerHTML = '<b>Cedula Incorrecta'
			}

		} else {
			// imprimimos en consola si la region no pertenece
			console.log('Esta cedula no pertenece a ninguna region');
			document.getElementById('mensajeCedula').style = 'display:block; color:rgb(144, 248, 41); font-size:20px;'
			document.getElementById('mensajeCedula').innerHTML = '<b>No pertenece a ninguna region'

		}
	} else {
		// imprimimos en consola si la cedula tiene mas o menos de 10 digitos
		console.log('Esta cedula tiene menos de 10 Digitos');
		document.getElementById('mensajeCedula').style = 'display:block; color:rgb(144, 248, 41); font-size:20px;'
		document.getElementById('mensajeCedula').innerHTML = '<b>Esta cedula tiene menos de 10 Digitos'
	}
}

function val_letra(dato) {
	var out = '';
	var filtro = 'abcdefghijklmnñopqrstuvwxyzABCDEFGHIJKLMNÑOPQRSTUVWXYZ ';// Caracteres
																			// validos

	// Recorre el value y verifica si el caracter se encuentra en la lista de
	// validos
	for (var i = 0; i < dato.length; i++)
		if (filtro.indexOf(dato.charAt(i)) != -1) {

			out += dato.charAt(i);
			console.log(out)
		} else {
			console.log
			return false;
		}

}

function val_numero(dato) {
	var out = '';
	var filtro = '1234567890';// Caracteres validos

	// Recorre el value y verifica si el caracter se encuentra en la lista de
	// validos
	for (var i = 0; i < dato.length; i++)
		if (filtro.indexOf(dato.charAt(i)) != -1) {
			// Se añaden a la salida los caracteres validos
			out += dato.charAt(i);
		} else {
			return false;
		}

	// Retornar el valor filtrado
	return out;
}

function validaLongitud(dato) {
	if (dato.length != 10) {
		return false;
	} else {
		return true;
	}
}
