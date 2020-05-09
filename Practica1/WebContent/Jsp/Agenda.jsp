
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
				<li class="nav-item"><a class="nav-link" href="#"> <i
						class="fa fa-user"> <span class="sr-only">(current)</span>
					</i> Mi Cuenta
				</a></li>
				<li class="nav-item"><a class="nav-link" href="agenda?cerrar=true"> <i
						class="fa fa-sign-out" aria-hidden="true"> <span
							class="sr-only">(current)</span>
					</i> Cerrar Sesion
				</a></li>
			</ul>
			<form class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2" type="text" placeholder="Search"
					aria-label="Search">
				<button class="btn btn-success btn-lg" type="submit">Search</button>
			</form>
		</div>
	</nav>


	<c:choose>
		<c:when test="${user.telefono.size() > 0}">
			<div class="container" style="padding-top: 85px;">

				<div class="table-wrapper">
					<div class="table-title">
						<div class="row">
							<div class="col-sm-8">
								<h2>
									Números <b>Telefonicos</b>
								</h2>
							</div>
							<div class="col-sm-4">
								<button data-toggle="modal" data-target="#crearTelefono" type="button" class="btn btn-info add-new">
									<i  class="fa fa-plus"></i> Agregar Telefono
								</button>
							</div>
						</div>
					</div>
					<table class="table table-bordered">
						<c:set var="i" value="${0}" />
						<thead>
							
							<tr>
								<th></th>
								<th>Numeros</th>
								<th>Tipo</th>
								<th>Operadora</th>
								<th>Actions</th>
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

									<td>

										<div>
											<a class="edit" title="Editar" data-toggle="tooltip"><i
												data-toggle="modal" data-target="#editarTelefono${i}"
												class=" material-icons"></i></a> 
											<a class="delete"
												title="Eliminar" data-toggle="tooltip"><i
												data-toggle="modal" data-target="#eliminartelefono${i}"
												class="material-icons"></i></a>
										</div>

									</td>
								</tr>

							</tbody>
							<div style="width: 300px; margin-left: 650px" class="modal fade"
								id="editarTelefono${i}" tabindex="-1" role="dialog"
								aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
								<div class="modal-dialog modal-dialog-centered" role="document">
									<div class="modal-content">
										<div style="background-color: #BDBFCB; border-radius: 5px"
											class="modal-header">
											<h5 class="modal-title" id="exampleModalCenterTitle">Numero:
												${telefono.numero}</h5>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<form action="EditarTelefono" method="POST">
											<input type="hidden" name="codigo" value="${telefono.codigo}">
											<div style="background-color: #BDBFCB; border-radius: 5px"
												class="modal-body">
												<div class="form-group">
													<label for="numero">Numero</label> <input type="text"
														class="form-control" id="numero" name="numero"
														value="${telefono.numero}" required="">
												</div>

												<div class="form-group">
													<label for="tipo">Tipo</label> <input type="text"
														list="items" class="form-control" id="tipo" name="tipo"
														required="" placeholder="${telefono.tipo}">
													<datalist id="items">
														<option value="Movil"></option>
														<option value="Convencional"></option>

													</datalist>
												</div>
												<div class="form-group">
													<label for="operadora">Operadora</label> <input
														list="items1" type="text" class="form-control"
														id="operadora" name="operadora" required=""
														placeholder="${telefono.operadora}">
													<datalist id="items1">
														<option value="Claro"></option>
														<option value="Movistar"></option>
														<option value="CNT"></option>
														<option value="Tuenti"></option>

													</datalist>

												</div>

											</div>
											<div style="background-color: #BDBFCB; border-radius: 5px"
												class="modal-footer">
												<button type="button" class="btn btn-primary"
													data-dismiss="modal">Cerrar</button>
												<button type="submit" class="btn btn-primary">Guardar</button>
											</div>
										</form>
									</div>
								</div>
							</div>

							<div id="eliminartelefono${i}" class="modal fade" tabindex="-1"
								role="dialog">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title">Seguro que deseas eliminar el
												numero</h5>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<div class="modal-body">
											<p>"${telefono.numero}"</p>
										</div>
										<div class="modal-footer">
											<a class="btn btn-primary"
												href="EditarTelefono?eliminar=true&telefonoCodigo=${telefono.codigo}">Aceptar</a>
											<button type="button" class="btn btn-secondary"
												data-dismiss="modal">Cancelar</button>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</table>
				</div>
			</div>
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

	<div style="width: 300px; margin-left: 650px" class="modal fade"
								id="crearTelefono" tabindex="-1" role="dialog"
								aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
								<div class="modal-dialog modal-dialog-centered" role="document">
									<div class="modal-content">
										<div style="background-color: #BDBFCB; border-radius: 5px"
											class="modal-header">
											<h5 class="modal-title" id="exampleModalCenterTitle">Crear Telefono</h5>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<form action="CrearTelefono" method="POST">
											<input type="hidden" name="codigo" value="${telefono.codigo}">
											<div style="background-color: #BDBFCB; border-radius: 5px"
												class="modal-body">
												<div class="form-group">
													<label for="numero">Numero</label> <input type="text"
														class="form-control" id="numero" name="numero"
														value="${telefono.numero}" required="">
												</div>

												<div class="form-group">
													<label for="tipo">Tipo</label> <input type="text"
														list="items" class="form-control" id="tipo" name="tipo"
														required="" placeholder="${telefono.operadora}">
													<datalist id="items">
														<option value="Movil"></option>
														<option value="Convencional"></option>

													</datalist>
												</div>
												<div class="form-group">
													<label for="operadora">Operadora</label> <input
														list="items1" type="text" class="form-control"
														id="operadora" name="operadora" required=""
														placeholder="${telefono.tipo}">
													<datalist id="items1">
														<option value="Claro"></option>
														<option value="Movistar"></option>
														<option value="CNT"></option>
														<option value="Tuenti"></option>

													</datalist>

												</div>

											</div>
											<div style="background-color: #BDBFCB; border-radius: 5px"
												class="modal-footer">
												<button type="button" class="btn btn-primary"
													data-dismiss="modal">Cerrar</button>
												<button type="submit" class="btn btn-primary">Guardar</button>
											</div>
										</form>
									</div>
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