$(document).ready(function() {
	var fileTarget = $('#pfile');
	fileTarget.on('change', function() { // 값이 변경되면
		if (window.FileReader) { // modern browser
			var filename = $(this)[0].files[0].name;
		} else { // old IE
			var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출
		} // 추출한 파일명 삽입
		$('.fname').val(filename);
	});

	$('.btnRmv').on('click', function(){
		$('.fname').val('파일 없음');
		$('.uploadImg').hide();
	});
}); 

function pagereadURL(input) {
	if(input.files && input.files[0]) {
		var pathpoint = input.value.lastIndexOf('.');
		var filepoint = input.value.substring(pathpoint+1, input.length);
		var filetype = filepoint.toLowerCase();
		if(filetype=='jpg' || filetype=='gif' || filetype=='png' || filetype=='png' || filetype=='jpeg' || filetype=='bmp') {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#puploadImg').show();
				$('#puploadImg').attr('src', e.target.result);
				$('#puploadImg').attr('width', 300);
			}
			reader.readAsDataURL(input.files[0]);
		} else {
			alter('이미지 파일만 선택할 수 있습니다.');
			var parentInput = input.parentNode;
			var noed = parentInput.replaceChild(input.cloneNode(true), input);
			return false;
		}
		if(filetype=='bmp') {
			var upload = confirm('BMP 파일은 웹상에서 사용하기에 적적한 이미지 형식이 아닙니다.\n 그래도 계속 하시겠습니까?');
			if(!upload) return false;
		}
	} else {
		$('#puploadImg').attr('src', "");
	}
}

$(function() {
	$("#pperiod").datepicker(
		{
			dateFormat : 'yy-mm-dd',
			prevText : '이전 달',
			nextText : '다음 달',
			monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
					'8월', '9월', '10월', '11월', '12월' ],
			monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
					'7월', '8월', '9월', '10월', '11월', '12월' ],
			dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
			dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
			dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
			showMonthAfterYear : true,
			yearSuffix : '년'
		});
	getDate();
	$("#pperiod").datepicker("option", "showAnim", "blind")
});

function getDate() {
	var newDate = new Date();
	var yyyy = newDate.getFullYear();
	var mm = newDate.getMonth() + 1;
	if (mm < 10) {
		mm = "0" + mm;
	}
	var dd = newDate.getDate();
	if (dd < 10) {
		dd = "0" + dd;
	}
	var toDay = yyyy + "-" + mm + "-" + dd;
	
	var pperiod = $('#pperiod').val();
	if(pperiod == "") {
		$('#pperiod').val(toDay);
	}
	
	var pshowtime = $('#pshowtime').val();
	if(pshowtime == "") {
		$('#pshowtime').val("미정 - 미정");
	}

	var pgenre = $('#pgenre').val();
	if(pgenre == "") {
		$('#pgenre').val("임의 - ")
	}
	
	$("#pststart").change(function(){
		var pststart = $('#pststart option:selected').text();
		var pstend = $('#pstend option:selected').text();
		$('#pshowtime').val(pststart + ' - ' + pstend);
	});
	
	$("#pstend").change(function(){
		var pststart = $('#pststart option:selected').text();
		var pstend = $('#pstend option:selected').text();
		$('#pshowtime').val(pststart + ' - ' + pstend);
	});
	
	$("#pgcate").change(function(){
		var pgcate = $('#pgcate option:selected').text();
		var pgdetail = $('#pgdetail').val();
		$('#pgenre').val(pgcate + ' - ' + pgdetail);
	});
	
	$("#pgdetail").keyup(function() {
		var pgcate = $('#pgcate option:selected').text();
		var pgdetail = $('#pgdetail').val();
		$('#pgenre').val(pgcate + ' - ' + pgdetail);
	});
	
	$("#pgdetail").keypress(function() {
		var pgcate = $('#pgcate option:selected').text();
		var pgdetail = $('#pgdetail').val();
		$('#pgenre').val(pgcate + ' - ' + pgdetail);
	});
	
	$("#pgdetail").keydown(function() {
		var pgcate = $('#pgcate option:selected').text();
		var pgdetail = $('#pgdetail').val();
		$('#pgenre').val(pgcate + ' - ' + pgdetail);
	});
}

function makepage() {
	var pperiod = $('#pperiod').val();
	pperiod = pperiod.replace(/-/g, "") + "000000";
	$('#pperiod').val(pperiod);
	document.mpfrm.submit();

}