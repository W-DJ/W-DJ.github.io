$(function(){
	
	 //이메일 주소 병합 소스 만들기 시작
	$("button#modBtn").click(function(){
	let uEmail1 = $("input#uEmail1").val();
	let uEmail2 = $("input#uEmail2").val();
	let uEmail =uEmail1+"@"+uEmail2;
	$("input#uEmail").val(uEmail);
     //이메일 주소 병합 소스 만들기 끝
    
	 // 주소 병합 소스만들기 시작
      let postcode = $("input#postcode").val().trim();
      let address= $("input#address").val().trim();
      let uAddr=postcode+ address;
      $("input#uAddr").val(uAddr);

    // 주소 병합 소스만들기 끝
	});
	 $("select#valSel").change(function() {
		$('#valSel option:selected').each(function() {
			if ($(this).val() == "") {
				$("#uEmail2").val("");
				$("#uEmail2").attr("disabled", false);
			} else {
				$("#uEmail2").val($(this).text());
				$("#uEmail2").attr("disabled", true);
			}
	    });  //→ 이메일 선택요소
	});
	
	let uEmail = $("input#uEmail").val();
	let uEmailArr = uEmail.split('@');
	let uEmail1 =uEmailArr[0];
	let uEmail2 =uEmailArr[1];
	$("input#uEmail1").val(uEmail1);
	$("input#uEmail2").val(uEmail2);
	
	let Addr = $("input#uAddr").val();
	let postNum = Addr.substr(0,5);
	let remainAddr = Addr.substr(5);
	$("input#postcode").val(postNum);
	$("input#address").val(remainAddr);
	
	
	 let uGender = $("input.gender").val();
    if(uGender == 1){
	$("input.male").prop("checked",true).attr("disabled",true);
    }else if(uGender ==2){
	$("input.female").prop("checked",true).attr("disabled",true);
    }else if(uGender ==3){
	$("input.none").prop("checked",true).attr("disabled",true);
    }
	
	});

   