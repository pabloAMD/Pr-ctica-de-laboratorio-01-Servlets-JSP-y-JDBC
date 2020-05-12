
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous">

<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Roboto"
	rel="stylesheet">


<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">


<!-- Material Design Bootstrap -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.16.0/css/mdb.min.css"
	rel="stylesheet">






<!------ Include the above in your HEAD tag ---------->

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round|Open+Sans">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" type="text/css"
	href="/Practica1/css/styleindex.css">
</head>
<body>
	<c:set var="user" value="${requestScope['user']}" />
	<nav
		class="navbar navbar-icon-top navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand" href="#">AGENDA</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">

				<li class="nav-item"><a class="nav-link" href="#"> <i
						class="fa fa-home"> <span class="sr-only">(current)</span>
					</i> Inicio
				</a></li>

			</ul>
			<ul class="navbar-nav ">
				<li class="nav-item"><a class="nav-link" href="agenda"> <i
						class="fa fa-user"> <span class="sr-only">(current)</span>
					</i> Mi Cuenta
				</a></li>
				<li class="nav-item"><a class="nav-link" href="agenda?cerrar=true"> <i
						class="fa fa-sign-out" aria-hidden="true"> <span
							class="sr-only">(current)</span>
					</i> Cerrar Sesion
				</a></li>
			</ul>
			<form class="form-inline my-2 my-lg-0" method="POST"
				action="/Practica1/BuscarUsu">
				<input class="form-control mr-sm-2" type="text" placeholder="Search"
					aria-label="Search" name="buscar">
				<button class="btn btn-success btn-lg" type="submit">Search</button>
			</form>
		</div>
	</nav>


	<c:choose>
		<c:when test="${user!=null}">
			<div class="container" style="padding-top: 85px;">

				<div class="table-wrapper">
					<div class="table-title">
						<div class="row">
							<div class="col-sm-8">
								<h2>
									Resultados de la <b>búsqueda</b>
								</h2>
							</div>
							
						</div>
					</div>
					<div>
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>Nombre</th>
								<th>Apellido</th>
								<th>Cedula</th>
								<th>Correo</th>
							</tr>
						</thead>
	
							<tbody>
								<tr>
									<td>${user.nombre}</td>
									<td>${user.apellido}</td>
									<td>${user.cedula}</td>
									<td><a style="color: red; text-decoration: underline;" href="mailto:${user.correo}">${user.correo}</a></td>
								</tr>
							</tbody>	
					</table>
					
					</div>
					<table class="table table-bordered">
						<c:set var="i" value="${0}" />
						<thead>
							
							<tr>
								<th></th>
								<th>Numero</th>
								<th>Tipo</th>
								<th>Operadora</th>
							</tr>
						</thead>
						<c:forEach var="telefono" items="${user.telefono}">
							<c:set var="i" value="${i+1}" />
							<tbody>
								<tr>
									<td>${i}</td>
									<td>${telefono.numero}</td>
									<td>${telefono.tipo}</td>
									<td>${telefono.operadora}</td>
								</tr>

							</tbody>
							<

							
						</c:forEach>
					</table>
				</div>
			</div>
		</c:when>
		<c:otherwise>
			<h1>El contacto no existe o no tiene informacion</h1>
			<br>
			<br>

		
			<br>
			<br>

		</c:otherwise>
	</c:choose>

	


	<footer>
		<div class="container">
			<div class="row">
				<div class="col-lg-5 col-md-5 col-sm-4 col-xs-12">
					<ul class="adress">
						<span>Informacion</span>
						<li>
							<p>Creador: Pablo Malla</p>
						</li>

						<li>
							<p>Ecuador</p>
						</li>

						<li>
							<p>Azuay-Cuenca</p>
						</li>
					</ul>
				</div>

				<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
					<ul class="contact">
						<span>Correos de Contacto</span>
						<li>
							<p>pablo.malla.abc.com@gmail.com</p>
						</li>

						<li>
							<p>pmalla@est.ups.edu.ec
							<p>
						</li>

						<li>
							<p>pabloadri1998@gmail.com</p>
						</li>


					</ul>
				</div>

				<div class="col-lg-3 col-md-3 col-sm-4 col-xs-12">
					<ul class="social">
						<span>Social</span>
						<li><a href="https://www.facebook.com/hffhjjdghjk.cfjsdhfdff"><i
								class="fa fa-facebook fa-2x"></i></a></li>

						<li><a href="https://github.com/pabloAMD"><i
								class="fa fa-github fa-2x"></i></a></li>


					</ul>
				</div>


			</div>
		</div>
	</footer>
	<script src="//code.jquery.com/jquery-1.11.1.min.js">
		
	</script>


	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<!-- Bootstrap tooltips -->
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
	<!-- Bootstrap core JavaScript -->
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/js/bootstrap.min.js"></script>
	<!-- MDB core JavaScript -->
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.16.0/js/mdb.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</body>
</html>