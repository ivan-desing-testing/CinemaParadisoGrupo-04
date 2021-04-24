<%@ page session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<style>

		.filtro-wrap-mobile{
			display: none  !important;
		}
		
		.filtro-wrap{
			display: block;
			position: relative;
			background-color: var(--rojo);
			border-radius: 0 100px 100px 0;
		    box-shadow: 0 0 10px black;
		}
		
		label{
			width:50%;
		}
		
		.padding-nav > h2{
			text-align:center;
			margin-bottom: 2rem;
			text-shadow: 0 0 10px black;
		}
		
		
		.filtro-scroller{
			position: sticky;
			top:10rem;
			bottom:0;
		}
		
		.background-image{
			z-index: -1;
		   background-image: url(https://www.indecsur.cl/wp-content/uploads/2020/03/272910-desk-laptop.jpg);
		   width: 110%;
		   position: absolute;
		   height: 100%;
		   filter: blur(5px);
		   background-size: contain;
		}
		
		.fondo-pj {
			background-color: rgb(5 31 49 / 69%);
		}
			
		#list-wrap{
			transition: 0.5s;
			display: block;
			flex-direction: column;
		}
		
		.filtro-wrap button{
			border-color: var(--gris);
		}
		
		.filtro-wrap button:hover{
			background-color: var(--gris);
		}
		
		h3,h5,label{
			text-align: center;
		}
		
		h5{
			margin: 0.5vw;
		}
		
		.lista{
			display: grid;
 			 grid-template-columns: repeat(5, 15rem);
		}
		
		#list-wrap-mobile{
			display: none  !important;
		}
		
		.sponsored-bckg{
			z-index: -1;
		    width: 100%;
		    position: absolute;
		    height: 100%;
		    filter: blur(2px);
		    background-repeat: no-repeat;
		    background-size: cover;
		    background-position: center;
		    border-radius: 20px;
		}
					
			
		@media(max-width: 1545px) {
			.lista{
			 	grid-template-columns: repeat(4, 13rem);

			}
	
		}
			
			
		@media(max-width: 1160px) {
			
			.filtro-wrap-mobile{
				display: block  !important;
    			padding: 0 1.5rem;
			}
			
			.filtro-wrap{
				display: none  !important;
			}
			
			#global-wrap{
				display:block !important;
			}
			
			#list-wrap-mobile{
				display: block  !important;
				background-color: var(--gris-claro);
			}
			
			#list-wrap{
				display:none !important;
			}
			
			.background-image{
				width: 100%;
			}
			
			.padding-nav > h2{
				font-size: 2.5rem;
			}
			
			.padding-nav{
			    background-color: rgb(0,0,0, 20%);
			}
			
			.linea-hor{
				border-color: var(--rojo);
				background-color: var(--rojo);
			}
			

		}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"	type="text/javascript"></script>
<script>
	
	$(window).scroll(function () {
	    var lista = document.getElementById("list-wrap");

	    if($(window).scrollTop() > 400){
	    	lista.classList.add("fondo-pj");

	    }else{
	    	lista.classList.remove("fondo-pj");
	    }
		
	})
	
</script>
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
<body>
<jsp:include page="/WEB-INF/views/navbar.jsp"></jsp:include>
<a id="top"></a>
	<div class="background-image"></div>
	<div class="padding-nav">
		<h2>Proyectos</h2>
		<div id="global-wrap" class="d-flex">
	
			<!--  Filtros -->
			<div class="filtro-wrap p-4 w-25">
				<div class="filtro-scroller">
					<h3 class="page-header mb-4" >Filtros</h3>
					<hr class="m-3 linea-hor">
					<form:form class="my-5" action="list" method="POST" modelAttribute="projectsFiltered">
						<div class="form-group d-flex justify-content-between align-items-center my-4">
							<form:label class="form-control-label" path="title">T&iacutetulo:</form:label>
							<form:input class="form-control" style="width:60%" type="text" placeholder="Titulo" path="title" />
						</div>
						
						<div class="form-group d-flex justify-content-between align-items-center my-4">
							<form:label class="form-control-label" path="genre">G&eacutenero:</form:label>
							<form:select class="form-control" style="width:60%" path="genre">
								<form:option value="" selected="true">Selecciona un g&eacutenero</form:option>
								<c:forEach items="${genres}" var="genre">
									<form:option value="${genre}">${genre}</form:option>
								</c:forEach>
							</form:select>
						</div>
		
										
						<div class="form-group d-flex justify-content-center align-items-center my-4">
							<form:button class="boton btn rounded-pill">Filtrar</form:button>
						</div>
					</form:form>
				</div>
			</div>
			
			<!--  Filtros Mobile -->
			<div class="filtro-wrap-mobile w-100">
				<div class="filtro-scroller">
					<hr class="m-3 linea-hor">
					<h3 class="page-header mb-4" >Filtros</h3>
					<form:form action="list" method="POST" modelAttribute="projectsFiltered">
						<div class="form-group d-flex justify-content-between align-items-center my-4">
							<form:label class="form-control-label" path="title">T&iacutetulo:</form:label>
							<form:input class="form-control" style="width:60%" type="text" placeholder="Titulo" path="title" />
						</div>
						
						<div class="form-group d-flex justify-content-between align-items-center my-4">
							<form:label class="form-control-label" path="genre">G&eacutenero:</form:label>
							<form:select class="form-control" style="width:60%" path="genre">
								<form:option value="" selected="true">Selecciona un g&eacutenero</form:option>
								<c:forEach items="${genres}" var="genre">
									<form:option value="${genre}">${genre}</form:option>
								</c:forEach>
							</form:select>
						</div>
				
										
						<div class="form-group d-flex justify-content-center align-items-center my-4">
							<form:button class="boton btn rounded-pill">Filtrar</form:button>
						</div>
					</form:form>
				</div>
			</div>
	
			<!--  Listado  -->
			<div id="list-wrap" class="d-flex justify-content-center align-items-center w-75 padding-footer">
			
				<c:if test="${ sponsoredProjects.size()>0 }">
					<div class="w-100">
						<c:forEach items="${ sponsoredProjects }" var="sponsoredProject">
							<div onclick="location.href='/projects/show/${sponsoredProject.id}'" class="d-flex justify-content-center flex-column element-sponsored">
								<div class="sponsored-bckg"  style="background-image:url('${sponsoredProject.photo}')"></div>
								<h4>${sponsoredProject.title}</h4>
								<p>${sponsoredProject.description}</p>
							</div>
						</c:forEach>
					</div>
				</c:if>
			
				<div class="lista">
		      		<c:forEach items="${projectsPro}" var="projectPro">
		      			<div class="element-wrapper element-pro d-flex flex-column align-items-center justify-content-evenly" onClick="location.href='/projects/show/${projectPro.id}'">
							<img class="rounded-circle" src="${projectPro.photo}">
			      			<h5>${projectPro.title}</h5>
			      		</div>
		      		</c:forEach>
		      		<c:forEach items="${projectsNoPro}" var="projectNoPro">
		      			<div class="element-wrapper d-flex flex-column align-items-center justify-content-evenly" onClick="location.href='/projects/show/${projectNoPro.id}'">
							<img class="rounded-circle" src="${projectNoPro.photo}">
			      			<h5>${projectNoPro.title}</h5>
			      		</div>
		      		</c:forEach>
		      	</div>
			</div>
			
			<!-- Listado Mobile -->
			<div id="list-wrap-mobile" class="padding-footer">
				
				<c:if test="${ sponsoredProjects.size()>0 }">
					<div class="w-100" style="padding-top:1rem">
						<c:forEach items="${ sponsoredProjects }" var="sponsoredProject">
							<div onclick="location.href='/projects/show/${sponsoredProject.id}'" class="d-flex justify-content-center flex-column element-sponsored">
								<div class="sponsored-bckg"  style="background-image:url('${sponsoredProject.photo}')"></div>
								<h4>${sponsoredProject.title}</h4>
							</div>
						</c:forEach>
					</div>
				</c:if>
			
			
				<c:forEach items="${projectsPro}" var="projectPro">
		      			<div class="element-wrapper d-flex justify-content-between align-items-center w-100 " onClick="location.href='/projects/show/${projectPro.id}'">
							<img class="rounded-circle" src="${projectPro.photo}">
			      			<h5>${projectPro.title}</h5>
			      		</div>
  							<hr class="m-3 linea-hor linea-hor-pro">
	      		</c:forEach>
	      		<c:forEach items="${projectsNoPro}" var="projectNoPro">
		      			<div class="element-wrapper d-flex justify-content-between align-items-center w-100 " onClick="location.href='/projects/show/${projectNoPro.id}'">
							<img class="rounded-circle" src="${projectNoPro.photo}">
			      			<h5>${projectNoPro.title}</h5>
			      		</div>
  							<hr class="m-3 linea-hor">
	      		</c:forEach>
			</div>
			
			<div id="boton-up" onClick="location.href='/projects/list#top'">
				<span>^</span>
			</div>
			
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/footer.jsp" ></jsp:include>
	
</body>
</html>