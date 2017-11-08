function imgreadURL(input) {
	if(input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function(e) {
			$('#tuploadImg').attr('src', e.target.result);
			$('#tuploadImg').attr('width', 200);
		}
		reader.readAsDataURL(input.files[0]);
	}
}

function addlist() {
	var count = $('input[name=carousel]').val();
	$("#list").append("<div class='topList'><input type='checkbox' name='carousel'/>보이기 <hr>" 
			+"<div class='col-md-6'><label>링크: </label><input type='text' id='link' name='link' value=''/><br/><br/>	" 
			+"<label>이미지: <input type='file' id='thum' name='thum' onchange='imgreadURL(this);'/></label>" 
			+"</div><div class='col-md-6'><img id='tuploadImg' name='tuploadImg'/></div></div><br/>");
}