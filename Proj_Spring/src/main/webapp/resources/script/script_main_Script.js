$(function() {
	
	/////////* 부모창 링크 이동 시작*/////////
	
			/* 헤더 영역 시작*/
			
	$("button#homeBtn").click(function(){
		window.parent.location.href="/";
		});
	$("button#joinBtn").click(function(){
		window.parent.location.href="/join";
		});
	$("button#loginBtn").click(function(){
		window.parent.location.href="/login";
	});
	$("button#MypageBtn").click(function(){
		window.parent.location.href="/myPage";
	});
	$("button#InquireBtn").click(function(){
		window.parent.location.href="/Notlist";
	});
	$("button#PrListBtn").click(function(){
		window.parent.location.href="/prodList";
	});
	$("button#MemberListBtn").click(function(){
		window.parent.location.href="/MemList";
	});
	$("button#logOutBtn").click(function(){
		window.parent.location.href="/logout";
	});
	$("button#OftenBtn").click(function(){
		window.parent.location.href="/bbs_Often/list.jsp";
	});	
	$("div#headerLogoArea").click(function(){
		window.parent.location.href="/";
	});
	
	$("div#mypageImg").click(function(){
		window.parent.location.href="/myPage";
	});
	
	$("div#cartImg").click(function(){
		window.parent.location.href="/cart/cartList.jsp";
	});
	
	
	$("a#allGoods").click(function(){
		window.parent.location.href="/prodList";
	});
	
	$("a.typeSearch").click(function(){
		typeSearch = $(this).text().trim();
		window.parent.location.href="/prodList?typeSearch="+typeSearch;
	});
	
	$("a.orderBy").click(function(){
		orderBy = $(this).attr("data-orderBy");
		window.parent.location.href="/prodList?orderBy="+orderBy;
	});
	
			/* 헤더 영역 끝*/
			
			/* 푸터 영역 시작*/
	$("a#InquireMove").click(function(){
		window.parent.location.href="/Notlist";
	});
			
			/* 푸터 영역 끝*/
	
	
		/* 메인메뉴 pulldown 시작*/
	$("ul#mainMenu>li.mainLi").mouseover(function () {
       $(this).children("ul.subMenu").stop().slideDown();
	   $("iframe#headerIfm" , parent.document).css({
			"position": "relative",
			"z-index" : "10"
		});
    });
    $("ul#mainMenu>li.mainLi").mouseout(function () {
        $(this).children("ul.subMenu").stop().slideUp();
		$("iframe#headerIfm" , parent.document).css({
			"position": "static"
		});
    });


		/* 메인메뉴 pulldown 끝*/	
	
	function home() {
	location.href='/Notlist';
	}

	setInterval(fnSlide, 5000);
	
	function fnSlide() {
		
		$("#slideFrame").animate(
		{"margin-left": "-1200px"},
		2000,
		function(){
			// div#slideFrame 하위의 첫 번째 a요소를
			// 마지막 a요소 다음으로 이동하세요.
			$("#slideFrame a:first-child")
					.insertAfter("#slideFrame a:last-child");
			// #slideFrame의 margin-left를 원위치. margin-left: 0;
			$("#slideFrame").css({"margin-left": "0"});
		});
	};
	$(window).scroll(function(){
                let topPos = $(this).scrollTop();
                if(topPos > 50){
                    $("#topBtnArea").fadeIn(1000);
            }else{
                $("#topBtnArea").fadeOut(1000);
            }
        });
        $("div#topBtnArea").click(function(){
            $(window).scrollTop(0);
        });


	/* 더보기 클릭 시 상품 리스트 페이지 이동 시작  */
	
	$("button.typeSearch").click(function(){
		typeSearch = $(this).attr("data-typeSearch");
		location.href="/prodList?typeSearch="+typeSearch;
	});
	
	$("button.orderBy").click(function(){
		orderBy = $(this).attr("data-orderBy");
		location.href="/prodList?orderBy="+orderBy;
	});


	/* 더보기 클릭 시 상품 리스트 페이지 이동 끝*/


	$("div#wrap").mouseout(function(){
		$("iframe#headerIfm").css({
			"position" : "relative",
			"z-index" : "1"
		});
	});
	
	$("div#wrap").mouseover(function(){
		$("iframe#headerIfm").css({
			"position" : "static",
			"z-index" : "-1"
		});
	});
});

/*////////////////////////// jQuery 끝/////////////////////////*/

	/* 상품 클릭 시 상품상세보기 페이지 이동 시작 */

	function read(p1, p2) {
		
		let param = "/prodRead?num="+p1;
		     param += "&page="+p2;
		window.parent.location.href=param;
	}		
