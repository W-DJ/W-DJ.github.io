$(function(){
	$("button#cBtn").click(function () {
		let chkVal = $("input[name=chk]").val();
		window.opener.document.getElementById("checked_id").setAttribute("value", chkVal);

		window.close();
	});
	//→ uId중복확인 버튼소스//
});