//페이지 후원
function donate(){
	console.log($('#mpoint').val());
	$('#cmoney').val($('#mpoint').val());
	var cmoney = $('#cmoney').val();
	var chk = $('input:radio[name="money"]:checked').val();

	if(chk == "in") {
		  $("#in_money").attr("disabled",false);
		  $('#dmoney').val($('#in_money').val());
		  var dmoney = $('#dmoney').val();
		  var amoney = Number(cmoney) - Number(dmoney);
		  if(Number(amoney) >= 0) {
			  $('#amoney').val(amoney);  
		  } else {
			  $('#amoney').val(0);
		  }	  
	} else {
		$('#dmoney').val(chk);
		var dmoney = $('#dmoney').val();
		var amoney = Number(cmoney) - Number(dmoney);
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
	if(dmoney == "") {
		$('#dtxtModal').html('후원하실 금액을 선택(또는 입력)해주세요.');
		$('#dbtnModal').html("<a href='#' data-dismiss='modal' class='btn btn-custom'>확인</a>");
	} else {
		if(Number(cmoney)==0 || Number(amoney) < 0) {
			$('#dtxtModal').html('포인트를 충전해주세요.');
			$('#dbtnModal').html("<a href='#' data-dismiss='modal' class='btn btn-custom'>확인</a>");
		} else {
			$('#dtxtModal').html('후원하시겠습니까?');
			$('#dbtnModal').html("<a href='#' data-dismiss='modal' class='btn btn-custom'>취소</a>" +
			"<a href='#' class='btn  btn-custom' onclick='donateClose()'>후원</a>");
		}
	}
}

function donateClose() {
	var pid = $('#pid').val();
	var mid = $('#mid').val();
	var ppoint = $('#ppoint').val();
	var dmoney = $('#dmoney').val();
	console.log(ppoint);
	$.ajax({
		type : "POST",
		url : "/tpPage/pointDonate",
		data : "pid=" + pid + "&mid=" + mid + "&ppoint=" + ppoint+ "&dmoney=" + dmoney,
		success : function(ck) {
			ck = $.trim(ck);
			console.log(ck);
			$('#mpoint').val(ck);
			console.log($('#mpoint').val());
		}
	});
	$('#myModal').modal('hide');
	$('#myModal3').modal('hide');
	
	$('input:radio[name="money"]').prop("checked", false);
	$('input:radio[name="money"]').attr("checked", false);
	$('#dmoney').val("");
	$('#amoney').val("");
}

function donateInit() {
	$('input:radio[name="money"]').prop("checked", false);
	$('input:radio[name="money"]').attr("checked", false);
	$('#dmoney').val("");
	$('#amoney').val("");
}
/////////////////////////////////////////////////////////////////////////////////////////
//포인트 충전
function charge(){
	$('#hmoney').val($('#mpoint').val());
	var chk = $('input:radio[name="chmoney"]:checked').val();
	var hmoney = $('#hmoney').val();

	if(chk == "cin") {
		  $("#cin_money").attr("disabled",false);
		  $('#ccmoney').val($('#cin_money').val());
		  var ccmoney = $('#ccmoney').val();
		  var camoney = Number(hmoney) + Number(ccmoney);
		  if(Number(camoney) >= 0) {
			  $('#camoney').val(camoney);  
		  } else {
			  $('#camoney').val(0);
		  }
	} else {
		$('#ccmoney').val(chk);
		var ccmoney = $('#ccmoney').val();
		var hmoney = $('#hmoney').val();
		var camoney = Number(hmoney) + Number(ccmoney);
		$("#cin_money").val("");
		$("#cin_money").attr("disabled",true);
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
	console.log("전"+mcheck);
	if(mcheck == "0") {
		$('#chTitle').html("본인 인증")
		$('#ctxtModal').html('본인 인증하세요.');
		$('#ctxtModal').append("<div id='mchkTxt'> <label>email:</label>" +
            		"<input type='text' id='email' name='email' /><br /> <label>password:</label>" + 
            		"<input type='password' id='pass' name='pass' /><br /> <label>phone:</label>" +
            		"<input type='text' id='phone' name='phone' /><br /></div>");
		$('#cbtnModal').html("<a href='#' class='btn btn-custom' onclick='memCheck()'>본인 인증</a>" +
				"<a href='#' data-dismiss='modal' class='btn btn-custom'>취소</a>");
	} else {
		if(ccmoney == "" || Number(ccmoney)==0) {
			$('#chTitle').html("실행 오류");
			$('#ctxtModal').html('충전할 금액을 선택해주세요.');
			$('#cbtnModal').html("<a href='#' data-dismiss='modal' class='btn btn-custom'>확인</a>");
		} else {
			$('#chTitle').html("충전 확인")
			$('#ctxtModal').html('충전하시겠습니까?');
			$('#cbtnModal').html("<a href='#' data-dismiss='modal' class='btn btn-custom'>취소</a>" +
			"<a href='#' class='btn btn-custom' onclick='chargeClose()'>충전</a>");
		}
	}
}

function chargeClose() {
	var charge = $('#ccmoney').val();
	var mid = $('#mid').val();
	$.ajax({
		type : "POST",
		url : "/tpPage/pointCharge",
		data : "charge=" + charge + "&mid=" + mid,
		success : function(ck) {
			ck = $.trim(ck);
			$('#mpoint').val(ck);
			$('#cmoney').val($('#mpoint').val());
			$('#hmoney').val($('#mpoint').val());
		}
	});
	$('#myModal2').modal('hide');
	$('#myModal4').modal('hide');
//	$('#cmoney').val($('#mpoint').val());
}

function chargeInit() {
	$('input:radio[name="chmoney"]').prop("checked", false);
	$('input:radio[name="chmoney"]').attr("checked", false);
	$('#hmoney').val($('#mpoint').val());
	$('#ccmoney').val("");
	$('#camoney').val("");

}

//본인인증
function memCheck() {
	var email = $('#memail').val(); 
	$.ajax({
		type : "POST",
		url : "/tpPage/memberCheck",
		data : "email=" + email,
		success : cmpPass
	});
}

function cmpPass(pw) {
	var mid = $('#mid').val(); 
	var memail = $('#memail').val(); 
	var email = $('#email').val();
	var pass = $('#pass').val();
	var phone = $('#phone').val();
	var pw = $.trim(pw)
	if (memail == email && pw == pass) {
		$.ajax({
			type : "POST",
			url : "/tpPage/mchkUpdate",
			data : "email=" + email + "&phone=" + phone + "&mid=" + mid,
			success : changeMchk
		});
		function changeMchk() {
			$('#mcheck').val(1);
		}
		$('#chTitle').html("본인 인증");
		$('#ctxtModal').html("<label style='color:red'>인증성공</label>");
		$('#cbtnModal').html("<a href='#' data-dismiss='modal' class='btn btn-custom'>확인</a>");
	} else {
		$('#chTitle').html("본인 인증");
		$('#ctxtModal').html("<label style='color:red'>인증실패</label>");
		$('#cbtnModal').html("<a href='#' class='btn btn-custom' onclick='memCheck()'>재인증</a>" +
				"<a href='#' data-dismiss='modal' class='btn btn-custom' onclick='memCheck()'>취소</a>");
	}
	
}

/////////////////////////////////////////////////////////////////////////////////////////////

//좋아요
function like() {
	var pid = $('#pid').val();
	var mid = $('#mid').val();
	var ck = $('#ck').val();
	if(mid == ""){
		location.href = './login?pid='+pid;
	} else {
		$.ajax({
			type : "POST",
			url : "/tpPage/chklike",
			data : "pid=" + pid + "&mid=" + mid + "&ck=" + $.trim(ck),
			success : changeHeart
		});
		$.ajax({
			type : "POST",
			url : "/tpPage/likecnt",
			data : "pid=" + pid,
			success : likecntR
		});
		function changeHeart(ck) {
			ck = $.trim(ck);
			$('#ck').val(ck);
			if( ck == 0 ){
				$('#btnLike').html("좋아요   <i class='fa fa-heart-o fa-lg' aria-hidden='true'></i>");
			}
			else {
				$('#btnLike').html("좋아요   <i class='fa fa-heart fa-lg' aria-hidden='true'></i>");
			}
		}
		function likecntR(msg) {
			$('#likettl').html(msg);
		}	
	}
}


