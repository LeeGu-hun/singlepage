function pagereadURL(input) {
	if(input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function(e) {
			$('#puploadImg').attr('src', e.target.result);
			$('#puploadImg').attr('width', 300);
		}
		reader.readAsDataURL(input.files[0]);
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
		$('#pshowtime').val($('#pststart').val() + ":00 - " + $('#pstend').val() + ":00");
	}

	var pgenre = $('#pgenre').val();
	if(pgenre == "") {
		$('#pgenre').val($('#pgcate').val() + " - " + $('#pgdetail').val());
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