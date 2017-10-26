function donate(){
	var ck = $('input:radio[name="money"]:checked').val();
	var cmoney = $('#cmoney').val(10000);

	if(ck == "in") {
		  $("#in_money").attr("disabled",false);
		  $('#dmoney').val($('#in_money').val());
		  var dmoney = $('#dmoney').val();
		  var cmoney = $('#cmoney').val();
		  var amoney = Number(cmoney) - Number(dmoney);
		  $('#amoney').val(amoney);
	} else {
		$('#dmoney').val(ck);
		var dmoney = $('#dmoney').val();
		var cmoney = $('#cmoney').val();
		$("#in_money").val("");
		$("#in_money").attr("disabled",true)
		var amoney = Number(cmoney) - Number(dmoney);
		$('#amoney').val(amoney);;
	}
}

function in_donate(point) {
    $(point).keyup(function(){
         $(this).val($(this).val().replace(/[^0-9]/g,""));
         $('#dmoney').val($('#in_money').val());
    }); 
}

function like() {
	var pid = $('#pid').val();
	var mid = $('#mid').val();
	var ck = $('#ck').val();
	$.ajax({
		type : "POST",
		url : "./chklike",
		data : "pid=" + pid + "&mid=" + mid + "&ck=" + $.trim(ck),
		success : changeHeart
	});
	function changeHeart(ck) {
		ck = $.trim(ck);
		$('#ck').val(ck);
		if( ck == 0 ){
			$('#btnLike').text('좋아요♡');
		}
		else {
			$('#btnLike').text('좋아요♥');
		}
	}
}