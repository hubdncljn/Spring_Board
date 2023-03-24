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
		<div class="container">
			<div class="title clearfix">
				<h1 class="font_title">게시판</h1>
			</div>
			<div class="has_fixed_title detail_wrap">
				<form action="/board/regist" method="post">
					<div class="write_box">
						<div>
							<input type="text" id="title" name="title" placeholder="제목(최대 100자)" maxlength="100">
							<input type="text" id="writer" name="writer" placeholder="작성자" maxlength="20" style="margin-top: 10px">
							<div class="file_up_box clearfix">
								<input type="file" id="file_up">
								<label for="file_up">파일 선택</label>
								<p class="font_13 gray_txt">※ 파일은 최대 3개까지 총 20MB 까지 가능합니다.</p>
							</div>
							<ul class="clearfix file_up_list">
								<li class="clearfix">
									<p>이미지.jpg</p>
									<button type="button"></button>
								</li>
								<li class="clearfix">
									<p>문서123.hwp</p>
									<button type="button"></button>
								</li>
								<li class="clearfix">
									<p>이미지.jpg</p>
									<button type="button"></button>
								</li>
							</ul>
						</div>
						<div>
							<textarea name="content" id="content" cols="30" rows="10"></textarea>
							<ul class="check_wrap mt20">
								<li class="mb10">
									<input type="checkbox" id="notice_check"><label for="notice_check">공지사항으로 등록</label>
								</li>
								<li>
									<input type="checkbox" id="top_check"><label for="top_check">상단 고정게시글로 등록</label>
								</li>
							</ul>
						</div>
					</div>
					<div class="btn_wrap centerT mt20">
						<button type="submit" class="submit_btn">저장</button>
						<button type="button" class="submit_btn border" onclick="location.href='/board/list'">목록</button>
					</div>
				</form>
			</div>
		</div>
	</section>
<jsp:include page="/resources/include/footer.jsp" />