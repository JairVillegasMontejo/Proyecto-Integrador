<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>
<title>Mantenimiento de Marca </title>
</head>
<body>
<jsp:include page="intranetCabecera.jsp" />
<div class="container" style="margin-top: 4%">
<h3>Mantenimiento de Marca </h3>
	
<div class="col-md-23" >  
			  <form id="idFormElimina" action="eliminaCrudMarca">
			  		<input type="hidden" id="id_elimina" name="id">
			  </form>	
				
		       <form accept-charset="UTF-8"  action="consultaCrudMarca" class="simple_form" id="defaultForm2"  method="post">

					<div class="row" style="height: 70px">
						<div class="col-md-2" >
								<input class="form-control" id="id_nonbre_filtro"  name="filtro" placeholder="Ingrese el nombre" type="text" maxlength="30"/>
						</div>
						<div class="col-md-2" >
							<button type="submit" class="btn btn-primary" style="width: 150px">FILTRA</button>
						</div>
						<div class="col-md-2">
							<button type="button" data-toggle='modal' onclick="registrar();"  class='btn btn-success' id="validateBtnw2" style="width: 150px">REGISTRA</button>
						</div>
						<div class="col-md-4">
							<c:if test="${sessionScope.MENSAJE != null }">
									<div class="alert alert-success" id="success-alert">
							 		   <button type="button" class="close" data-dismiss="alert">x</button>
										${sessionScope.MENSAJE}				
									</div>
							</c:if>
							<c:remove var="MENSAJE"/>
						</div>
					</div>
					
					<div class="row" > 
						<div class="col-md-12">
								<div class="content" >
						
									<table id="tablePaginacion" class="table table-striped table-bordered" >
										<thead>
											<tr>
															<th>Id</th>
															<th>Nombre</th>
															<th>Estado</th>
															<th>Fecha de Registro</th>
															<th>Pais</th>														
															<th></th>
															<th></th>
											</tr>
										</thead>
										<tbody>
												   
												<c:forEach items="${sessionScope.marcas}" var="x">
													<tr>
														<td>${x.idMarca}</td>
														<td>${x.nombre}</td>
														<td>${x.estado}</td>
														<td>${x.fechaRegistro}</td>													
														<td>${x.pais.nombre}</td>
														<td>
															<button type='button' data-toggle='modal' onclick="editar('${x.idMarca}','${x.nombre}','${x.estado}','${x.pais.idPais}');" class='btn btn-success' style='background-color:hsla(233, 100%, 100%, 0);'>
																<img src='images/edit.gif' id='id_update' width='auto' height='auto' />
															</button>
														</td>
														<td>
															<button type='button' data-toggle='modal' onclick="eliminar('${x.idMarca}');" class='btn btn-success' style='background-color:hsla(233, 100%, 100%, 0);'> 
																<img src='images/delete.gif' width='auto' height='auto' />
															</button>
														</td>
													</tr>
												</c:forEach>
										</tbody>
										</table>	
									
								</div>	
						</div>
					</div>
		 		</form>
		  </div>
  
  	 <div class="modal fade" id="idModalRegistra" >
			<div class="modal-dialog" style="width: 60%">
		
				<!-- Modal content-->
				<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Registro de Marca</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_registra" accept-charset="UTF-8" action="registraMarca" class="form-horizontal"     method="post">
		                    <div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading">
		                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos de la Marca</a></h4>
		                            </div>
		                            <div id="stepOne" class="panel-collapse collapse in">
		                                <div class="panel-body">
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_nombre">Nombre</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_nombre" name="nombre" placeholder="Ingrese el Nombre" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_estado">Estado</label>
		                                        <div class="col-lg-5">							
													<select id="id_reg_estado" name="estado" class='form-control'>
							                            	<option value=" ">[Seleccione]</option>
							                            	<option value="1">Activo</option>   
							                            	<option value="0">Inactivo</option>  
							                         </select>
		                                        </div>
		                                    </div>
		                                   
		                                    
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_pais">Pais</label>
		                                        <div class="col-lg-5">
													<select id="id_reg_pais" name="pais.idPais" class='form-control'>
							                            	<option value=" ">[Seleccione]</option>    
							                         </select>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <div class="col-lg-9 col-lg-offset-3">
		                                        	<button type="submit" class="btn btn-primary">REGISTRA</button>
		                                        </div>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                        
		                    </div>
		                </form>   
				
				</div>
			</div>
		</div>
			
		</div>
  
		 <div class="modal fade" id="idModalActualiza" >
			<div class="modal-dialog" style="width: 60%">
		
				<!-- Modal content-->
				<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Actualiza Marca</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_actualiza" accept-charset="UTF-8"  action="actualizaMarca" class="form-horizontal"     method="post">
		                    <div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading">
		                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos de Marca</a></h4>
		                            </div>
		                            <div id="stepOne" class="panel-collapse collapse in">
		                                <div class="panel-body">
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="ac_idMarca">ID</label>
		                                        <div class="col-lg-5">
		                                           <input class="form-control" id="ac_idMarca" readonly="readonly" name="idMarca" type="text" maxlength="8"/>
		                                        </div>
		                                     </div>
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="ac_nombre">Nombre</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="ac_nombre" name="nombre" placeholder="Ingrese el Nombre" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="ac_estado">Estado</label>
		                                        <div class="col-lg-5">							
													<select id="ac_estado" name="estado" class='form-control'>
							                            	<option value=" ">[Seleccione]</option>
							                            	<option value="1">Activo</option>   
							                            	<option value="0">Inactivo</option>  
							                         </select>
		                                        </div>
		                                    </div>		                                    
		                                   	<div class="form-group">
		                                        <label class="col-lg-3 control-label" for="ac_pais">Pais</label>
		                                        <div class="col-lg-5">
													<select id="ac_pais" name="pais.idPais" class='form-control'>
							                            	<option value=" ">[Seleccione]</option>    
							                         </select>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <div class="col-lg-9 col-lg-offset-3">
		                                        	<button type="submit" class="btn btn-primary">ACTUALIZA</button>
		                                        </div>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                        </div>

		                </form>   
				
				</div>
			</div>
		</div>
			
		</div>
		
		<div class="modal fade" id="idModalElimina" >
					<div class="modal-dialog" style="width: 60%">
				 	
				 	<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header" style="padding: 35px 50px">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4><span class="glyphicon glyphicon-ok-sign"></span> Eliminar Marca</h4>
						</div>
				
						  <div class="modal-footer">
						    <button type="button" id="idBtnElimina" name="modalDe" class="btn btn-primary">ELIMINAR</button>
						    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
						  </div>
					</div>
				</div>
				</div>
				

</div>

<script type="text/javascript">
$("#success-alert").fadeTo(2000, 500).slideUp(500, function(){
    $("#success-alert").slideUp(500);
});
</script>

<script type="text/javascript">
$.getJSON("listaPais", {}, function(data, q,t){
	$.each(data, function(index,item){
		$("#id_reg_pais").append("<option value="+item.idPais +">"+ item.nombre +"</option>");
		$("#ac_pais").append("<option value="+item.idPais +">"+ item.nombre +"</option>");
	});
	
});
</script>

<script type="text/javascript">




function limpiar(){
	$("#id_nombre").val('');
	$("#id_estado").val('');
	$("#id_pais").val('');
}
</script>
<script type="text/javascript">

$("#idBtnElimina").click(function(){
	$("#idFormElimina").submit();
});


function eliminar(id){	
	$('#idModalElimina').modal('show');
	$('#id_elimina').val(id);	
}

function registrar(){	
	$('#idModalRegistra').modal("show");
}

function editar(id,nombre,estado,idPais){	
	$('#ac_idMarca').val(id);
	$('#ac_nombre').val(nombre);
	$('#ac_estado').val(estado);
	$('#ac_pais').val(idPais);
	$('#idModalActualiza').modal("show");
}

$(document).ready(function() {
    $('#tablePaginacion').DataTable();
} );

$('#id_form_registra').bootstrapValidator({
    message: 'This value is not valid',
    feedbackIcons: {
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh'
    },
    fields: {
    	nombre: {
    		selector : '#id_reg_nombre',
            validators: {
                notEmpty: {
                    message: 'El nombre de la marca es un campo obligatorio'
                },
                stringLength :{
                	message:'El nombre es de 2 a 20 caracteres',
                	min : 2,
                	max : 20
                },
                regexp: {
                    regexp: /^[a-zA-Z ]+$/,
                    message: 'El nombre no puede contener signos o numeros'
                }
            }
        },
        estado: {
    		selector : '#id_reg_estado',
            validators: {
                notEmpty: {
                    message: 'Seleccione un estado'
                },
	            
            }
        },
        pais: {
    		selector : '#id_reg_pais',
            validators: {
                notEmpty: {
                    message: 'Seleccione un pais'
                },
	            
            }
        },
        	
    }   
});

$('#id_form_actualiza').bootstrapValidator({
    message: 'This value is not valid',
    feedbackIcons: {
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh'
    },
    fields: {
    	nombre: {
    		selector : '#ac_nombre',
            validators: {
                notEmpty: {
                    message: 'El nombre de la marca es un campo obligatorio'
                },
                stringLength :{ 
                	message:'El nombre es de 2 a 20 caracteres',
                	min : 2,
                	max : 20
                },
                regexp: {
                    regexp: /^[a-zA-Z ]+$/,
                    message: 'El nombre no puede contener signos o numeros'
                }
            }
        },
        estado: {
    		selector : '#ac_estado',
            validators: {
                notEmpty: {
                    message: 'Seleccione un estado'
                },
	            
            }
        },
        pais: {
    		selector : '#ac_pais',
            validators: {
                notEmpty: {
                    message: 'Seleccione un pais'
                },
	            
            }
        },
        	
    }   
});

</script>


</body>
</html>