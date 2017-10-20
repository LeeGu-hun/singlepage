<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="modal-content" aria-hidden="true">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal">
			<span aria-hidden="true">×</span><span class="sr-only">Close</span>
		</button>
		<h3 class="modal-title" id="lineModalLabel">후원</h3>
	</div>
	<div class="modal-body">

		<!-- content goes here -->
		<form>
			<div class="form-group">
				<label>후원금액</label><br /> <input id="oneth" type="radio"
					name="money" value="one" /> <label for="oneth">1000원</label> <input
					id="thrth" type="radio" name="money" value="three" /> <label
					for="thrth">3000원</label> <input id="fivth" type="radio"
					name="money" value="five" /> <label for="fivth">5000원</label><br />
				<input id="tenth" type="radio" name="money" value="ten" /> <label
					for="tenth">10000원</label> <input id="in" type="radio" name="money"
					value="in" /> <label for="in">직접입력</label> <input id="in_money"
					type="text" name="in_money" /> <label>원</label>
			</div>
		</form>
	</div>
	<div class="modal-footer">
		<div class="btn-group btn-group-justified" role="group"
			aria-label="group button">
			<div class="btn-group" role="group">
				<button type="button" class="btn btn-default" data-dismiss="modal"
					role="button">Close</button>
			</div>
			<div class="btn-group" role="group">
				<button type="button" id="saveImage"
					class="btn btn-default btn-hover-green" data-action="save"
					role="button">Save</button>
			</div>
		</div>
	</div>
</div>