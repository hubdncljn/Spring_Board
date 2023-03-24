<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
</head>
<body>
<h1>게시글 등록</h1>
	<form action="/board/regist" method="post">
	  <div class="form-group">
	    <label for="title">제목</label>
	    <input type="text" id="title" name="title">
	  </div>
	  <div class="form-group">
	    <label for="content">내용</label>
	    <input type="text" id="content" name="content">
	  </div>
	  <div class="form-group">
	    <label for="writer">작성자</label>
	    <input type="text" id="writer" name="writer">
	  </div>
	  <button type="submit">등록</button>
	</form>
</body>
</html>