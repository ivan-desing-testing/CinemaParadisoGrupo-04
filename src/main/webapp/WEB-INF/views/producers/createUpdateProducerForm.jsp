<%@ page session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page contentType="text/html; charset=UTF-8" %>

<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
	crossorigin="anonymous">
</head>
<style>
		.background-image{
			z-index: -1;
		   background-image: url(https://images.wallpaperscraft.com/image/sound_recording_studio_music_166147_3840x2160.jpg);
		   width: 100%;
		   position: absolute;
		   height: 100%;
		   filter: blur(5px);
		   background-size: contain;
		}
		
		.form-wrapper{
			display: flex;
			flex-direction: column;
			align-items: center;
			padding: 1.5rem;
			width:30rem;
			height: fit-content;
			box-shadow: 0 0 10px black;
			background-color: var(--gris);
			border-radius: 20px;
			margin: 1rem 0 2rem 0;
		}
		
		
		form input, form textarea{
			width: 60% !important;
		}
		
		form div{
			margin: 0.5rem 0;
		}
		
		form {
			margin: 0;
		}
		
		form label{
			font-weight: bold;
		}
	
		
		@media(max-width: 1160px) {
			
			.padding-nav{
				padding-top: 6rem !important;
			}
		
			.form-wrapper{
				box-shadow: unset;
				border-radius: unset;
				margin: unset;
			}
		
		}
		
</style>
<body>
	<jsp:include page="/WEB-INF/views/navbar.jsp"></jsp:include>
	<script>
		function photoChanged(value){
		   if(value.length!=0){
			   $("#photob").hide();
		   }else{
			   $("#photob").show();
		   }
		}
		function photobChanged(value){
		   if(value.length!=0){
			   $("#photoA").attr('style', 'display: none !important');
		   }else{
			   $("#photoA").show();
		   }
		}
		
	</script>
	<div class="background-image"></div>

	<div class="padding-nav padding-footer d-flex justify-content-center align-items-center">

		<div class="form-wrapper">
			<h3>Crear productora</h3>
	
			<form:form method="POST" action="create" modelAttribute="producer" style="width:100%" enctype="multipart/form-data">
                <div class="d-flex justify-content-between align-items-center">
					<form:label class="rounded-pill form-control-label" path="user.username">Usuario</form:label>
					<form:input class="form-control" value="${producer.user.username}" placeholder="Usuario" type="text" path="user.username"></form:input>
				</div>
				<form:errors style="color:red" path="user.username"/>
						
				<div class="d-flex justify-content-between align-items-center">
					<div class="d-flex flex-wrap ">
						<form:label class="rounded-pill form-control-label" path="user.password">Clave</form:label>
					</div>
					<form:input class="form-control" value="${producer.user.password}" placeholder="Clave" type="password" path="user.password"></form:input>
				</div>
				<form:errors style="color:red" path="user.password"/>
										
				<div class="d-flex justify-content-between align-items-center">
					<div class="d-flex flex-wrap ">
						<form:label class="rounded-pill form-control-label" path="user.email">Email</form:label>
					</div>
					<form:input class="form-control" value="${producer.user.email}" placeholder="example@example.com" type="text" path="user.email"></form:input>
				</div>
				<form:errors style="color:red" path="user.email"/>

				<div class="d-flex justify-content-between align-items-center">
					<div class="d-flex flex-wrap ">
						<form:label class="rounded-pill form-control-label" path="name">Nombre</form:label>
					</div>
					<form:input class="form-control" value="${producer.name}"	placeholder="Nombre" type="text" path="name"></form:input>
				</div>
				<form:errors style="color:red" path="name" />
				
				<div class="d-flex justify-content-between align-items-center">
					<div class="d-flex flex-wrap ">
						<form:label class="rounded-pill form-control-label" path="surName">Apellidos</form:label>
					</div>
					<form:input class="form-control" value="${producer.surName}" placeholder="Apellidos" type="text" path="surName"></form:input>
				</div>
				<form:errors style="color:red" path="surName" />
				
				<div class="d-flex justify-content-between align-items-center">
					<div class="d-flex flex-wrap ">
						<form:label class="rounded-pill form-control-label" path="description">Resumen</form:label>
					</div>
					<form:textarea class="form-control" value="${producer.description}"
						placeholder="Descripcion" type="text" path="description"></form:textarea>
				</div>
				<form:errors style="color:red" path="description" />
				
				<div id="photoA" class="d-flex justify-content-between align-items-center">
					<div class="d-flex flex-wrap ">
						<form:label class="rounded-pill form-control-label" path="photo">A&ntildeade tu foto</form:label>
					</div>
					<form:input onchange="photoChanged(value)" class="form-control" value="${producer.photo}"
						placeholder="url" type="text" path="photo"></form:input>
				</div>
				<form:errors style="color:red" path="photo" />
				<div id="photob" style="width: 45rem">
					<input onchange="photobChanged(value)" class="form-control" type="file" name="file"></input>
				</div>
				
				<div class="d-flex align-items-center terminos-input">
					<label>
						<input type="checkbox" name="cb-terminosservicio" required> Acepto los  <a href="/terms" target="_blank">T&eacuterminos y Condiciones de Uso</a>
					</label>
				</div>
				
				<div class="d-flex justify-content-center align-items-center" style="margin-top: 2rem;">
					<form:button class="boton btn rounded-pill">Guardar</form:button>
				</div>
			</form:form>
		</div>

	</div>
	<jsp:include page="/WEB-INF/views/footer.jsp" ></jsp:include>
</body>
</html>