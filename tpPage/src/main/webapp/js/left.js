function donate(){
	var ck = $('input:radio[name="money"]:checked').val();
	if(ck == "in") {
		  $("#in_money").attr("disabled",false);
		  $('#dmoney').val($('#in_money').val());
	} else {
		$('#dmoney').val(ck);
		$("#in_money").attr("disabled",true);
	}
}
