
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

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>




<link rel="stylesheet" type="text/css"
	href="/Practica1/css/styleindex.css">
</head>
<body>
	<c:set var="user" value="${requestScope['user']}" />

	<div class="container">
		<nav class="navbar navbar-findcond navbar-fixed-top">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar">
					<span class="sr-only"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span> <span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">AGENDA</a>
			</div>
			<div class="collapse navbar-collapse" id="navbar">
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="false"> <span
							class="badge"><i class="fas fa-user"></i></span>My Cuenta
					</a></li>
					<li class="dropdown"><a href="/Practica1/agenda?cerrar=true"
						class="dropdown-toggle" data-toggle="dropdown" role="button"
						aria-expanded="false"> <span class="badge"><i
								class="fas fa-sign-in-alt"></i></span>Cerrar Sesion
					</a></li>
				</ul>
				<form class="navbar-form navbar-right search-form" role="search">
					<input type="text" class="form-control" placeholder="Search" />
				</form>
			</div>
		</nav>


		<div class="row custyle" style="padding-top: 80px;">
			<c:choose>
				<c:when test="${user.telefono.size() > 0}">
					<table class="table table-striped custab">
						<h1>Telefonos</h1>
						<thead>
							<a href="#" class="btn btn-primary btn-xs pull-right"><b>+</b>
								Agregar Telefono</a>
							<tr>
								<th>ID</th>
								<th>Title</th>
								<th>Parent ID</th>
								<th class="text-center">Action</th>
							</tr>
						</thead>
						<c:set var="i" value="${0}" />
						<c:forEach var="telefono" items="${user.telefono}">
							<c:set var="i" value="${i+1}" />
							<tr>
								<td>${i}</td>
								<td>${telefono.tipo}</td>
								<td>${telefono.operadora}</td>
								<td>
									<div class="text-center">
										<a class='btn btn-info btn-xs' data-toggle="modal"
											data-target="#exampleModalCenter"><span
											class="glyphicon glyphicon-edit"></span> Edit</a> <a
											data-toggle="modal" data-target="#exampleModalCenter"
											href="#myModal" class="btn btn-danger btn-xs"><span
											class="glyphicon glyphicon-remove"></span> Del</a>
									</div>
								</td>
							</tr>

							<a href="#" class="btn btn-lg btn-success" data-toggle="modal"
								data-target="#basicModal"> Click to open Modal </a>

							<div class="modal fade" id="basicModal" tabindex="-1"
								role="dialog" aria-labelledby="basicModal" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h4 class="modal-title" id="myModalLabel">Basic Modal</h4>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">×</span>
											</button>
										</div>
										<div class="modal-body">
											<h3>Modal Body</h3>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default"
												data-dismiss="modal">Close</button>
											<button type="button" class="btn btn-primary">Save
												changes</button>
										</div>
									</div>
								</div>
							</div>

						</c:forEach>
					</table>
				</c:when>
				<c:otherwise>
					<h1>No hay contactos</h1>
					<br>
					<br>

					<button type="button"
						class="ui left floated small primary labeled icon button"
						data-toggle="modal" data-target="#exampleModalCenter">
						<i class="phone icon"></i> Agregar telefono
					</button>
					<br>
					<br>

				</c:otherwise>
			</c:choose>
		</div>
	</div>

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
	</ body>
</html>