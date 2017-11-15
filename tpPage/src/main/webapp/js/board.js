function pbreadURL(input) {
	if(input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function(e) {
			$('#pbuploadImg').show();
			$('#pbuploadImg').attr('src', e.target.result);
			$('#pbuploadImg').attr('width', 300);
		}
		reader.readAsDataURL(input.files[0]);
	}
}

function mbreadURL(input) {
	if(input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function(e) {
			$('#mbuploadImg').show();
			$('#mbuploadImg').attr('src', e.target.result);
			$('#mbuploadImg').attr('width', 300);
		}
		reader.readAsDataURL(input.files[0]);
	}
}

function pbScroll() {
	var pbli = $('#pbli').attr('class');
	if(pbli == 'active') {
		var pbPage = $("#pbPage").val();
		var pbMpage = $("#pbMpage").val();
		if(pbPage > 1 && pbMpage != -1) {
			var scrollHeight = $(window).scrollTop() + $(window).height();
			var documentheight = $(document).height();
			if(scrollHeight == documentheight) {
				pbMoreListScroll();					
			}
		} else if(pbMpage == -1) {
			$('.scroll').remove();
		}
	}
}

function mbScroll() {
	var mbli = $('#mbli').attr('class');
	if(mbli == 'active') {
		var mbPage = $("#mbPage").val();
		var mbMpage = $("#mbMpage").val();
		if(mbPage > 1 && mbMpage != -1) {
			var scrollHeight = $(window).scrollTop() + $(window).height();
			var documentheight = $(document).height();
			if(scrollHeight == documentheight) {
				mbMoreListScroll();					
			}
		} else if(mbMpage == -1) {
			$('.scroll').remove();
		}
	}
}

/*$(document).ready(function() {
	var mbTab = $('#rMbTab').val();
	if(mbTab == 'active') {
		$("#bTab a[href='#memberboard']").tab("show");
	}
});*/

/*function mbwrite() {
	$('#mboardform').ajaxForm({
			success:function(msg) {
				$('#memberboard').html(msg)
		}
	});
}*/

function pbMoreList() {
	var pbhostid = $('#pbhostid').val();
	var pbPage = $('#pbPage').val();
	var newPbPage = Number(pbPage) + 1;
	$.ajax({
		type : "POST",
		url : "/tpPage/pbmorelist",
		data : "pbPage=" + newPbPage + "&pbhostid=" + pbhostid,
		success : pbMoreListR,
	});
}
function pbMoreListR(msg) {
	$('#pbListT').html(msg)
	$('.pbidrm').on('click', function() {
		var pbid = $(this).next().val();
		$(this).parent().parent().attr('id', 'pbidrmrow');
		$.ajax({
			type : "POST",
			url : "/tpPage/pbidrm",
			data : "pbid=" + pbid,
			success : pbidrmR
		});
		function pbidrmR(msg) {
			$('#rmchkmodaldiv').html(msg);
			$('#rmchkmodal').modal('show');
			$('body').css({'overflow': 'hidden', 'padding': '0px'});
			$('.pbidrmgo').on('click', function() {
				var pbid = $(this).next().val();
				$.ajax({
					type : "POST",
					url : "/tpPage/pbidrmgo",
					data : "pbid=" + pbid,
					success : pbidrmRR
				});
				function pbidrmRR() {
					$('#rmchkmodal').modal('hide');
					$('body').css('overflow', '');
					$('#pbidrmrow').remove();
				}
			});	
			
			$('#rmchkmodal').on('hidden.bs.modal', function() {
				$('body').css('overflow', '');
			});
		}		
	});
}

function pbMoreListScroll() {
	var pbhostid = $('#pbhostid').val();
	var pbPage = $('#pbPage').val();
	var newPbPage = Number(pbPage) + 1;
	$('#pbPage').val(newPbPage);
	$.ajax({
		type : "POST",
		url : "/tpPage/pbmorelistscroll",
		data : "pbPage=" + newPbPage + "&pbhostid=" + pbhostid,
		success : pbMoreListScrollR,
	});
}
function pbMoreListScrollR(msg) {
	$('#pbListTT').append(msg)
	$('.pbidrm').on('click', function() {
		var pbid = $(this).next().val();
		$(this).parent().parent().attr('id', 'pbidrmrow');
		$.ajax({
			type : "POST",
			url : "/tpPage/pbidrm",
			data : "pbid=" + pbid,
			success : pbidrmR
		});
		function pbidrmR(msg) {
			$('#rmchkmodaldiv').html(msg);
			$('#rmchkmodal').modal('show');
			$('body').css({'overflow': 'hidden', 'padding': '0px'});
			$('.pbidrmgo').on('click', function() {
				var pbid = $(this).next().val();
				$.ajax({
					type : "POST",
					url : "/tpPage/pbidrmgo",
					data : "pbid=" + pbid,
					success : pbidrmRR
				});
				function pbidrmRR() {
					$('#rmchkmodal').modal('hide');
					$('body').css('overflow', '');
					$('#pbidrmrow').remove();
				}
			});	
			
			$('#rmchkmodal').on('hidden.bs.modal', function() {
				$('body').css('overflow', '');
			});
		}
	});
}

function mbMoreList() {
	var mbhostid = $('#mbhostid').val();
	var mbPage = $('#mbPage').val();
	var newMbPage = Number(mbPage) + 1;
	$.ajax({
		type : "POST",
		url : "/tpPage/mbmorelist",
		data : "mbPage=" + newMbPage + "&mbhostid=" + mbhostid,
		success : mbMoreListR,
	});
}
function mbMoreListR(msg) {
	$('#mbListT').html(msg)
	$('.mbidrm').on('click', function() {
		var mbid = $(this).next().val();
		$(this).parent().parent().attr('id', 'mbidrmrow');
		$.ajax({
			type : "POST",
			url : "/tpPage/mbidrm",
			data : "mbid=" + mbid,
			success : mbidrmR
		});
		function mbidrmR(msg) {
			$('#rmchkmodaldiv').html(msg);
			$('#rmchkmodal').modal('show');
			$('body').css({'overflow': 'hidden', 'padding': '0px'});
			$('.mbidrmgo').on('click', function() {
				var mbid = $(this).next().val();
				$.ajax({
					type : "POST",
					url : "/tpPage/mbidrmgo",
					data : "mbid=" + mbid,
					success : mbidrmRR
				});
				function mbidrmRR() {
					$('#rmchkmodal').modal('hide');
					$('body').css('overflow', '');
					$('#mbidrmrow').remove();
				}
			});
			
			$('#rmchkmodal').on('hidden.bs.modal', function() {
				$('body').css('overflow', '');
			});
		}
	});
}

function mbMoreListScroll() {
	var mbhostid = $('#mbhostid').val();
	var mbPage = $('#mbPage').val();
	var newMbPage = Number(mbPage) + 1;
	$('#mbPage').val(newMbPage);
	$.ajax({
		type : "POST",
		url : "/tpPage/mbmorelistscroll",
		data : "mbPage=" + newMbPage + "&mbhostid=" + mbhostid,
		success : mbMoreListScrollR,
	});
}
function mbMoreListScrollR(msg) {
	$('#mbListTT').append(msg);
	$('.mbidrm').on('click', function() {
		var mbid = $(this).next().val();
		$(this).parent().parent().attr('id', 'mbidrmrow');
		$.ajax({
			type : "POST",
			url : "/tpPage/mbidrm",
			data : "mbid=" + mbid,
			success : mbidrmR
		});
		function mbidrmR(msg) {
			$('#rmchkmodaldiv').html(msg);
			$('#rmchkmodal').modal('show');
			$('body').css({'overflow': 'hidden', 'padding': '0px'});
			$('.mbidrmgo').on('click', function() {
				var mbid = $(this).next().val();
				$.ajax({
					type : "POST",
					url : "/tpPage/mbidrmgo",
					data : "mbid=" + mbid,
					success : mbidrmRR
				});
				function mbidrmRR() {
					$('#rmchkmodal').modal('hide');
					$('body').css('overflow', '');
					$('#mbidrmrow').remove();
				}
			});
			
			$('#rmchkmodal').on('hidden.bs.modal', function() {
				$('body').css('overflow', '');
			});
		}
	});
}

function loadpboard(pbid) {
	$.ajax({
		type : "POST",
		url : "/tpPage/loadpboard",
		data : "pbid=" + pbid,
		success : loadpboardR
	});
}
function loadpboardR(msg) {
	$('#rmchkmodal').modal('hide');
	$('#pbmodaldiv').html(msg);
	$('.pbrecontent').val('');
	$('#pbmodal').modal('show');
	$('body').css({'overflow': 'hidden', 'padding': '0px'});
	var pbhostid = $('#pbhostid').val();
	var gopbid = $('#gopbid').val();
	
	$('.pbrew').on('click', function() {
		var frm = $(this).parent().parent().parent().children('#pbrecmd');
		frm.ajaxSubmit({
			success: loadpboardR
		});
	});
	
	$('.pbrebtn').on('click', function() {
		if($(this).next().css("display") == "none"){
			$(this).next().show();
		}else{
			$(this).next().hide();
		}
	});
	
	$('.pbrmbtn').on('click', function() {
		var pbid = $('#pbid').val(); 
		var rmpbid = $(this).next().val();
		$.ajax({
			type : "POST",
			url : "/tpPage/pbreremove",
			data : "pbid=" + pbid + "&rmpbid=" + rmpbid,
			success : pbreremoveR
		});
		function pbreremoveR(msg) {
			$('#rmchkmodaldiv').html(msg);
			$('#rmchkmodal').modal('show');
			$('body').css({'overflow': 'hidden', 'padding': '0px'});
			$('.pbrermgo').on('click', function() {
				var pbid = $(this).next().val();
				var rmpbid = $(this).next().next().val();
				$.ajax({
					type : "POST",
					url : "/tpPage/pbreremovego",
					data : "pbid=" + pbid + "&rmpbid=" + rmpbid,
					success : loadpboardR
				});
			});
		}
	});
	
	$('#pbmodal').on('hidden.bs.modal', function() {
		$('body').css('overflow', '');
		if(gopbid != 0) {
			location.href = '/tpPage/page/' + pbhostid;		
		}
	});
	
	$('.sharebtn').on('click', function() {
		var surl = $('#shareurl').val();
		console.log(surl);
		$('#shareurl').select();
		document.execCommand('copy');
		
	});
}

$(document).ready(function() {
	$('.pbidrm').on('click', function() {
		var pbid = $(this).next().val();
		$(this).parent().parent().attr('id', 'pbidrmrow');
		$.ajax({
			type : "POST",
			url : "/tpPage/pbidrm",
			data : "pbid=" + pbid,
			success : pbidrmR
		});
		function pbidrmR(msg) {
			$('#rmchkmodaldiv').html(msg);
			$('#rmchkmodal').modal('show');
			$('body').css({'overflow': 'hidden', 'padding': '0px'});
			$('.pbidrmgo').on('click', function() {
				var pbid = $(this).next().val();
				$.ajax({
					type : "POST",
					url : "/tpPage/pbidrmgo",
					data : "pbid=" + pbid,
					success : pbidrmRR
				});
				function pbidrmRR() {
					$('#rmchkmodal').modal('hide');
					$('body').css('overflow', '');
					$('#pbidrmrow').remove();
				}
			});	
			
			$('#rmchkmodal').on('hidden.bs.modal', function() {
				$('body').css('overflow', '');
			});
		}
		
	});
});

function pblike() {
	var pbid = $('#nowpbid').val();
	var pblikechk = $('#pblikechk').val();
	
	$.ajax({
		type : "POST",
		url : "/tpPage/pblike",
		data : "pbid=" + pbid + "&pblikechk=" + pblikechk,
		success : changepblike
	});
	
	function changepblike(pblikechk) {
		pblikechk = $.trim(pblikechk);
		$('#pblikechk').val(pblikechk);
		if(pblikechk == 0) {
			$('#pblikebtn').text('좋아요X');
		} else {
			$('#pblikebtn').text('좋아요O');
		}
	}
}

function loadmboard(mbid) {
	$.ajax({
		type : "POST",
		url : "/tpPage/loadmboard",
		data : "mbid=" + mbid,
		success : loadmboardR
	});
}
function loadmboardR(msg) {
	$('#rmchkmodal').modal('hide');
	$('#mbmodaldiv').html(msg);
	$('.mbrecontent').val('');
	$("#mbmodal").modal('show');
	$('body').css({'overflow': 'hidden', 'padding': '0px'});
	$('.mbrew').on('click', function() {
		var frm = $(this).parent().parent().parent().children('#mbrecmd');
		frm.ajaxSubmit({
			success: loadmboardR
		});
	});
	
	$('.mbrebtn').on('click', function() {
		if($(this).next().css("display") == "none"){
			$(this).next().show();
		}else{
			$(this).next().hide();
		}
	});
	
	$('.mbrmbtn').on('click', function() {
		var mbid = $('#mbid').val();
		var rmmbid = $(this).next().val();
		$.ajax({
			type : "POST",
			url : "/tpPage/mbreremove",
			data : "mbid=" + mbid + "&rmmbid=" + rmmbid,
			success : mbreremoveR
		});
		function mbreremoveR(msg) {
			$('#rmchkmodaldiv').html(msg);
			$('#rmchkmodal').modal('show');
			$('body').css({'overflow': 'hidden', 'padding': '0px'});
			$('.mbrermgo').on('click', function() {
				var mbid = $(this).next().val();
				var rmmbid = $(this).next().next().val();
				$.ajax({
					type : "POST",
					url : "/tpPage/mbreremovego",
					data : "mbid=" + mbid + "&rmmbid=" + rmmbid,
					success : loadmboardR
				})
			});
		}
	});
	
	$('#mbmodal').on('hidden.bs.modal', function() {
		$('body').css('overflow', '');
	});
}

$(document).ready(function() {
	$('.mbidrm').on('click', function() {
		var mbid = $(this).next().val();
		$(this).parent().parent().attr('id', 'mbidrmrow');
		$.ajax({
			type : "POST",
			url : "/tpPage/mbidrm",
			data : "mbid=" + mbid,
			success : mbidrmR
		});
		function mbidrmR(msg) {
			$('#rmchkmodaldiv').html(msg);
			$('#rmchkmodal').modal('show');
			$('body').css({'overflow': 'hidden', 'padding': '0px'});
			$('.mbidrmgo').on('click', function() {
				var mbid = $(this).next().val();
				$.ajax({
					type : "POST",
					url : "/tpPage/mbidrmgo",
					data : "mbid=" + mbid,
					success : mbidrmRR
				});
				function mbidrmRR() {
					$('#rmchkmodal').modal('hide');
					$('body').css('overflow', '');
					$('#mbidrmrow').remove();
				}
			});
			
			$('#rmchkmodal').on('hidden.bs.modal', function() {
				$('body').css('overflow', '');
			});
		}
	});
});

function pballdrop(pbhostid) {
	$.ajax({
		type : "POST",
		url : "/tpPage/pballdrop",
		data : "pbhostid=" + pbhostid,
		success : pballdropR
	});
	function pballdropR(msg) {
		$('#rmchkmodaldiv').html(msg);
		$('#rmchkmodal').modal('show');
		$('body').css({'overflow': 'hidden', 'padding': '0px'});
		$('#pballdropgo').on('click', function() {
			var pbhostid = $(this).next().val();
			$.ajax({
				type : "POST",
				url : "/tpPage/pballdropgo",
				data : "pbhostid=" + pbhostid,
				success : pballdropgoR
			})
			function pballdropgoR(msg) {
				$('#rmchkmodal').modal('hide');
				$('body').css('overflow', '');
				$('#pbListT').html(msg);			
			}
		});
		
		$('#rmchkmodal').on('hidden.bs.modal', function() {
			$('body').css('overflow', '');
		});
	}
}

function mballdrop(mbhostid) {
	$.ajax({
		type : "POST",
		url : "/tpPage/mballdrop",
		data : "mbhostid=" + mbhostid,
		success : mballdropR
	});
	function mballdropR(msg) {
		$('#rmchkmodaldiv').html(msg);
		$('#rmchkmodal').modal('show');
		$('body').css({'overflow': 'hidden', 'padding': '0px'});
		$('#mballdropgo').on('click', function() {
			var mbhostid = $(this).next().val();
			$.ajax({
				type : "POST",
				url : "/tpPage/mballdropgo",
				data : "mbhostid=" + mbhostid,
				success : mballdropgoR
			});
			function mballdropgoR(msg) {
				$('#rmchkmodal').modal('hide');
				$('body').css('overflow', '');
				$('#mbListT').html(msg);
			}
		});
		
		$('#rmchkmodal').on('hidden.bs.modal', function() {
			$('body').css('overflow', '');
		});
	}
}








