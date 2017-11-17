// 비밀번호 재설정
	function mpwfinder() {
		$.ajax({
			type : "POST",
			url : "./mpwfinder",
			success : mpwfinderR
		});
	}
	function mpwfinderR(msg) {
		$('#mpwfinderR').html(msg)
	}
	
	function mpwfmodal() {
		var fmemail = $('#mpwfmemail').val()
		$('#mpwrmemail').val(fmemail);
		console.log('123');
		
		$('#mpwfindcmd').ajaxForm({
			success:function() {
				$('#mpwfmodal').modal('show');
			}	
		});
	}
	
//회원탈퇴
function memberdrop() {
	$('#memberdrop').modal('show');
	$('#memdpbtn').on('click', function() {
		$('#memberdropchk').modal('show');
		$('#memdpgobtn').on('click', function() {
			$('#memberdropcmd').submit();
		});
	});
}



//본인 인증하기
function mcheckgo() {
	var email = $('#memail').val(); 
	$.ajax({
		type : "POST",
		url : "./memberCheck",
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
			url : "./mchkUpdate",
			data : "email=" + email + "&phone=" + phone + "&mid=" + mid,
			success : changeMchk
		});
		function changeMchk() {
			$('#mcheck').val(1);
		}
		$('#chTitle').html("본인 인증");
		$('#ctxtModal').html("<label style='color:red'>인증성공</label>");
		$('#cbtnModal').html("<a href='#' data-dismiss='modal' class='btn btn-custom' onClick='window.location.reload()'>확인</a>");
	} else {
		$('#chTitle').html("본인 인증");
		$('#ctxtModal').append("<label style='color:red'>인증실패</label>");
		$('#cbtnModal').html("<a href='#' class='btn btn-custom' onclick='memCheck()'>본인 인증</a>" +
				"<a href='#' data-dismiss='modal' class='btn' onclick='memCheck()'>취소</a>");
	}
}

// 포인트 충전
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
	console.log("전" + mcheck);
	console.log(ccmoney);
	if (mcheck == "1") {
		if (ccmoney == "" || Number(ccmoney) == 0) {
			$('#chTitle').html("실행 오류");
			$('#ctxtModal').html('충전할 금액을 선택해주세요.');
			$('#cbtnModal').html("<a href='#' data-dismiss='modal' class='btn btn-custom'>확인</a>");
		} else {
			$('#chTitle').html("충전 확인");
			$('#ctxtModal').html('충전하시겠습니까?');
			$('#cbtnModal').html("<a href='#' class='btn btn-custom' onclick='chargeClose()'>충전</a> " +
					"<a href='#' data-dismiss='modal' class='btn btn-custom'>취소</a>");
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
		success : function(ck) {
			ck = $.trim(ck);
			$('#mpoint').val(ck);
			$('#cmoney').val($('#mpoint').val());
			$('#hmoney').val($('#mpoint').val());
			$('#pointchargecmd').modal('hide');
			$('#finishcmd').modal('hide');
			location.reload();
		}
	});
}

function chargeInit() {
	$('input:radio[name="chmoney"]').prop("checked", false);
	$('input:radio[name="chmoney"]').attr("checked", false);
	$('#hmoney').val($('#mpoint').val());
	$('#ccmoney').val("");
	$('#camoney').val("");
}

$(document).ready(function() {
	$('#rememberMemail1').on('change', function(){
		if($(this).is(':checked') == true) {
			$('#rmbhl').attr('class', 'btn btn-custom sel');
			console.log('참으로');
		} else {
			$('#rmbhl').attr('class', 'btn btn-custom unchecked');
			console.log('거짓으로');
		}
	});
	
	$('#rememberMemail2').on('change', function(){
		if($(this).is(':checked') == true) {
			$('#rmbjl').attr('class', 'btn btn-custom sel');
			console.log('참으로');
		} else {
			$('#rmbjl').attr('class', 'btn btn-custom unchecked');
			console.log('거짓으로');
		}
	});
});
