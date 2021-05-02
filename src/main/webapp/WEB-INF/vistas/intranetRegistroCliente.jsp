<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<jsp:include page="intranetValida.jsp" />
<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Expires" content="-1" />
<meta http-equiv="Cache-Control" content="private" />
<meta http-equiv="Cache-Control" content="no-store" />
<meta http-equiv="Pragma" content="no-cache" />

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<script type="text/javascript" src="js/global.js"></script>

<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>

<title>Intranet</title>
</head>
<body>
<style>
body {background:url("images/Cliente.jpg")

</style>
<jsp:include page="intranetCabecera.jsp" />
	<div class="container" style="margin-top: 5%">
	
		<h4 ><big> Registro Cliente</big></h4>
	
	</div>
	<div class="container" style="margin-top: 1%">
		<c:if test="${objMensajeCliente != null}">
			<div class="alert alert-success fade in" id="success-alert">
				<a href="#" class="close" data-dismiss="alert">&times;</a> <strong>${objMensajeCliente}</strong>
			</div>
		</c:if>
		<c:remove var="objMensajeCliente" />
		<form id="id_formRegistraCliente" action="registraCliente"
			accept-charset="UTF-8">
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label class="control-label" for="id_razonSocial">Nombre : </label> <input class="form-control" type="text"
							id="id_razonSocial" name="nombres"
							placeholder="Ingrese el nombrel" maxlength="100">
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label class="control-label" for="id_ruc">Apellidos : </label> <input
							class="form-control" type="text" id="id_ruc" name="apellidos"
							placeholder="Ingrese los apellidos" maxlength="100"
							>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label class="control-label" for="id_contacto">Correo :
						</label> <input class="form-control" type="text" id="id_contacto"
							name="correo" placeholder="Ingrese el correo" maxlength="100">
					</div>
				</div>
			</div>
			
				
				<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label class="control-label" for="id_direccion">Direccion
							: </label> <input class="form-control" type="text" id="id_direccion"
							name="direccion" placeholder="Ingrese su correo	"
							maxlength="100">
					</div>
				</div>
				</div>
					<div class="form-group col-md-3">
					<label class="control-label" for="id_estado">Estado</label>
					<select id="id_estado" name="estado" class='form-control'>
						<option value=" ">[Seleccione]</option> 
						<option value="1">Activo</option> 
						<option value="0">Inactivo</option>    
					</select>
				</div>
			
			<div class="row">
				<div class="col-md-4">
					<div class="form-group">
						<label class="control-label" for="id_departamento">Departamento
							: </label> <select id="id_departamento" class="form-control"
							onchange="buscarProvincias();">
							<option value="">[ SELECCIONAR DEPARTAMENTO ]</option>
						</select>
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label class="control-label" for="id_provincia">Provincia
							: </label> <select id="id_provincia" class="form-control"
							onchange="buscarDistritos();">
							<option value="">[ SELECCIONAR PROVINCIA ]</option>
						</select>
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label class="control-label" for="id_distrito">Distrito :
						</label> <select id="id_distrito" class="form-control"
							name="ubigeo.idUbigeo">
							<option value="">[ SELECCIONAR DISTRITO ]</option>
						</select>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="form-group">
						<button id="id_registrar" type="submit" class="btn btn-primary">Crea
							Cliente</button>
					</div>
				</div>
			</div>
		</form>
	</div>

	<script type="text/javascript">
		$("#success-alert").fadeTo(1000, 500).slideUp(500, function() {
			$("#success-alert").slideUp(2000);
		});
	</script>

	<script type="text/javascript">
		$.getJSON("listaDepartamentos", {}, function(data) {
			$.each(data, function(index, item) {
				$("#id_departamento").append(
						"<option value='"  + item.departamento +"'>"
								+ item.departamento + "</option>");
			});
		});

		function buscarProvincias() {
			var departamento = $("#id_departamento option:selected").val();
			$("#id_provincia option").remove();
			$("#id_provincia").append(
					"<option value=''>[ SELECCIONAR PROVINCIA ]</option>");
			$("#id_distrito option").remove();
			$("#id_distrito").append(
					"<option value=''>[ SELECCIONAR DISTRITO ]</option>");
			$.getJSON("listaProvincias", {
				'var_departamento' : departamento
			}, function(data) {
				$.each(data, function(index, item) {
					$("#id_provincia").append(
							"<option value='"+item.provincia +"'>"
									+ item.provincia + "</option>");
				});
			});
		}

		function buscarDistritos() {
			var departamento = $("#id_departamento option:selected").val();
			var provincia = $("#id_provincia option:selected").val();
			$("#id_distrito option").remove();
			$("#id_distrito").append(
					"<option value=''>[ SELECCIONAR DISTRITO ]</option>");
			$.getJSON("listaDistritos", {
				'var_provincia' : provincia,
				'var_departamento' : departamento
			}, function(data) {
				$.each(data, function(index, item) {
					$("#id_distrito").append(
							"<option value='" + item.idUbigeo + "'>"
									+ item.distrito + "</option>");
				});
			});
		}
	</script>

	<script type="text/javascript">
		function validaNumericos(event) {
			if (event.charCode >= 48 && event.charCode <= 57) {
				return true;
			}
			return false;
		}
	</script>

	<script type="text/javascript">
		$('#id_formRegistraCliente')
				.bootstrapValidator(
						{
							message : 'This value is not valid',
							feedbackIcons : {
								valid : 'glyphicon glyphicon-ok',
								invalid : 'glyphicon glyphicon-remove',
								validating : 'glyphicon glyphicon-refresh'
							},
							fields : {
								razonsocial : {
									selector : '#id_razonSocial',
									validators : {
										notEmpty : {
											message : 'La raz�n social es un campo obligatorio'
										},
										stringLength : {
											min : 5,
											max : 100,
											message : 'La raz�n social es de 5 a 100 caracteres'
										}
									}
								},
								ruc : {
									selector : '#id_ruc',
									validators : {
										notEmpty : {
											message : 'El ruc es un campo obligatorio'
										},
										stringLength : {
											min : 11,
											message : 'La raz�n social es de 11 caracteres'
										}
									}
								},
								direccion : {
									selector : '#id_direccion',
									validators : {
										notEmpty : {
											message : 'La direccion es obligatorio'
										},
										stringLength : {
											min : 5,
											max : 100,
											message : 'La direccion es de 5 a 100 caracteres'
										}
									}
								},
								telefono : {
									selector : '#id_telefono',
									validators : {
										notEmpty : {
											message : 'El tel�fono es un campo obligatorio'
										},
										stringLength : {
											min : 7,
											message : 'El tel�fono es de 7 caracteres'
										}
									}
								},
								celular : {
									selector : '#id_celular',
									validators : {
										notEmpty : {
											message : 'El celular es un campo obligatorio'
										},
										stringLength : {
											min : 9,
											message : 'El celular es de 9 caracteres'
										}
									}
								},
								contacto : {
									selector : '#id_contacto',
									validators : {
										notEmpty : {
											message : 'El contacto es un campo obligatorio'
										},
										stringLength : {
											min : 3,
											max : 100,
											message : 'El contacto es de 3 a 100 caracteres'
										}
									}
								},
								departamento : {
									selector : '#id_departamento',
									validators : {
										notEmpty : {
											message : 'El departamento es un campo obligatorio'
										}
									}
								},
								provincia : {
									selector : '#id_provincia',
									validators : {
										notEmpty : {
											message : 'La provincia es un campo obligatorio'
										}
									}
								},
								distrito : {
									selector : '#id_distrito',
									validators : {
										notEmpty : {
											message : 'El distrito es un campo obligatorio'
										}
									}
								},
							}
						});
	</script>		
</body>
</html>