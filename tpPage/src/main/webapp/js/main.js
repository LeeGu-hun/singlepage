
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
		var h = $('.inner-content').height();
		$('.inner-content').css('left', totalw/2-w/2);
		$('.inner-content').css('top', $(window).scrollTop() + $(window).height()/2 - 350);
	});

	$('.inner-item').on('click', function(){
		var content = $(this).children().clone();
		$('.inner-content').html(content);
		$('.inner-content').append('<div class="close-btn">&#215;</div>');
		$('.close-btn').on('click', function(){
			$('.inner-content').removeClass('on');
			$('.inner-back').removeClass('on');
		});
		$('.inner-content').addClass('on');
		$('.inner-back').addClass('on');
		var totalw = $(window).width();
		var totalh = $(window).height();
		var ow = $('.inner-item').width();
		$('.inner-content').css('width', ow*2);
		$('.inner-back').css('width', totalw);
		$('.inner-back').css('height', totalh);
		var w = $('.inner-content').width();
		var h = $('.inner-content').height();
		$('.inner-content').css('left', totalw/2-w/2-20);
		$('.inner-content').css('top', $(window).scrollTop() + $(window).height()/2 - 350);
	});
	
	$('.inner-back').on('click', function(){
		$('.inner-content').removeClass('on');
		$('.inner-back').removeClass('on');
	});
	
	$('input:radio[name=sido]').on('click', function(){
		$('.itemList').hide();
		var sido = $('input:radio[name=sido]:checked').val();
		$('#'+sido).show();
	});
	
	$('input:checkbox').on('change', function(){
		var itemId = $(this).attr('id');
		var itemVal = $(this).val();
		var apItem = '<label class="selected-item" id="lb' + itemId + '"><input type="hidden" value='+ itemVal + ' />' + itemVal +'</label>';
		if ($(this).attr('data-cate') == 'loc') {
			
		} else if($(this).attr('data-cate') == 'genre') {
			
		} else if($(this).attr('data-cate') == 'genre')
		if($(this).is(':checked') == true) {
			if($(this).is('[data-all]')) {
				$('input:checkbox[name="'+ itemVal +'"]').not('input:checkbox[id="'+ itemVal +'"]').prop('checked', false);
				$('input:checkbox[name="'+ itemVal +'"]').not('input:checkbox[id="'+ itemVal +'"]').attr('checked', false);					
				$('.selected-item[id|="lb'+ itemVal +'"]').remove();
				$('.selected').append('<label class="selected-item" id="lb' + itemId + '"><input type="hidden" value='+ itemVal + ' />' + itemVal +'</label>');
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
				$('.selected').append('<label class="selected-item" id="lb' + itemId + '"><input type="hidden" value="'+ itemVal + '" />' + itemVal +'</label>');
				$('.selected-item').on('click', function(){
					var id = $(this).attr('id');
					id = id.substring(2, id.length);
					$('#'+id).prop('checked', false);
					$('#'+id).attr('checked', false);
					$(this).remove();
				});
			}
		} else {
			$('#lb'+itemId).remove();
		}
	});

	
});

function loadMain() {
	var params = {
			type : "POST",
			url : "./loadMain",
			success : appendList
	};
	if ($("#srch").length) {
		var page = $("#page").val();
		$("#page").val(Number(page) + 1);
		params.data = "srch=" + $("#srch").val() + "&page=" + page;
	}
	$.ajax(params);
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
		});
		$('.inner-item').on('click', function(){
			var content = $(this).children().clone();
			$('.inner-content').html(content);
			$('.inner-content').append('<div class="close-btn">&#215;</div>');
			$('.close-btn').on('click', function(){
				$('.inner-content').removeClass('on');
				$('.inner-back').removeClass('on');
			});
			$('.inner-content').addClass('on');
			$('.inner-back').addClass('on');
			var totalw = $(window).width();
			var totalh = $(document).height();
			var scrollHeight = $(window).scrollTop() + $(window).height();
			var documentHeight = $(document).height();
			var h = documentHeight - scrollHeight;
			var ow = $('.inner-item').width();
			$('.inner-content').css('width', ow*2);
			$('.inner-back').css('width', totalw);
			$('.inner-back').css('height', totalh);
			var w = $('.inner-content').width();
			var h = $('.inner-content').height();
			$('.inner-content').css('left', totalw/2-w/2-20);
			$('.inner-content').css('top', $(window).scrollTop() + $(window).height()/2 - 350);
		});
	}
}
