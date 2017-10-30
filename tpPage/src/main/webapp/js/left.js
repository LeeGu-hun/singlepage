function donate(){
	var ck = $('input:radio[name="money"]:checked').val();
	var cmoney = $('#cmoney').val();

	if(ck == "in") {
		  $("#in_money").attr("disabled",false);
		  $('#dmoney').val($('#in_money').val());
		  var dmoney = $('#dmoney').val();
		  var cmoney = $('#cmoney').val();
		  var amoney = Number(cmoney) - Number(dmoney);
		  if(Number(amoney) >= 0) {
			  $('#amoney').val(amoney);  
		  } else {
			  $('#amoney').val(0);
		  }	  
	} else {
		$('#dmoney').val(ck);
		var dmoney = $('#dmoney').val();
		var cmoney = $('#cmoney').val();
		$("#in_money").val("");
		$("#in_money").attr("disabled",true)
		if(Number(amoney) >= 0) {
			  $('#amoney').val(amoney);  
		  } else {
			  $('#amoney').val(0);
		  }	  
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
	console.log(pid);
	console.log(mid);
	var ck = $('#ck').val();
	if(mid == "/"){
		console.log("ssss");
		location.href = './login?pid='+pid;
	} else {
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
	
}

function donateOK() {
	$( "#dialog" ).dialog({ 
		autoOpen: false,
		width: 400, 
		modal: true,
		buttons: [{ text: "Ok", 
					click: function() { $( this ).dialog( "close" ); } }, 
				  { text: "Cancel", 
					click: function() { $( this ).dialog( "close" ); } }] 
	});		
}
