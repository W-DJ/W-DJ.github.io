$(function(){
	/* 리뷰게시판 글쓰기 버튼 시작 /bbs/list.jsp */	
	$("#loginAlertBtn").click(function(){		
		alert("로그인 후 게시글을 작성하실 수 있습니다.");
	});	
	
	
	$("#writeBtn").click(function(){
		let orderCnt = $("input#orderCnt").val();
		
			let prodNum = $("input#prodNum").val();
			location.href="/reviewPost?prodNum="+prodNum;	
	
	});
	
	
	/* 리뷰게시판 페이지 글쓰기 버튼 끝 /bbs/list.jsp */
	

	
	/* 상품 게시글 내용보기페이지에서 수정버튼 시작 /bbs/read.jsp */
	$("button.modBtn").click(function(){
		let nowPage = $("input#nowPage").val().trim();
		let prodNum	= $("input#prodNum").val().trim();
		let totalReviewNum = $(this).siblings("input.totalReviewNum").val().trim();	
		
				
		let p3 = $("#pKeyField").val().trim();  // p3 : keyField
	    let p4 = $("#pKeyWord").val().trim();  // p4 : keyWord
	
		let url = "/reviewMod?";
			url +="prodNum="+prodNum;
			url += "&totalReviewNum="+totalReviewNum+"&page="+nowPage;
			url += "&keyField="+p3;
			url += "&keyWord="+p4;
		location.href=url;
	});
	
	/* 상품 게시글 내용보기페이지에서 수정버튼 끝 /bbs/read.jsp */
	
	
	
	/* 게시글 삭제버튼 시작 /bbs/read.jsp */
	$("button.delBtn").click(function(){
		
		let chkTF = confirm("게시글을 삭제하시겠습니까?");
		
		if (chkTF) {
			let nowPage = $("input#nowPage").val().trim();
			let prodNum	= $("input#prodNum").val().trim();
			let totalReviewNum = $(this).siblings("input.totalReviewNum").val().trim();		
			let p3 = $("#pKeyField").val().trim();  // p3 : keyField
		    let p4 = $("#pKeyWord").val().trim();  // p4 : keyWord
		    
			let url = "/reviewDel?";
				url +="prodNum="+prodNum;
				url += "&totalReviewNum="+totalReviewNum+"&page="+nowPage;
				url += "&keyField="+p3;
				url += "&keyWord="+p4;
			location.href=url;
		} else {
			alert("취소하셨습니다.");	
		}
		
	});
	/* 게시글 삭제버튼 끝 /bbs/read.jsp */
	
	
	/* 게시물 검색 시작 */
	$("form#searchFrm").submit(function(){				//검색어에서는 .trim()을 지양하는 추세
		let keyWord = $("#keyWord").val().trim();		//단 로그인, 회원가입 등에서는 ID에는 입력값 전후의 공백을 제거한다
		let prodNum	= $("input#prodNum").val();
		if (keyWord=="") {
			alert("검색어를 입력해주세요.");
			$("#keyWord").focus();
			return false;		
		}
	});	

	/* 게시물 검색 끝 */
	/* 리뷰게시물 추천버튼 시작 */
	$("button.recommendBtn").click(function(){
		let nowPage = $("input#nowPage").val();
		let prodNum	= $("input#prodNum").val();
		let totalReviewNum = $(this).siblings("input.totalReviewNum").val();	
		
		let p3 = $("#pKeyField").val().trim();  // p3 : keyField
	    let p4 = $("#pKeyWord").val().trim();  // p4 : keyWord
		
			let url = "/reviewRec?";
				url +="prodNum="+prodNum;
				url += "&totalReviewNum="+totalReviewNum+"&page="+nowPage;
				url += "&keyField="+p3;
				url += "&keyWord="+p4;
			location.href=url;		
	});
	
	/* 리뷰게시물 추천버튼 끝 */
});

function movePage(p1) {    // 페이지 이동
	
    let p4 = $("#pKeyWord").val().trim();  
    
    let prodNum	= $("input#prodNum").val();

	let p5 = $("#orderBy").val();
	let p6 = $("#typeSearch").val();
	
	let param = "/reviewList?prodNum="+prodNum+"&page="+p1;	    
	     param += "&keyWord="+p4;
		 param += "&orderBy="+p5; 
		param += "&typeSearch="+p6;
	location.href= param;

}


