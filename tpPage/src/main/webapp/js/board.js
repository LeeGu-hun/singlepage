function pbreadURL(input) {
	if(input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function(e) {
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
	$('#pbmodaldiv').html(msg);
	$('.pbrecontent').val('');
	$('#pbmodal').modal('show');
	$('#pbrmmodal').modal('hide');
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
			$('#pbrmmodaldiv').html(msg);
			$('#pbrmmodal').modal('show');
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
		if(gopbid != 0) {
			location.href = '/tpPage/page/' + pbhostid;		
		}
	});	
}

function pbidrm(pbid) {
	$.ajax({
		type : "POST",
		url : "/tpPage/pbidrm",
		data : "pbid=" + pbid,
		success : pbidrmR
	});
	function pbidrmR(msg) {
		$('#pbrmmodaldiv').html(msg);
		$('#pbrmmodal').modal('show');
		$('.pbidrmgo').on('click', function() {
			var pbid = $(this).next().val();
			/*$.ajax({
				type : "POST",
				url : "/tpPage/pbidrmgo",
				data : "pbid=" + pbid,
				success : pbidrmRR
			});
			function pbidrmRR() {
			}*/
			$('#pbrmmodal').modal('hide');
		});	
	}
}

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
	$('#mbmodaldiv').html(msg);
	$('.mbrecontent').val('');
	$("#mbmodal").modal('show');
	
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
}








