<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>Home</title>
</head>
<body>
	<h1>Hello world!</h1>

	<c:choose>
		<c:when test="${fileInfo != null }">
		upload complete 파입업로드 성공
		<ul>
				<li>파일 ID : ${fileInfo.id }</li>
				<li>저장된 파일 이름 : ${fileInfo.fileName }</li>
				<li>파일 길이 : ${fileInfo.contentLength }</li>
				<li>MIME 타입 : ${fileInfo.contentType }</li>
			</ul>
			<p>contextPath: ${pageContext.request.contextPath} and imagefileid : ${fileInfo.id}</p>

			<img src=${pageContext.request.contextPath}/resources/${fileInfo.fileName}>
		</c:when>
		<c:otherwise>
			<span class="failed">file upload fail</span>
		</c:otherwise>
	</c:choose>
</body>
</html>
