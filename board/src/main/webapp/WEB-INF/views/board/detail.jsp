<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/resources/include/head.jsp" />
<script>
	$(document).ready(function() {
		$('header .header .menu li:nth-child(1)').addClass('on');
		$("#delBtn").on("click", function() {
			$("#delForm").submit();
		});
	});
</script>
	<section class="">
		<div class="container">
			<div class="title clearfix">
				<h1 class="font_title">게시판</h1>
			</div>
			<div class="has_fixed_title detail_wrap">
				<form action="/board/remove" id="delForm" method="post">
					<input type="hidden" name="bno" id="bno" value="${bvo.bno }">
					<div class="detail_box">
						<div class="top_box clearfix2">
							<p>${bvo.title }</p>
							<ul class="clearfix">
								<li>${bvo.writer }</li>
								<li>${bvo.readcount }</li>
								<li><fmt:formatDate pattern="yyyy-MM-dd" value="${bvo.regdate}" /></li>
							</ul>
						</div>
						<div class="bottom_box">
							<p>${bvo.content }
							</p>
						</div>
						
						<!-- 파일첨부했을시에 보임▼-->
						<c:if test="${bvo.flist.size() > 0 }">
							<div class="file_box">
								<p>첨부파일</p>
								<ul class="clearfix">
									<c:forEach items="${bvo.flist }" var="fvo">
										<li>
											<a href="/resources/upload/temp/${fvo.savedir }/${fvo.uuid}_${fvo.fname}" download="${fvo.fname}">${fvo.fname }</a>
										</li>
									</c:forEach>
								</ul>
							</div>
						</c:if>
						
						<div class="btn_box rightT">
							<button type="button" class="submit_btn" onclick="location.href='/board/modify?bno=${bvo.bno }'">수정</button>
							<button type="button" class="btn border_btn" id="delBtn">삭제</button>
							<button type="button" class="btn border_btn" onclick="location.href='/board/list'">목록</button>
						</div>
					</div>
					<div class="comment_box">
						<p><span class="point_txt">2</span>개의 댓글</p>
						<ul class="comment_ul">
							<li class="clearfix">
								<div class="img_box">
									<img src="/resources/img/sample_profile.jpg" alt="프로필 이미지">
								</div>
								<div class="txt_box">
									<div class="clearfix">
										<p>관리자</p>
										<p class="date">2020-11-21 14:56</p>
									</div>
									<p>댓글의 내용입니다. 댓글은 최대 200자까지만 작성 가능합니다. 길어진다고 하더라도 말줄임은 없습니다. 200자는 최대한 표현이 가능하니까요.댓글의 내용입니다. 댓글은 최대 200자까지만 작성 가능합니다. 길어진다고 하더라도 말줄임은 없습니다. 200자는 최대한 표현이 가능하니까요.댓글의 내용입니다. 댓글은 최대 200자까지만 작성 가능합니다. 길어진다고 하더라도 말줄임은 없습니다. 200자는 최대한 표현이 가능하니까요.</p>
								</div>
								<!-- 자신이 작성한댓글일때만 삭제버튼 보임▼-->
								<button type="button" class="delt_btn">
									<img src="/resources/img/popclose.png" alt="삭제 아이콘">
								</button>
							</li>
							<li class="clearfix">
								<div class="img_box">
									<img src="/resources/img/sample_profile.jpg" alt="프로필 이미지">
								</div>
								<div class="txt_box">
									<div class="clearfix">
										<p>관리자</p>
										<p class="date">2020-11-21 14:56</p>
									</div>
									<p>댓글의 내용입니다. 댓글은 최대 200자까지만 작성 가능합니다. 길어진다고 하더라도 말줄임은 없습니다.</p>
								</div>
								<!-- 자신이 작성한댓글일때만 삭제버튼 보임▼-->
								<button type="button" class="delt_btn">
									<img src="/resources/img/popclose.png" alt="삭제 아이콘">
								</button>
							</li>
						</ul>
						<div class="input_wrap clearfix2">
							<input type="text" placeholder="댓글을 입력하세요 (최대 200자)" maxlength="200">
							<button type="button" class="btn border_btn">댓글 등록</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</section>
<jsp:include page="/resources/include/footer.jsp" />