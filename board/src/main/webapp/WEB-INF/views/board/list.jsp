<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/resources/include/head.jsp" />
<script>
	$(document).ready(function() {
		$('header .header .menu li:nth-child(1)').addClass('on');
	});
</script>
<section class="">
	<div class="container ">
		<div class="title clearfix">
			<h1 class="font_title">게시판</h1>
		</div>
		<div class="has_fixed_title contwrap">
			<form action="/board/list">
				<div class="clearfix2 search_box">
					<p>총 ${totalCount }</p>
					<div class="clearfix2 input_box">
						<input type="text" placeholder="제목 검색" name="keyword" value="${pageMaker.page.keyword }">
						<button type="submit" class="btn border_btn">검색</button>
					</div>
				</div>
			</form>
			<table class="list_table table_fixed">
				<colgroup>
					<col width="70%">
					<col width="10%">
					<col width="10%">
					<col width="10%">
				</colgroup>
				<thead>
					<tr class="tr_center">
						<th>제목</th>
						<th>작성자</th>
						<th>조회수</th>
						<th>등록일</th>
					</tr>
				</thead>
				<c:choose>
					<c:when test="${list.size() ne 0 }">
						<tbody>
							<c:forEach items="${list }" var="bvo">
								<tr class="tr_center" onclick="location.href='/board/detail?bno=${bvo.bno }'">
									<td class="clearfix comment_txt">
										<p class="ellipsis">${bvo.title }</p> <span>(0)</span>
									</td>
									<td>${bvo.writer }</td>
									<td>${bvo.readcount }</td>
									<td><fmt:formatDate pattern="yyyy-MM-dd" value="${bvo.regdate}" /></td>
								</tr>
							</c:forEach>
						</tbody>
					</c:when>
					<c:otherwise>
						<tbody>
							<tr class="nodata">
								<td colspan="4" class="centerT">데이터가 없습니다.</td>
							</tr>
						</tbody>
					</c:otherwise>
				</c:choose>
			</table>
			<div class="">
				<button type="button" class="submit_btn" onclick="location.href='/board/regist'">글쓰기</button>
			</div>
			<div class="pagination">
				<ul class="clearfix">
					<!-- 이전페이지 버튼 -->
					<c:if test="${pageMaker.prev}">
						<li>
							<a href="/board/list?pageNum=${pageMaker.startPage-1}&keyword=${pageMaker.page.keyword }">
								<img src="/resources/img/back_arrow.png" alt="전 페이지로">
							</a>
						</li>
					</c:if>
					<!-- 각 페이지 버튼 -->
					<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
						<li>
							<a href="/board/list?pageNum=${num}&keyword=${pageMaker.page.keyword }" class="${pageMaker.page.pageNum == num ? "active":"" }">${num}</a>
						</li>
					</c:forEach>
					<!-- 다음페이지 버튼 -->
					<c:if test="${pageMaker.next}">
						<li>
							<a href="/board/list?pageNum=${pageMaker.endPage + 1 }&keyword=${pageMaker.page.keyword }">
								<img src="/resources/img/front_arrow.png" alt="다음 페이지로">
							</a>
						</li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
</section>
<jsp:include page="/resources/include/footer.jsp" />