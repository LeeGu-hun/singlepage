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
		url : "./pbmorelist",
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
		url : "./pbmorelistscroll",
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
		url : "./mbmorelist",
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
		url : "./mbmorelistscroll",
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
		url : "./loadpboard",
		data : "pbid=" + pbid,
		success : loadpboardR
	});
}
function loadpboardR(msg) {
	$('#pbmodaldiv').html(msg);
	$("#pbmodal").modal('show');
	
	$('.rew').on('click', function() {
		console.log($(this));
		
		
		
		
	
	});
	
	
	$('.rebtn').on('click', function() {
		if($(this).next().css("display") == "none"){
			$(this).next().show();
		}else{
			$(this).next().hide();
		}
	});
}

/*function pbrewrite() {
	$('#pbrecmd').ajaxForm({
		success: pbrewriteR
	});
}*/
function pbrewriteR(msg) {
	$('#pbrebox').html(msg);
	$('.pbrecontent').val('');
	$('.rebtn').on('click', function() {
		if($(this).next().css("display") == "none"){
			$(this).next().show();
		}else{
			$(this).next().hide();
		}
	});
}

/*function pbrerewrite() {
	$('#pbrerecmd').ajaxForm({
		success:function(msg) {
			$('#pbrebox').html(msg);
			$('.pbrecontent').val('');
			$('.rebtn').on('click', function() {
				if($(this).next().css("display") == "none"){
					$(this).next().show();
				}else{
					$(this).next().hide();
				}
			});
		}
	});
}*/