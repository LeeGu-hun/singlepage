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

function mbScrollW() {
	var mbli = $('#mbli').attr('class');
	if(mbli == 'active') {
		var mbPageW = $("#mbPageW").val();
		var mbMpageW = $("#mbMpageW").val();
		if(mbPageW > 1 && mbMpageW != -1) {
			var scrollHeight = $(window).scrollTop() + $(window).height();
			var documentheight = $(document).height();
			if(scrollHeight == documentheight) {
				mbMoreListScrollW();					
			}
		} else if(mbMpageW == -1) {
			$('.scroll').remove();
		}
	}
}

function mbwrite() {
	$('#mboardform').ajaxForm({
			success:function(msg) {
				$('#memberboard').html(msg)
		}
	});
}

function pbMoreList() {
	var pbPage = $('#pbPage').val();
	var newPbPage = Number(pbPage) + 1;
	$.ajax({
		type : "POST",
		url : "./pbmorelist",
		data : "pbPage=" + newPbPage,
		success : pbMoreListR,
	});
}
function pbMoreListR(msg) {
	$('#pbListT').html(msg)
}

function pbMoreListScroll() {
	var pbPage = $('#pbPage').val();
	var newPbPage = Number(pbPage) + 1;
	$('#pbPage').val(newPbPage);
	$.ajax({
		type : "POST",
		url : "./pbmorelistscroll",
		data : "pbPage=" + newPbPage,
		success : pbMoreListScrollR,
	});
}
function pbMoreListScrollR(msg) {
	$('#pbListTT').append(msg)
}

function mbMoreList() {
	var mbPage = $('#mbPage').val();
	var newMbPage = Number(mbPage) + 1;
	$.ajax({
		type : "POST",
		url : "./mbmorelist",
		data : "mbPage=" + newMbPage,
		success : mbMoreListR,
	});
}
function mbMoreListR(msg) {
	$('#mbListT').html(msg)
}

function mbMoreListScroll() {
	var mbPage = $('#mbPage').val();
	var newMbPage = Number(mbPage) + 1;
	$('#mbPage').val(newMbPage);
	$.ajax({
		type : "POST",
		url : "./mbmorelistscroll",
		data : "mbPage=" + newMbPage,
		success : mbMoreListScrollR,
	});
}
function mbMoreListScrollR(msg) {
	$('#mbListTT').append(msg);
}

function mbMoreListW() {
	var mbPageW = $('#mbPageW').val();
	var newMbPageW = Number(mbPageW) + 1;
	$.ajax({
		type : "POST",
		url : "./mbmorelistW",
		data : "mbPageW=" + newMbPageW,
		success : mbMoreListWR,
	});
}
function mbMoreListWR(msg) {
	$('#mbListWT').html(msg)
}

function mbMoreListScrollW() {
	var mbPageW = $('#mbPageW').val();
	var newMbPageW = Number(mbPageW) + 1;
	$('#mbPageW').val(newMbPageW);
	$.ajax({
		type : "POST",
		url : "./mbmorelistscrollW",
		data : "mbPageW=" + newMbPageW,
		success : mbMoreListScrollWR,
	});
}
function mbMoreListScrollWR(msg) {
	$('#mbListWTT').append(msg);
}