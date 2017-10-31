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

//포인트 충전
function charge(){
	var ck = $('input:radio[name="chmoney"]:checked').val();

	if(ck == "cin") {
		  $("#cin_money").attr("disabled",false);
		  $('#ccmoney').val($('#cin_money').val());
		  var ccmoney = $('#ccmoney').val();
		  var hmoney = $('#hmoney').val();
		  var camoney = Number(hmoney) + Number(ccmoney);
		  if(Number(camoney) >= 0) {
			  $('#camoney').val(camoney);  
		  } else {
			  $('#camoney').val(0);
		  }
	} else {
		$('#ccmoney').val(ck);
		var ccmoney = $('#ccmoney').val();
		var hmoney = $('#hmoney').val();
		var camoney = Number(hmoney) + Number(ccmoney);
		$("#cin_money").val("");
		$("#cin_money").attr("disabled",true)
		if(Number(camoney) >= 0) {
			  $('#camoney').val(camoney);  
		  } else {
			  $('#camoney').val(0);
		  } 
	}
}

function cin_charge(point) {
    $(point).keyup(function(){
         $(this).val($(this).val().replace(/[^0-9]/g,""));
         $('#ccmoney').val($('#cin_money').val());
    }); 
}

function like() {
	var pid = $('#pid').val();
	var mid = $('#mid').val();
	var ck = $('#ck').val();
	if(mid == "/"){
		location.href = './membermanager?pid='+pid;
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

//function donateOK() {
//	$( "#dialog" ).dialog({ 
//		autoOpen: false,
//		width: 400, 
//		modal: true,
//		buttons: [{ text: "Ok", 
//					click: function() { $( this ).dialog( "close" ); } }, 
//				  { text: "Cancel", 
//					click: function() { $( this ).dialog( "close" ); } }] 
//	});		
//}

function donateCheck() {
	var cmoney = $('#cmoney').val();
	var dmoney = $('#dmoney').val();
	var amoney = Number(cmoney) - Number(dmoney);
	
	if(Number(cmoney)==0 || Number(amoney) < 0) {
		$('#dtxtModal').html('포인트를 충전해주세요.');
		$('#dbtnModal').html("<a href='#' data-dismiss='modal' class='btn'>확인</a>");
	} else {
		$('#dtxtModal').html('후원하시겠습니까?');
		$('#dbtnModal').html("<a href='#' data-dismiss='modal' class='btn'>취소</a>" +
		"<a href='#' class='btn btn-primary' onclick='donateClose()'>후원</a>");
	}
}

function donateClose() {
	$('#myModal').modal('hide');
	$('#myModal3').modal('hide');
	
	var pid = $('#pid').val();
	var mid = $('#mid').val();
	
}

function chargeCheck() {
	var ccmoney = $('#ccmoney').val();
	console.log(ccmoney);
	if(ccmoney == "" || Number(ccmoney)==0) {
		$('#ctxtModal').html('충전할 금액을 선택해주세요.');
		$('#cbtnModal').html("<a href='#' data-dismiss='modal' class='btn'>확인</a>");
	} else {
		$('#ctxtModal').html('충전하시겠습니까?');
		$('#cbtnModal').html("<a href='#' data-dismiss='modal' class='btn'>취소</a>" +
		"<a href='#' class='btn btn-primary' onclick='chargeClose()'>후원</a>");
	}
}

function chargeClose() {
	$('#myModal2').modal('hide');
	$('#myModal4').modal('hide');
}
