<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/resources/include/head.jsp" />
<script>
	$(document).ready(function() {
		$('header .header .menu li:nth-child(1)').addClass('on');
		
		$('#regBtn').click(function(){
			if($("#title").val() == "" || $("#title").val() == null){
			    alert("제목을 입력해주세요.");
			    $("#title").focus();
			    return false;
			}
			if($("#writer").val() == "" || $("#writer").val() == null){
			    alert("작성자를 입력해주세요.");
			    $("#writer").focus();
			    return false;
			}
			if($("#content").val() == "" || $("#content").val() == null){
			    alert("내용을 입력해주세요.");
			    $("#content").focus();
			    return false;
			}
		});
		
		// fileUpload
		let regExp = new RegExp("\.(exe|sh|bat|js|msi|dll)$"); // 허용되지 않는 파일 형식
		let maxSize = 1048576; // 1 MB
		function fileValidation(fname, fsize) {
			if(regExp.test(fname)) { // 파일 형직 체크
				alert(fname + "(은)는 허용되지 않은 파일 형식입니다. ");
				return false;
			}else if(fsize > maxSize) { // 파일 크기 체크
				alert("1MB 이하의 파일만 허용됩니다!");
				return false;
			}else{
				return true;
			}
		}
		
		$(document).on("change", "#files", function() {
			$("button[type=submit]").attr("disabled", false);
			let formObj = $("#files");
			let fileObjs = formObj[0].files; // file 객체들
			let fileZone = $("#fileZone");

			fileZone.html("");
			
			var count = 0;
			for (let fobj of fileObjs) {
			      let li = '<li class="clearfix">';
			      if(fileValidation(fobj.name, fobj.size)){
			         // 성공
			         //li += '<p>' + fobj.name + '</p><button type="button" id="fileDel_'+count+'" class="fileDel"></button>';
			         li += '<p>' + fobj.name + '</p><button type="button" id="fileDel" class="fileDel"></button>';
			         count++;
			      }else{
			         // 실패
			         return false;
			      }
			      fileZone.append(li);
			   }
		});
		
		$(document).on("click", ".fileDel", function() {
		    	$(this).parent(".clearfix").remove();
		    	$('#files').val("");
		});
		
		$(document).on("change", "#notice", function() {
			if($("input[name='notice']:checked").val() == null){
				$("#notice").val("0");
		    }else if($("input[name='notice']:checked").val() != null){
		    	$("#notice").val("1");
		    }
		});
	});
	
</script>
<section class="">
		<div class="container">
			<div class="title clearfix">
				<h1 class="font_title">게시판</h1>
			</div>
			<div class="has_fixed_title detail_wrap">
				<form action="/board/regist" method="post" enctype="multipart/form-data">
					<div class="write_box">
						<div>
							<input type="text" id="title" name="title" placeholder="제목(최대 100자)" maxlength="100">
							<input type="text" id="writer" name="writer" placeholder="작성자" maxlength="20" style="margin-top: 10px">
							<div class="file_up_box clearfix">
								<input type="file" id="files" name="files">
								<label for="files">파일 선택</label>
								<p class="font_13 gray_txt">※ 파일은 최대 3개까지 총 20MB 까지 가능합니다.</p>
							</div>
							<ul class="clearfix file_up_list" id="fileZone">
								<!-- fileUpload -->
							</ul>
						</div>
						<div>
							<textarea name="content" id="content" cols="30" rows="10"></textarea>
							<ul class="check_wrap mt20">
								<li class="mb10">
									<input type="checkbox" id="notice" value="1" name="notice"><label for="notice">공지사항으로 등록</label>
								</li>
								<li>
									<input type="checkbox" id="top_check" name="notice"><label for="top_check">상단 고정게시글로 등록</label>
								</li>
							</ul>
						</div>
					</div>
					<div class="btn_wrap centerT mt20">
						<button type="submit" class="submit_btn" id="regBtn">저장</button>
						<button type="button" class="submit_btn border" onclick="location.href='/board/list'">목록</button>
					</div>
				</form>
			</div>
		</div>
	</section>
<jsp:include page="/resources/include/footer.jsp" />