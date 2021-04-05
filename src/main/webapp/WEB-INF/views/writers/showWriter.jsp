<%@ page session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html class="h-100">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
	crossorigin="anonymous">

<title>Writer</title>
</head>
<body class="h-100" style="background-color: #272727; color: white">
	<!-- Header Historia -->
	<div class="d-flex justify-content-between p-3" style="height:15%">
			<div class="d-flex align-items-center" style="width:50%">
				<div  class="rounded-circle d-flex" style="overflow:hidden;height:100%;width:12vh">
					<img src="${writer.photo}" style="width:100%;height:100%;object-fit:cover">			
				</div>
				<div class="py-3 mx-3" style="width:40%">
					<h2>${writer.user.username}</h2>
				</div>
			</div>
	</div>
	<!-- Info general Historia -->
	<div>
		<div class="container-fluid" style="background-color:#4c4c4c; padding:1%">
			<h3 style="margin:0">Datos</h3>
		</div>
		
		<div class="d-flex justify-content-between" style="padding: 2% 5%;height:40vh">
			<!-- Datos -->
			<div style="width:150%">
				<div style="margin:1% 0">
					<div class="d-flex flex-wrap ">
						<h5 class="p-2 rounded-pill" style="background-color:#3e3e3e">Username</h5>
					</div>
					<p style="margin-left: 3%">${writer.user.username}</p>
				</div>
				<div style="margin:1% 0">
					<div class="d-flex flex-wrap ">
						<h5 class="p-2 rounded-pill" style="background-color:#3e3e3e">Nombre</h5>
					</div>
					<p style="margin-left: 3%">${writer.name}</p>
				</div>
				<div>
					<div class="d-flex flex-wrap ">
						<h5 class="p-2 rounded-pill" style="background-color:#3e3e3e">DescripciÃ³n</h5>
					</div>
					<p style="margin-left: 3%">${writer.description}</p>
				</div>
				<c:choose>
					<c:when test="${sameWriter == true}">
						<button class="btn" onClick="location.href='/stories/create'" style="color:white;background-color: #af3248">Crear nueva historia</button>
					</c:when>
				</c:choose>
				
			</div>
			<div style="padding: 2% 0;width:30%;margin:auto">
			<c:forEach items="${stories}" var="story">
				<div class="d-flex align-items-center justify-content-evenly" style="height:15vh; margin: 1% 0">
					<div style="width:10vh;height:10vh;overflow:hidden" class="rounded-circle">
						<img src="https://www.psicoactiva.com/wp-content/uploads/puzzleclopedia/Libros-codificados-300x262.jpg" onClick="location.href='/stories/show/${story.id}'" style="width:100%;height:100%;object-fit:cover">
					</div>
					<div style="margin-left: 12%">
						<h5>${story.title}</h5>
						<p>${story.genre}</p>
					</div>
				</div>
				
				
			</c:forEach>
		</div>
			
		</div>
	</div>
</body>
</html>