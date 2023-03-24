//파일업로드 네임
var fileTarget = $('.upload-hidden'); 
fileTarget.on('change', function(){
  if(window.FileReader){ // modern browser 
	var filename = $(this)[0].files[0].name;
  }else { // old IE 
	var filename = $(this).val().split('/').pop().split('\\').pop();
  } 
  $(this).siblings('.upload-name').val(filename).css({'color':'#323232'});

});

$(document).ready(function(){
	$('.header .profile_box').click(function(){
		$('.profile_pop').slideToggle();
	});
	$('section').click(function(){
		$('.profile_pop').slideUp();
	});

	$('.pop_close').click(function(){
		$('.pop_wrap').hide();
	});

	$('.pop_dim').click(function(){
		$('.pop_wrap').hide();
	});
	

	//아코디언
	$('.left_header .menu>li .slide_menu').click(function(e){
		e.preventDefault();
		$(this).siblings('.sub_menu').slideToggle();
		$(this).parents('li').toggleClass('active');
	});

	//버튼 캡쳐링막기
	$('.register table tr button').click(function(e){
		e.stopPropagation();
	});

	//일정팝업
	$('.schedule_pop .modify_btn').click(function(){
		$(this).parents('.pop_wrap').hide();
		$('.schedule_pop2').show();
	});
	//결재양식선택팝업
	$('.category_pop_show').click(function(){
		$('.category_pop').show();
	});
	//결재선팝업
	$('.part_pop_show').click(function(){
		$('.part_pop').show();
	});
	//반려팝업
	$('.companion_pop_show').click(function(){
		$('.companion_pop').show();
	});

	//대장양식선택팝업
	$('.category_pop2_show').click(function(){
		$('.category_pop2').show();
	});


	////이미지 썸네일 미리보기
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('.imagePreview').css('background-image', 'url('+e.target.result +')');
				$('.imagePreview').hide();
				$('.imagePreview').fadeIn(650);
			}
			reader.readAsDataURL(input.files[0]);
			$('.avatar-upload .avatar-preview').css({'z-index':'4','background':'#e0e0e0'});
		}
	}	
	function readURL2(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('.imagePreview2').css('background-image', 'url('+e.target.result +')');
				$('.imagePreview2').hide();
				$('.imagePreview2').fadeIn(650);
			}
			reader.readAsDataURL(input.files[0]);
			$('.avatar-upload2 .avatar-preview').css({'z-index':'4','background':'#e0e0e0'});
		}
	}	
	$(".imageUpload").change(function() {
		var image = $(this).parent('.file_up_wrap').find('.imagePreview');
		readURL(this);
	});	
	$("#file_up1").change(function() {
		readURL(this);
	});
	$("#file_up2").change(function() {
		readURL2(this);
	});
});