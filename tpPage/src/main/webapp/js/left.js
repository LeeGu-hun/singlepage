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
	var ppoint = $('#ppoint').val();
	var dmoney = $('dmoney').val();
	console.log(ppoint);
	$.ajax({
		type : "POST",
		url : "./pointDonate",
		data : "pid=" + pid + "&mid=" + mid + "&ppoint=" + ppoint+ "&dmoney=" + dmoney
	});
	
//	$('input:radio[name="money"]').removeAttr("checked");
}

/*function donateOK() {
$( "#dialog" ).dialog({ 
	autoOpen: false,
	width: 400, 
	modal: true,
	buttons: [{ text: "Ok", 
				click: function() { $( this ).dialog( "close" ); } }, 
			  { text: "Cancel", 
				click: function() { $( this ).dialog( "close" ); } }] 
});		
}*/

/////////////////////////////////////////////////////////////////////////////////////////
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

function chargeCheck() {
	var ccmoney = $('#ccmoney').val();
	var mcheck = $('#mcheck').val();
	if(mcheck == "0") {
		$('#chTitle').html("본인 인증")
		$('#ctxtModal').html('본인 인증하세요.');
		$('#ctxtModal').append("<div id='mchkTxt'> <label>email:</label>" +
            		"<input type='text' id='email' name='email' /><br /> <label>password:</label>" + 
            		"<input type='password' id='pass' name='pass' /><br /> <label>phone:</label>" +
            		"<input type='text' id='phone' name='phone' /><br /></div>");
		$('#cbtnModal').html("<a href='#' class='btn' onclick='memCheck()'>본인 인증</a>" +
				"<a href='#' data-dismiss='modal' class='btn'>취소</a>");
	} else {
		if(ccmoney == "" || Number(ccmoney)==0) {
			$('#chTitle').html("실행 오류")
			$('#ctxtModal').html('충전할 금액을 선택해주세요.');
			$('#cbtnModal').html("<a href='#' data-dismiss='modal' class='btn'>확인</a>");
		} else {
			$('#chTitle').html("충전 확인")
			$('#ctxtModal').html('충전하시겠습니까?');
			$('#cbtnModal').html("<a href='#' data-dismiss='modal' class='btn'>취소</a>" +
			"<a href='#' class='btn btn-primary' onclick='chargeClose()'>충전</a>");
		}
	}
}

function chargeClose() {
	var charge = $('#ccmoney').val();
	var mid = $('#mid').val();
	$.ajax({
		type : "POST",
		url : "./pointCharge",
		data : "charge=" + charge + "&mid=" + mid,
	})
	$('#myModal2').modal('hide');
	$('#myModal4').modal('hide');
}

//본인인증
function memCheck() {
	var email = $('#memail').val(); 
	$.ajax({
		type : "POST",
		url : "./memberCheck",
		data : "email=" + email,
		success : cmpPass
	});
}

function cmpPass(pw) {
	var memail = $('#memail').val(); 
	var email = $('#email').val();
	var pass = $('#pass').val();
	var phone = $('#phone').val();
	var pw = $.trim(pw)
	if (memail == email && pw == pass) {
		$.ajax({
			type : "POST",
			url : "./mchkUpdate",
			data : "email=" + email + "&phone=" + phone,
			success : changeMchk
		});
		function changeMchk() {
			$('#mcheck').val(1);
		}
		$('#chTitle').html("본인 인증");
		$('#ctxtModal').html("<label style='color:red'>인증성공</label>");
		$('#cbtnModal').html("<a href='#' data-dismiss='modal' class='btn'>확인</a>");
	} else {
		$('#chTitle').html("본인 인증");
		$('#ctxtModal').append("<label style='color:red'>인증실패</label>");
		$('#cbtnModal').html("<a href='#' class='btn' onclick='memCheck()'>재인증</a>" +
				"<a href='#' data-dismiss='modal' class='btn' onclick='memCheck()'>취소</a>");
	}
	
}

/////////////////////////////////////////////////////////////////////////////////////////////

//좋아요
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


