$(function(){
    
	 // 주소 병합 소스만들기 시작
	$("button#orderBtn").click(function(){
      let postcode = $("input#postcode").val().trim();
      let address= $("input#address").val().trim();
      let uAddr=  postcode+ address;
      $("input#uAddr").val(uAddr);

    // 주소 병합 소스만들기 끝
	});
	
	$("form#orderFrm").submit(function(){
		oAddr = $("input#uAddr").val();
		if(oAddr=="" || oAddr == null) {
			alert("배송지를 입력해주세요");
			return false;
		}
		let chkNum = $("input[type=radio].payWay:checked").length;
		if(chkNum==0) {
			alert("결제수단을 선택해주세요");
			return false;
		}
	});
	let Addr = $("input#uAddr").val();
	let postNum = Addr.substr(0,5);
	let remainAddr = Addr.substr(5);
	$("input#postcode").val(postNum);
	$("input#address").val(remainAddr);
	
	let goodsPay = $("input.goodsPay").val();
	let delivFee = $("input.delivFee").val();
	let totalPay = $("input.totalPay").val();
	$("span.goodsPay").text(parseInt(goodsPay).toLocaleString()+"원");
	$("span.delivFee").text(parseInt(delivFee).toLocaleString()+"원");
	$("span.totalPay").text(parseInt(totalPay).toLocaleString()+"원");
});


/* 리스트페이지 페이징 시작 /bbs/list.jsp */
function movePage(p1) {    // 페이지 이동

	let param = "/orderList?page="+p1;	    
	location.href= param;

}
/* 리스트페이지 페이징 끝 /bbs/list.jsp */

