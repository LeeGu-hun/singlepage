

$(document).ready(function(){

	$(function() {
        $(window).scroll(function() {
            if ($(this).scrollTop() > 500) {
                $('#btnTop').fadeIn();
            } else {
                $('#btnTop').fadeOut();
            }
        });
        $("#btnTop").click(function() {
            $('html, body').animate({
                scrollTop : 0
            }, 400);
            return false;
        });
    });

	$(window).scroll(function(){
		var scrollHeight = $(window).scrollTop() + $(window).height();
		var documentHeight = $(document).height();
		if($(document).height() > $(window).height())
			$("#btn").css("display", "none");
		if(scrollHeight == documentHeight){
			if($("#srch").length) {
				loadSrch();
			} else if($("#favo").length) {
				loadFavo();
			} else {
				loadMain();
			}
		}
	});	
	
	$(window).resize(function(){
		var totalw = $(window).width();
		var totalh = $(window).height();
		$('.outer-back').css('top', $(window).scrollTop());
		$('.outer-back').css('width', totalw);
		$('.outer-back').css('height', totalh);
		$('.outer-content').css('width', totalw);
		$('.outer-content').css('height', totalh);
		var w = $('.inner-content').width();
		$('.inner-content').css('left', totalw/2-w/2);
		$('.inner-content').css('top', 50);
	});

	$('.inner-item').not('a').on('click', function(){
		$('body').css({overflow: 'hidden'});
		var content = $(this).children().clone();
		$('.inner-content').html(content);
		$('.inner-content').addClass('on');
		$('.outer-content').addClass('on');
		$('.outer-back').addClass('on');
		var totalw = $(window).width();
		var totalh = $(window).height();
		var ow = $('.inner-item').width();
		$('.inner-content').css('width', ow*2);
		$('.outer-back').css('top', $(window).scrollTop());
		$('.outer-back').css('width', totalw);
		$('.outer-back').css('height', totalh);
		$('.outer-content').css('top', $(window).scrollTop());
		$('.outer-content').css('width', totalw);
		$('.outer-content').css('height', totalh);
		var w = $('.inner-content').width();
		$('.inner-content').css('left', totalw/2-w/2-20);
		$('.inner-content').css('top', 50);
	});
	
	$('.inner-back').on('click', function(){
		$('.outer-content').scrollTop(0);
		$('body').css({overflow: ''});
		$('.inner-content').removeClass('on');
		$('.outer-content').removeClass('on');
		$('.outer-back').removeClass('on');
	});
	
	$('input:radio[name=sido]').on('click', function(){
		$('.itemList').hide();
		var sido = $('input:radio[name=sido]:checked').val();
		$('#'+sido).show();
		console.log($(this));
		$(':radio:checked').parent().addClass('sel');
		$('input:radio').not(':radio:checked').parent().removeClass('sel');
	});

	$('input:checkbox').not('input:checkbox[id="rememberMemail1"]').on('change', function(){
		if($(this).is('[name]')){
			var itemId = $(this).attr('id');
			var itemVal = $(this).val();
			if($(this).is(':checked') == true) {
				if($(this).is('[data-all]')) {
					$('input:checkbox[name="'+ itemId.split('-')[0] +'"]').not('input:checkbox[id="'+ itemId +'"]').prop('checked', false);
					$('input:checkbox[name="'+ itemId.split('-')[0] +'"]').not('input:checkbox[id="'+ itemId +'"]').attr('checked', false);
					$('input:checkbox[name="'+ itemId.split('-')[0] +'"]').not('input:checkbox[id="'+ itemId +'"]').parent().removeClass('sel');
					$(this).parent().addClass('sel');
					$('.selected-item[id|="lb'+ itemId.split('-')[0] +'"]').remove();
					$('.selected').append('<label class="selected-item" id="lb' + itemId + '" name="'+ itemId.split('-')[0] +'" data-all><input type="hidden" value='+ itemVal + ' />' + itemId + '  &#215;' + '</label>');
					$('.selected-item').on('click', function(){
						var id = $(this).attr('id');
						id = id.substring(2, id.length);
						$('#'+id).prop('checked', false);
						$('#'+id).attr('checked', false);
						$(this).remove();
					});
				} else {
					$('input:checkbox[name="'+$(this).attr('name')+'"][data-all]').prop('checked', false);
					$('input:checkbox[name="'+$(this).attr('name')+'"][data-all]').attr('checked', false);
					$('input:checkbox[name="'+$(this).attr('name')+'"][data-all]').parent().removeClass('sel');
					$(this).parent().addClass('sel');
					$('label[name="'+$(this).attr('name')+'"][data-all]').remove();
					$('.selected').append('<label class="selected-item" id="lb' + itemId + '" name="'+ itemId.split('-')[0] +'"><input type="hidden" value="'+ itemVal + '" />' + itemId + '  &#215;' +'</label>');
					$('.selected-item').on('click', function(){
						var id = $(this).attr('id');
						id = id.substring(2, id.length);
						$('#'+id).prop('checked', false);
						$('#'+id).attr('checked', false);
						$(this).remove();
					});
				}
				if ($(this).attr('name') == '활동기간') {
					$('#lb' + itemId + ' > input').attr('name', 'pperiod');
				} else if($(this).attr('name') == '장르') {
					$('#lb' + itemId + ' > input').attr('name', 'pgenre');
				} else if($(this).attr('name') == '공연시간') {
					$('#lb' + itemId + ' > input').attr('name', 'pshowtime');
				} else {
					$('#lb' + itemId + ' > input').attr('name', 'ploc');
				}
			} else {
				$('#lb'+itemId).remove();
				$(this).parent().removeClass('sel');
			}
		}
	});
	
	$('a[id="srchSubmit"]').on('click', function(){
		srchBtn();
	});

	$('a[id="reset"]').on('click', function(){
		$('input:checkbox').prop('checked', false);
		$('input:checkbox').attr('checked', false);
		$('.sel').removeClass('sel');
		sliderInit(0, 24);
		$('.selected-item').remove();
	});
	
	
	$(function() {
		sliderInit(0, 24);
	});
	
	$('#tomorrow').on('change', function(){
		if($(this).is(':checked') == true){
			$("#slider-range").slider("destroy");
			sliderInit(0, 48);
		} else {
			sliderInit(0, 24);
		}
	});
	
	$('a[id="timeBtn"]').on('click', function(){
		var amount = $("#amount").val();
		var time = $("#time").val();
		if($('label[id="lb' + amount + '"]').length == 0) {
			$('.selected').append('<label class="selected-item" id="lb' + amount + '"><input type="hidden" value="'+ time + '" name="pshowtime" />공연시간 ' + amount + '  &#215;' + '</label>');
			$('.selected-item').on('click', function(){
				$(this).remove();
			});
		}
	});
	
	
	
	if($(document).height() > $(window).height()) {
		$("#btn").css("display", "none");
	}
	
});

function sliderInit(min, max) {
	$("#slider-range").slider({
	      range: true,
	      min: min,
	      max: max,
	      values: [8, 15],
	      slide: function(event, ui) {
	    	  var str1 = ui.values[0];
	    	  var str2 = ui.values[1];
	    	  $("#time").val(str1 + "~" + str2);
	    	  if(ui.values[0]>24){
	    		  str1 = "익일 " + Number(ui.values[0]-24);
	    	  }
	    	  if(ui.values[1]>24){
	    		  str2 = "익일 " + Number(ui.values[1]-24);
	    	  }
	        $("#amount").val(str1 + "시 ~ " + str2 + "시");
	        
	      }
	    });
	  var str1 = $("#slider-range").slider("values", 0);
	  var str2 = $("#slider-range").slider("values", 1);
	  $("#time").val(str1 + "~" + str2);
	  if($("#slider-range").slider("values", 0)>24){
		  str1 = "익일 " +Number(ui.values[0]-24);
	  }
	  if($("#slider-range").slider("values", 1)>24){
		  str2 = "익일 " + Number(ui.values[1]-24);
	  }
	$("#amount").val(str1 + "시 ~ " + str2 + "시");
	
}

function srchBtn() {
	if($(document).height() > $(window).height())
		$("#btn").css("display", "none");
	else $("#btn").css("display", "inline-block");
	$("#page").val(0);
	$(".grid-item").remove();
	loadSrch();
}

function loadSrch() {
	var frm = $("#srchFrm").serialize();
	var page = $("#page").val();
	$("#page").val(Number(page) + 1);
	$.ajax({
		type : "POST",
		url : "./loadSrch",
		data : frm+"&page="+page,
		success : appendList
	});
}

function loadFavo() {
	var page = $("#page").val();
	$("#page").val(Number(page) + 1);
	$.ajax({
		type : "POST",
		url : "./loadFavo",
		data : "page="+page,
		success : appendList
	});
}


function loadMain() {
	$.ajax({
		type : "POST",
		url : "./loadMain",
		success : appendList
	});
}

function appendList(list) {
	if($("#end").length) {
		$(".grid").append($list).masonry('appended',$list);
		$('.grid').masonry({
			  // options
			  itemSelector: '.grid-item',
			  percentPosition: true
		}).masonry();
		return;
	} else {
		var $list = $(list);
		$list.imagesLoaded(function (){
			$(".grid").append($list).masonry('appended',$list);
			$('.inner-item').on('click', function(){
				$('body').css({overflow: 'hidden'});
				var content = $(this).children().clone();
				$('.inner-content').html(content);
				$('.inner-content').addClass('on');
				$('.outer-content').addClass('on');
				$('.outer-back').addClass('on');
				var totalw = $(window).width();
				var ow = $('.inner-item').width();
				$('.inner-content').css('width', ow*2);
				$('.outer-back').css('top', $(window).scrollTop());
				$('.outer-back').css('width', totalw);
				$('.outer-back').css('height', $(window).height());
				$('.outer-content').css('top', $(window).scrollTop());
				$('.outer-content').css('width', totalw);
				$('.outer-content').css('height', $(window).height());
				var w = $('.inner-content').width();
				$('.inner-content').css('left', totalw/2-w/2-20);
				$('.inner-content').css('top', 50);
			});
		});
		var $grid = $('.grid').masonry({
			  // options
			  itemSelector: '.grid-item',
			  percentPosition: true
		});
		$grid.masonry('layout');
	}
}
