<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>이미지 업로드</title>
</head>
<body>
	<form action="./upload" method="post" enctype="multipart/form-data">
		<input type="file" name="imageFile"><br>
		<input type="submit" value="전송">
	</form>
	<img src = "resources/imgs/adidas.png">
		<form action="upload2" method="post" enctype="multipart/form-data">
		<input type="file" name="imageFile"><br>
		<input type="submit" value="전송전송">
	</form>
</body>
</html>