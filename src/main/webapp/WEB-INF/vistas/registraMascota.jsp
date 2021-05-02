<!DOCTYPE html>
<html lang="esS">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<script type="text/javascript" src="js/global.js"></script>

<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet" href="css/bootstrapValidator.css" />

<title>Mascota</title>
</head>
<body>
<jsp:include page="intranetCabecera.jsp" />

	
	<div class="container" style="margin-top: 10%">
	
		<h4>	<strong>Registro Mascota</strong></h4>
		
	</div>
	<style>
body {background:url("images/vete3.jpg");}
</style>

			<form id="id_form">
              <div class="col-md-6">
				<div class="form-group">
					<label class="control-label" for="id_nombre">Nombres</label> <input
						class="form-control" type="text" id="id_nombre" name="nombre"
						placeholder="Ingrese el nombre" maxlength="40">
				</div>
                    </div>
                     <div class="col-md-6">
				<div class="form-group">
					<label class="control-label" for="id_color">Color</label> <input
						class="form-control" type="text" id="id_color" name="color"
						placeholder="Ingrese el color" maxlength="8">
				</div>
</div>
<div class="col-md-6">
				<div class="form-group">
					<label class="control-label" for="id_raza">Raza</label> <input
						class="form-control" type="text" id="id_raza" name="raza"
						placeholder="Ingrese la raza" maxlength="100">
				</div>
</div>
<div class="col-md-6">
				<div class="form-group">
					<label class="control-label" for="id_descripcion">Descripcion</label>
					<input class="form-control" type="text" id="id_descripcion"
						name="descripcion" placeholder="Ingrese la descripcion"
						maxlength="100">
				</div>
</div>



				<div class="form-group">
				<center>
					<button id="id_registrar" type="submit" class="btn btn-primary">Crea
						Mascota</button>
						</center>
				</div>
			</form>
		

		<script type="text/javascript">
			$("#id_registrar").click(function() {

				var validator = $('#id_form').data('bootstrapValidator');
				validator.validate();

				if (validator.isValid()) {
					$.ajax({
						type : 'POST',
						data : $("#id_form").serialize(),
						url : 'registraMascota',
						success : function(data) {
							mostrarMensaje(data.MENSAJE);
							limpiar();
							validator.resetForm();
						},
						error : function() {
							mostrarMensaje(MSG_ERROR);
						}
					});
				}

			});

			function limpiar() {
				$('#id_nombre').val('');
				$('#id_color').val('');
				$('#id_raza').val('');
				$('#id_descripcion').val('');
				$('#id_foto').val('');
			}

			$(document)
					.ready(
							function() {
								$('#id_form')
										.bootstrapValidator(
												{
													message : 'This value is not valid',
													feedbackIcons : {
														valid : 'glyphicon glyphicon-ok',
														invalid : 'glyphicon glyphicon-remove',
														validating : 'glyphicon glyphicon-refresh'
													},
													fields : {
														nombre : {
															selector : "#id_nombre",
															validators : {
																notEmpty : {
																	message : 'El nombre es obligatorio'
																},
																stringLength : {
																	min : 3,
																	max : 40,
																	message : 'El nombre es de 3 a 40 caracteres'
																},
															}
														},
														color : {
															selector : "#id_color",
															validators : {
																notEmpty : {
																	message : 'El color es obligatorio'
																},
																stringLength : {
																	min : 3,
																	max : 40,
																	message : 'El nombre es de 3 a 40 caracteres'
																},
															}
														},
														raza : {
															selector : "#id_raza",
															validators : {
																notEmpty : {
																	message : 'La raza es obligatorio'
																},

															}
														},
														descripcion : {
															selector : "#id_descripcion",
															validators : {
																notEmpty : {
																	message : 'La descripcion es obligatorio'
																}
															}
														},
													}
												});

							});
		</script>
</body>
</html>




