<%@ page session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
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
		    padding-right: 0.6rem;
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
		   background-image: url(https://www.teahub.io/photos/full/55-553913_photo-wallpaper-background-wallpaper-blur-book-book-background.jpg);
		   width: 110%;
		   position: absolute;
		   height: 100%;
		   filter: blur(5px);
		   background-size: contain;
		}
		
		.fondo-w {
			background-color: rgb(49 28 5 / 69%);
		}
			
		#list-wrap{
			transition: 0.5s;
			display: block;
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
<script>
	
	$(window).scroll(function () {
	    var lista = document.getElementById("list-wrap");

	    if($(window).scrollTop() > 400){
	    	lista.classList.add("fondo-w");

	    }else{
	    	lista.classList.remove("fondo-w");
	    }
		
	})
	
</script>
<a id="top"></a>
	<div class="background-image"></div>
	<div class="padding-nav">
		<h2>Escritores</h2>
		<div id="global-wrap" class="d-flex">
	
			<!--  Filtros -->
			<div class="filtro-wrap p-4 w-25">
				<div class="filtro-scroller">
					<h3 class="page-header mb-4" >Filtros</h3>
					<hr class="m-3 linea-hor">
					<form:form class="my-5" action="list" method="POST" modelAttribute="writersFiltered">
						<div class="form-group d-flex justify-content-between align-items-center my-4">
							<form:label class="form-control-label" path="user.username">Nombre de usuario:</form:label>
							<form:input class="form-control" style="width:60%" type="text" path="user.username" />
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
					<form:form action="list" method="POST" modelAttribute="writersFiltered">
						<div class="form-group d-flex justify-content-between align-items-center my-4">
							<form:label class="form-control-label" path="user.username">Nombre de usuario:</form:label>
							<form:input class="form-control" style="width:60%" type="text" path="user.username" />
						</div>
		
										
						<div class="form-group d-flex justify-content-center align-items-center my-4">
							<form:button class="boton btn rounded-pill">Filtrar</form:button>
						</div>
					</form:form>
				</div>
			</div>
	
			<!--  Listado  -->
			<div id="list-wrap" class="d-flex justify-content-center w-75 padding-footer">
				<div class="lista">
		      		<c:forEach items="${writers}" var="writers">
			      		<c:if test="${writers.user.enabled}">
			      			<div class="element-wrapper d-flex flex-column align-items-center justify-content-evenly" onClick="location.href='/writers/show/${writers.id}'">
								<img class="rounded-circle" src="${writers.photo}">
				      			<h5>${writers.user.username}</h5>
				      		</div>
				      	</c:if>
		      		</c:forEach>
		      		
		      		<sec:authorize access="hasAuthority('admin')">
		      
		
		      		<h2>Escritores Desactivados</h2>
		      		
		      		<c:forEach items="${writersDisabled}" var="writerDisabled">
			      			<div class="element-wrapper d-flex flex-column align-items-center justify-content-evenly" onClick="location.href='/writers/show/${writerDisabled.id}'">
								<img class="rounded-circle" src="${writerDisabled.photo}">
				      			<h5>${writerDisabled.user.username}</h5>
				      		</div>
		      		</c:forEach>
		      	
			
		      	</sec:authorize>
		      	</div>
			</div>
			
			<!-- Listado Mobile -->
			<div id="list-wrap-mobile" class="padding-footer">
				<c:forEach items="${writers}" var="writers">
		      		<c:if test="${writers.user.enabled}">
		      			<div class="element-wrapper d-flex justify-content-between align-items-center w-100 " onClick="location.href='/writers/show/${writers.id}'">
							<img class="rounded-circle" src="${writers.photo}">
			      			<h5>${writers.user.username}</h5>
			      		</div>
  							<hr class="m-3 linea-hor">
    		
			      	</c:if>
	      		</c:forEach>
			</div>
			
			<div id="boton-up" onClick="location.href='/writers/list#top'">
				<span>^</span>
			</div>
			
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/footer.jsp" ></jsp:include>
	
</body>
</html>