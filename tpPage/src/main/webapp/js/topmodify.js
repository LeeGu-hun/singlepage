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
		$('#list').append("<div class='topList'>" 
				+"<input type='hidden' id='checked" + count + "' name='checked'  value='0' />" 
				+"<input type='hidden' id='turn" + count + "' name='turn' value='" + count + "' />" 
				+"<input type='checkbox' value='"+ count +"'/>보이기 <hr>" 
				+"<div class='col-md-6'>" 
				+"<label>링크: </label><input type='text' id='link"+ count +"' name='link'/><br/><br/> " 
				+"<label>이미지: <input type='file' id='thum"+ count +"' name='thum' onchange='imgreadURL(this)'/>"
				+"<input type='hidden' id='tupdir" + count + "' name='tupdir' value='<%=request.getRealPath('/tuploads/')%>' /></label>" 
				+"</div><div class='col-md-6'><img id='tuploadImg"+ count +"' name='tuploadImg'/>" 
				+"</div></div><br/>");
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

$(document).ready(function() {
	$('input:checkbox').on('change', function(){
		if($(this).is(':checked') == true){
			$('#checked'+$(this).val()).val(1);
		} else {
			$('#checked'+$(this).val()).val(0);
		}
	});	
})

