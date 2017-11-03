
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

	if($(document).height() > $(window).height())
		$("#btn").css("display", "none");
	$(window).scroll(function(){
		var scrollHeight = $(window).scrollTop() + $(window).height();
		var documentHeight = $(document).height();
		if($(document).height() > $(window).height())
			$("#btn").css("display", "none");
		if(scrollHeight == documentHeight){
			loadMain();
		}
	});
	
	$(window).resize(function(){
		var totalw = $(window).width();
		var totalh = $(window).height();
		$('.inner-back').css('width', totalw);
		$('.inner-back').css('height', totalh);
		var w = $('.inner-content').width();
		$('.inner-content').css('left', totalw/2-w/2);
		$('.inner-content').css('top', 50);
	});

	$('.inner-item').on('click', function(){
		$('body').css({overflow: 'hidden'});
		var content = $(this).children().clone();
		$('.inner-content').html(content);
		$('.inner-content').append('<div class="close-btn">&#215;</div>');
		$('.close-btn').on('click', function(){
			$('.inner-back').scrollTop(0);
			$('body').css({overflow: ''});
			$('.inner-content').removeClass('on');
			$('.inner-back').removeClass('on');
		});
		$('.inner-content').addClass('on');
		$('.inner-back').addClass('on');
		var totalw = $(window).width();
		var totalh = $(window).height();
		var ow = $('.inner-item').width();
		$('.inner-content').css('width', ow*2);
		$('.inner-back').css('top', $(window).scrollTop());
		$('.inner-back').css('width', totalw);
		$('.inner-back').css('height', totalh);
		var w = $('.inner-content').width();
		$('.inner-content').css('left', totalw/2-w/2-20);
		$('.inner-content').css('top', 50);
	});
	
	$('.inner-back').on('click', function(){
		$('.inner-back').scrollTop(0);
		$('body').css({overflow: ''});
		$('.inner-content').removeClass('on');
		$('.inner-back').removeClass('on');
	});
	
	$('input:radio[name=sido]').on('click', function(){
		$('.itemList').hide();
		var sido = $('input:radio[name=sido]:checked').val();
		$('#'+sido).show();
	});
	
	$('input:checkbox').on('change', function(){
		if($(this).is('[name]')){
			var itemId = $(this).attr('id');
			var itemVal = $(this).val();
			if($(this).is(':checked') == true) {
				if($(this).is('[data-all]')) {
					$('input:checkbox[name="'+ itemId +'"]').not('input:checkbox[id="'+ itemId +'"]').prop('checked', false);
					$('input:checkbox[name="'+ itemId +'"]').not('input:checkbox[id="'+ itemId +'"]').attr('checked', false);					
					$('.selected-item[id|="lb'+ itemId +'"]').remove();
					$('.selected').append('<label class="selected-item" id="lb' + itemId + '"><input type="hidden" value='+ itemVal + ' />' + itemId +'</label>');
					$('.selected-item').on('click', function(){
						var id = $(this).attr('id');
						id = id.substring(2, id.length);
						$('#'+id).prop('checked', false);
						$('#'+id).attr('checked', false);
						$(this).remove();
					});
				} else {
					$('#'+$(this).attr('name')).prop('checked', false);
					$('#'+$(this).attr('name')).attr('checked', false);
					$('#lb'+$(this).attr('name')).remove();
					$('.selected').append('<label class="selected-item" id="lb' + itemId + '"><input type="hidden" value="'+ itemVal + '" />' + itemId +'</label>');
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
			}
		}
	});
	
	$('a[id="srchSubmit"]').on('click', function(){
		loadSrch();
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
		var time = $("#amount").val();
		if($('label[id="lb' + time + '"]').length == 0) {
			$('.selected').append('<label class="selected-item" id="lb' + time + '"><input type="hidden" value="'+ time + '" name="pshowtime" />공연시간 ' + time +'</label>');
			$('.selected-item').on('click', function(){
				$(this).remove();
			});
		}
	});
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
	  if($("#slider-range").slider("values", 0)>24){
		  str1 = "익일 " +Number(ui.values[0]-24);
	  }
	  if($("#slider-range").slider("values", 1)>24){
		  str2 = "익일 " + Number(ui.values[1]-24);
	  }
	$("#amount").val(str1 + "시 ~ " + str2 + "시");
}

function loadSrch() {
	var data = $("#srchFrm").serialize();
	console.log(data);
	var page = $("#page").val();
	$("#page").val(Number(page) + 1);
	$.ajax({
		type : "POST",
		url : "./loadSrch",
		data : data
//		success : appendList
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
		return;
	} else {
		var $list = $(list);
		$list.imagesLoaded(function (){
			$(".grid").append($list).masonry('appended',$list);
			$('.grid').masonry({
				  // options
				  itemSelector: '.grid-item',
				  percentPosition: true,
				});
			$('.inner-item').on('click', function(){
				$('body').css({overflow: 'hidden'});
				var content = $(this).children().clone();
				$('.inner-content').html(content);
				$('.inner-content').append('<div class="close-btn">&#215;</div>');
				$('.close-btn').on('click', function(){
					$('.inner-back').scrollTop(0);
					$('body').css({overflow: ''});
					$('.inner-content').removeClass('on');
					$('.inner-back').removeClass('on');
				});
				$('.inner-content').addClass('on');
				$('.inner-back').addClass('on');
				var totalw = $(window).width();
				var ow = $('.inner-item').width();
				$('.inner-content').css('width', ow*2);
				$('.inner-back').css('top', $(window).scrollTop());
				$('.inner-back').css('width', totalw);
				$('.inner-back').css('height', $(window).height());
				var w = $('.inner-content').width();
				$('.inner-content').css('left', totalw/2-w/2-20);
				$('.inner-content').css('top', 50);
			});
		});
	}
}
