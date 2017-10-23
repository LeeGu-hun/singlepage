function donate(){
	var ck = $('input:radio[name="money"]:checked').val();
	if(ck == "in") {
		  $("#in_money").attr("disabled",false);
		  $('#dmoney').val($('#in_money').val());
	} else {
		$('#dmoney').val(ck);
		$("#in_money").val("");
		$("#in_money").attr("disabled",true);
	}
}

function in_donate(point) {
    $(point).keyup(function(){
         $(this).val($(this).val().replace(/[^0-9]/g,""));
         $('#dmoney').val($('#in_money').val());
    }); 
}