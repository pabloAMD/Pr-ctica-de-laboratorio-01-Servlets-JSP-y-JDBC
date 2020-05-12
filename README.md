# Practica-de-laboratorio-01-Servlets-JSP-y-JDBC
# 2. Requerimientos Funcionales del sistema

## 2.1 Los usuarios pueden registrarse en la aplicación a través de un formulario de creación de cuentas.


![image](https://user-images.githubusercontent.com/33675679/81641549-dd225f80-93e6-11ea-81da-5a16a80f0f99.png)

 
Formulario que nos permite registrar un usuario dentro de la pagina web
## 2.2 Un usuario puede iniciar sesión usando su correo y contraseña

![image](https://user-images.githubusercontent.com/33675679/81641565-e7dcf480-93e6-11ea-8d45-8ffe418cf56d.png)
 
Creación del formulario que nos permite iniciar sesión, sin embargo se presenta al usuario la opción de registrarse o volver a inicio.

## 2.3 • Una vez iniciado sesión el usuario podrá:
### 2.3.1 Registrar, modificar, eliminar, listar sus teléfonos

Registrar

![image](https://user-images.githubusercontent.com/33675679/81641591-f88d6a80-93e6-11ea-9f97-44dc9bbb751c.png)

Se crea un model para crear o registrar un teléfono en donde debe especificar el número, tipo y operadora que 
tendrá el mismo

Modificar
 
![image](https://user-images.githubusercontent.com/33675679/81641614-080cb380-93e7-11ea-9817-512eb98677fe.png)

Se crea un model que nos permite modificar un número que ha sido previamente registrado.

Eliminar 

![image](https://user-images.githubusercontent.com/33675679/81641629-14910c00-93e7-11ea-8ca8-64659ad2a957.png)

Se crea un model que nos advierte que estamos por eliminar el numero que se especifica, y podemos continuar o 
cancelar dicha operación 

Listar sus Teléfonos

![image](https://user-images.githubusercontent.com/33675679/81641645-1eb30a80-93e7-11ea-8dba-70b79e1bc0d1.png)

Al momento que usuario ingresa automáticamente se listan los números que ha registrado, si no es el caso nos 
aparece un mensaje y nos permite agregar un número.

### 2.3.2 Listar los números de teléfono de un usuario usando su número de cédula o correo electrónico

Buscar

![image](https://user-images.githubusercontent.com/33675679/81641717-4a35f500-93e7-11ea-8fa3-49e075b8a5e0.png)
Se muestra la lista de la búsqueda realizada de un usuario según su cedula, aquí nos muestra su información
 donde podemos contactarnos por correo o sus números telefónicos.

### 2.3.3 Podrá llamar o enviar un correo electrónico desde el sistema usando aplicaciones externas.

![image](https://user-images.githubusercontent.com/33675679/81641736-528e3000-93e7-11ea-8422-52782106d68d.png)
 
En el punto anterior mostramos que podemos acceder a enviar un correo al presionar nos lleva a esta pagina donde podemos enviar un correo al usuario escogido.


### 2.3.4 Los datos siempre deberán ser validados cuando se trabaje a través de formularios.


![image](https://user-images.githubusercontent.com/33675679/81641784-705b9500-93e7-11ea-9a66-fe2b4ee31a46.png)
 

Se realiza la validación de los datos, para que esos no estén vacíos o no sean del tipo de dato que se solicita.


## Parte Publica


![image](https://user-images.githubusercontent.com/33675679/81641896-b44e9a00-93e7-11ea-9542-8e1b08952bf2.png)

Mostramos informacion de la empresa, asi como su historia, objetivos, quienes somos, mision, vision y valores

# Conclusiones

Se realizo la utilización de servlets para la creación de la práctica, estos nos permiten generar paginas web de forma dinámica a partir de parámetros de petición que son enviados mediante el navegador web.
Los servlets también son utilizados para mejorar la capacidad del servidor
Se implententa un sistema JEE basado en Servlets, JSP y JBDC

