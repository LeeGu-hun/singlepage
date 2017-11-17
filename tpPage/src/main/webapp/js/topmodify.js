$(document).ready(function() {
	$('input:checkbox').on('change', function(){
		if($(this).is(':checked') == true){
			$('#checked'+$(this).val()).val(1);
		} else {
			$('#checked'+$(this).val()).val(0);
		}
	});	
	
	if($('#originCnt').val()==1) {
		$('#del1').hide();
	}
})

function imgreadURL(input) {
	if(input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function(e) {
			var id = $(input).attr('id').substr(4,1);
			$('#tuploadImg'+id).attr('src', e.target.result);
			$('#tuploadImg'+id).attr('width', 200);
		}
		reader.readAsDataURL(input.files[0]);
	}
}

function addlist() {
	var count = $('#count').val();
	
	if(count <= 5) {
		count ++;
		$('#count').val(count);
		$('#list').append("<div class='topList' id='order"+count+"'>"
				+"<input type='hidden' id='tid" + count + "' name='tid' value='' />"
				+"<input type='hidden'  id='turn" + count + "' name='turn' value='" + count + "' />" 
				+"<input type='hidden' id='checked" + count + "' name='checked'  value='0' />" 
				+"<input type='checkbox' id='ck" + count + "' value='"+ count +"'/>보이기 " 
				+"<span class='delspan'>" 
				+"<input type='button' class='btn btn-custom' id='del" + count + "' value='삭제' onclick='deleteList(" + count + ")'/></span><hr>" 
				+"<div class='col-md-6 form-inline'>" 
				+"<label>링크: &nbsp; &nbsp;</label><input class='form-control' type='text' id='link"+ count +"' name='link' value='' /><br/><br/> " 
				+"<label>이미지: <input type='file' id='thum"+ count +"' name='thum' accept='image/gif, image/jpeg, image/png' onchange='imgreadURL(this)' />"
				+"<input type='hidden' id='tupdir" + count + "' name='tupdir' value='"+$('#realPath').val()+"' /></label>" 
				+"</div><div class='col-md-6'><img id='tuploadImg"+ count +"' name='tuploadImg'/>" 
				+"</div></div>");
		if(count > 1) {
			$('#del1').show();					
		}
		$('input:checkbox').on('change', function(){
			if($(this).is(':checked') == true){
				$('#checked'+$(this).val()).val(1);
			} else {
				$('#checked'+$(this).val()).val(0);
			}
		});	
	}
	if(count == 6) {
		$('#plus').hide();
	}
}

function deleteList(num) {
	var count = $('#count').val()-1;
	var turn = $("#turn"+num).value;
	
	if(count > 1) {
		$("#order"+num).remove();
		for(var i=(num+1); i<=(count+1); i++) {
			$("#order"+i).attr("id", "order"+(i-1));
			$("#tid"+i).attr("id", "tid"+(i-1));
			$("#turn"+i).val(i-1);
			$("#turn"+i).attr("id", "turn"+(i-1));
			$("#checked"+i).attr("id", "checked"+(i-1));
			$("#ck"+i).val((i-1));
			$("#ck"+i).attr("id", "ck"+(i-1));
			$("#del"+i).attr("onclick", "deleteList("+(i-1)+")");
			$("#del"+i).attr("id", "del"+(i-1));
			$("#link"+i).attr("id", "link"+(i-1));
			$("#thum"+i).attr("id", "thum"+(i-1));
			$("#tupdir"+i).attr("id", "tupdir"+(i-1));
			$("#tuploadImg"+i).attr("id", "tuploadImg"+(i-1));
		}
	} else {
		$("#order"+num).remove();	
		for(var i=(num+1); i<=(count+1); i++) {
			$("#order"+i).attr("id", "order"+(i-1));
			$("#tid"+i).attr("id", "tid"+(i-1));
			$("#turn"+i).val(i-1);
			$("#turn"+i).attr("id", "turn"+(i-1));
			$("#checked"+i).attr("id", "checked"+(i-1));
			$("#ck"+i).val((i-1));
			$("#ck"+i).attr("id", "ck"+(i-1));
			$("#del"+i).attr("onclick", "deleteList("+(i-1)+")");
			$("#del"+i).attr("id", "del"+(i-1));
			$("#link"+i).attr("id", "link"+(i-1));
			$("#thum"+i).attr("id", "thum"+(i-1));
			$("#tupdir"+i).attr("id", "tupdir"+(i-1));
			$("#tuploadImg"+i).attr("id", "tuploadImg"+(i-1));
		}
		$('#del1').hide();
	}
	$('#count').val(count);
	
	if(count < 6) {
		$('#plus').show();
	}
	
}