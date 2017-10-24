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

function Scroll() {
	var scrollHeight = $(window).scrollTop() + $(window).height();
	var documentheight = $(document).height();
	if(scrollHeight == documentheight) {
		var mbli = $('#mbli').attr('class');
		if(mbli == 'active') {
			var mbPage = $("#mbPage").val();
			var mbMpage = $("#mbMpage").val();
			if(mbPage > 1 && mbMpage != 0) {
					mbMoreListScroll();					
			}
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
	console.log(newMbPage);
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
	console.log(newMbPage);
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
