<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">

    <title>Lista de Mensajes</title>
</head>
<body>
    <div class="container mt-4">
        <table class="table">
            <thead>
                <tr>
                    <th>ASUNTO</th>
                    <th>FECHA</th>
                    <th>ID DEL EMISOR</th>
                    <th>ID DEL RECEPTOR</th>
                </tr>
            </thead>
            
            <tbody>
                <c:forEach items="${messages}" var="message">
                <tr>
                  <td><c:out value="${message.issue}" /></td>
				  <fmt:formatDate value="${message.date}" type="date" pattern="yyyy/MM/dd HH:mm" var="date"/>
				  <td><c:out value="${date}" /></td>
				  <td>
				  <td><c:out value="${message.emisor_id}" /></td>
				  <td><c:out value="${message.receptor_id}" /></td>
				  <spring:url value="/messages/show/{messageId}" var="showUrl">
				  <spring:param name="messageId" value="${message.id}"/>
				  <a href="${fn:escapeXml(showUrl)}" class="btn btn-danger">Mostrar</a>
				  
				 </spring:url>
				 
				 <spring:url value="/messages/delete/{messageId}" var="deleteUrl">
				<spring:param name="messageId" value="${message.id}"/>
				<a href="${fn:escapeXml(deleteUrl)}" class="btn btn-danger">Borrar</a>
			
				</spring:url>
                </tr>
                </c:forEach>
            </tbody>
        </table>
        
		<spring:url value="/messages/create/{userId}" var="createUrl">
		<spring:param name="userId" value="${user.id}"/>
		</spring:url>
	
		<a href="${fn:escapeXml(createUrl)}" class="btn btn-danger">Crear</a>
   	    </div>
   	    
     	<button class="btn btn-default" onclick="location.href = '/';">Volver</button>    		
    
    
</body>
</html>