<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<style>
.pageInfo {
	list-style: none;
	display: inline-block;
	margin: 50px 0 0 100px;
}
.pageInfo li {
	float: left;
	font-size: 20px;
	margin-left: 25px;
	padding: 7px;
	font-weight: 500;
}
a:link {
	color: black;
	text-decoration: none;
}
a:visited {
	color: black;
	text-decoration: none;
}
a:hover {
	color: black;
	text-decoration: underline;
}
.active {
	background-color: #cdd5ec;
}
 table {
    width: 50%;
    border: 1px solid black;
    border-collapse: collapse;
  }
  th, td {
    border: 1px solid black;
    padding: 10px;
    text-align: center;
  }
</style>
</head>
<body>
<h2 class="float-left">게시판</h2>
<table class="table table-hover">
	<thead>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>내용</th>
			<th>등록일</th>
			<th>수정일</th>
		</tr>
	</thead>
	<c:choose>
		<c:when test="${list.size() ne 0 }">
			<tbody>
				<c:forEach items="${list }" var="bvo">
					<tr>
						<td>${bvo.bno }</td>
						<td><a href="/board/detail?bno=${bvo.bno }">${bvo.title }</a></td>
						<td>${bvo.writer }</td>
						<td>${bvo.content }</td>
						<td><fmt:formatDate pattern="yyyy.MM.dd"
								value="${bvo.regdate}" /></td>
						<td><fmt:formatDate pattern="yyyy.MM.dd"
								value="${bvo.moddate}" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</c:when>
		<c:otherwise>
			<tbody>
				<tr>
					<td colspan="6" class="text-center">
						<h3>등록된 게시글이 없습니다.</h3>
					</td>
				</tr>
			</tbody>
		</c:otherwise>
	</c:choose>
</table>
<div class="pageInfo_wrap">
	<div class="pageInfo_area">
		<ul id="pageInfo" class="pageInfo">
			<!-- 이전페이지 버튼 -->
			<c:if test="${pageMaker.prev}">
				<li class="pageInfo_btn previous"><a
					href="/board/list?pageNum=${pageMaker.startPage-1}">이전</a></li>
			</c:if>
			<!-- 각 번호 페이지 버튼 -->
			<c:forEach var="num" begin="${pageMaker.startPage}"
				end="${pageMaker.endPage}">
				<li class="pageInfo_btn ${pageMaker.page.pageNum == num ? "active":"" }"><a
					href="/board/list?pageNum=${num}">${num}</a></li>
			</c:forEach>
			<!-- 다음페이지 버튼 -->
			<c:if test="${pageMaker.next}">
				<li class="pageInfo_btn next"><a
					href="/board/list?pageNum=${pageMaker.endPage + 1 }">다음</a></li>
			</c:if>
		</ul>
	</div>
</div>
<script>
	$(document).ready(function() {

		
	});
</script>
</body>
</html>