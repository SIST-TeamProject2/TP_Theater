$(function(){

	// CJ ONE 마케팅 정보 수신동의 - 모두 동의
	$("#chkbox_all").click(function(){
		var chk = $(this).is(":checked");
		
		if ( chk ) {
			$("input:checkbox[name='marketing_agree']").attr("checked", true);
		} else {
			$("input:checkbox[name='marketing_agree']").attr("checked", false);
		}
	});
	
	// select-생년월일 기본 설정
	setSelectBirth();
	
	// select(년) 또는 select(월)이 변경 되었을 때 select(일)의 개수 구하기
	$("#birth_year, #birth_month").change(function(){
		setSelectBirth();
	});
	

/* [아스키코드 표]
 * 32 공백(Space)
 * 33~47 특수 1
 * 48~57 숫자(0~9)
 * 58~64 특수 2
 * 65~90 영문(대)
 * 91~96 특수 3
 * 97~122 영문(소)
 * 123~126 특수 4
*/	
	
	// 비밀번호 검사
	$("#pw").keyup(function(){
		
		var inputPw = $(this).val();
		
		var charSpace = false;
		var charNum = false;
		var charEng = false;
		var charSpecial = false;
		
		// 영문 또는 숫자 확인 ※ 유니코드 검사
		for ( var i = 0; i < inputPw.length; i++ ) {
			
			// 비밀번호에 '공백'이 존재하는지 체크
			if ( inputPw.charCodeAt(i) == 32 ) {
			
				charSpace = true;
			}
			
			// 비밀번호에 '숫자'가 존재하는지 체크
			if ( inputPw.charCodeAt(i) >= 48 && inputPw.charCodeAt(i) <= 57 ) {
				
				charNum = true;
			}
			
			// 비밀번호에 '영문자'가 존재하는지 체크
			if ( (inputPw.charCodeAt(i) >= 65 && inputPw.charCodeAt(i) <= 90)
				|| (inputPw.charCodeAt(i) >= 97 && inputPw.charCodeAt(i) <= 122)
				 ) {
				
				charEng = true;
			}
			
			// 비밀번호에 '특수문자'가 존재하는지 체크
			if ( (inputPw.charCodeAt(i) >= 33 && inputPw.charCodeAt(i) <= 47)
				|| (inputPw.charCodeAt(i) >= 58 && inputPw.charCodeAt(i) <= 64)
				|| (inputPw.charCodeAt(i) >= 91 && inputPw.charCodeAt(i) <= 96)
				|| (inputPw.charCodeAt(i) >= 123 && inputPw.charCodeAt(i) <= 126)
				 ) {
				
				charSpecial = true;
			}
		}
		
		var text = "";
		
		if ( charSpace == true )		text = "공백이 포함될 수 없습니다.";
		else if ( charNum == false ) 	text = "숫자가 포함되어야 합니다.";
		else if ( charEng == false ) 	text = "영문자가 포함되어야 합니다.";
		else if ( charSpecial == false ) 	text = "특수문자가 포함되어야 합니다.";
		
		$("#result_pw").html(text);
	});
	
	
	// 비밀번호 확인 검사
	$("#pw_confirm").blur(function(){
		
		var inputPw = $("#pw").val();
		var inputPwCfm = $(this).val();
		var text = "";
		
		if ( inputPw != inputPwCfm ) {
			text = "비밀번호가 일치하지 않습니다.";
		}
		
		$("#result_pw_confirm").html(text);
	});
	
	
	// 이메일 검사
	$("#email").blur(function(){
		
		var inputEmail = $("#email").val();
		
		var charSpace = false;
		var charSpecial = false;
		
		// 영문 또는 숫자 확인 ※ 유니코드 검사
		for ( var i = 0; i < inputEmail.length; i++ ) {
			
			// 이메일에 '공백'이 존재하는지 체크
			if ( inputEmail.charCodeAt(i) == 32 ) {
			
				charSpace = true;
			}
			
			// 이메일에 지정된 '특수문자(-,.,_)'외의 특수문자가 존재하는지 체크 ※ 45, 46, 95
			
			if ( (inputEmail.charCodeAt(i) >= 33 && inputEmail.charCodeAt(i) <= 44)
				|| inputEmail.charCodeAt(i) == 47
				|| (inputEmail.charCodeAt(i) >= 58 && inputEmail.charCodeAt(i) <= 64)
				|| (inputEmail.charCodeAt(i) >= 91 && inputEmail.charCodeAt(i) <= 94)
				|| inputEmail.charCodeAt(i) == 96
				|| (inputEmail.charCodeAt(i) >= 123 && inputEmail.charCodeAt(i) <= 126) ) {			
				
				charSpecial = true;
			}
		}
		
		var text = "";
		
		if ( charSpace == true )			text = "공백이 포함될 수 없습니다.";
		else if ( charSpecial == true ) 	text = "'-','.','_' 외의 특수문자는 사용할 수 없습니다.";
		
		$("#result_email").html(text);
	});
});

//생년월일 select box의 날짜 설정
function setSelectBirth() {
	
	var selYear = $("#birth_year").val();		// select(년)에서 선택된 값
	var selMonth = $("#birth_month").val();		// select(월)에서 선택된 값
	var date = new Date(selYear, selMonth, 0);
	var lastDay = date.getDate();				// select(년, 월) 값으로 설정된 날짜의 마지막 날 구하기
	
	var str = "";
	
	for ( var i = 1; i < lastDay+1; i++ ) {
		str += "<option label='" + i + "' value='" + i + "'/>";
	}
	
	$("#birth_day").html(str);
}

// 아이디 중복 검사
function checkId() {
	
	var minLength = 6;
	var inputId = $("#id").val();
	
	if ( inputId == "" ) {
		
		alert("아이디를 입력해주세요.");
		$("#id").focus();
		
		return false;
		
	} else if ( inputId.length < minLength ) {
		
		alert("최소 6글자 이상 입력해주세요.");
		$("#id").focus();
		
		return false;
	}
	
	var charSpace = false;
	var charNum = false;
	var charEng = false;
	
	// 영문 또는 숫자 확인 ※ 유니코드 검사
	for ( var i = 0; i < inputId.length; i++ ) {
		if ( !(inputId.charCodeAt(i) >= 65 && inputId.charCodeAt(i) <= 90)
			&& !(inputId.charCodeAt(i) >= 97 && inputId.charCodeAt(i) <= 122)
			&& !(inputId.charCodeAt(i) >= 48 && inputId.charCodeAt(i) <= 57)) {
			
			alert("영문 또는 숫자만 입력 가능합니다.");
			$("#id").focus();
			
			return false;
		}
		
		// 아이디에 '공백'이 존재하는지 체크
		if ( inputId.charCodeAt(i) == 32 ) {
		
			charSpace = true;
		}
		
		// 아이디에 '숫자'가 존재하는지 체크
		if ( inputId.charCodeAt(i) >= 48 && inputId.charCodeAt(i) <= 57 ) {
			
			charNum = true;
		}
		
		// 아이디에 '영문자'가 존재하는지 체크
		if ( (inputId.charCodeAt(i) >= 65 && inputId.charCodeAt(i) <= 90)
			|| (inputId.charCodeAt(i) >= 97 && inputId.charCodeAt(i) <= 122)
			 ) {
			
			charEng = true;
		}
		
	}
	
	if ( charSpace == true ) {
		
		alert("공백이 포함될 수 없습니다."); 
		return false;
		
	} else if ( charNum == false ) {
		
		alert("숫자가 포함되어야 합니다.");
		return false;
		
	} else if ( charEng == false ) {
		
		alert("영문자가 포함되어야 합니다.");
		return false;
	}
	
	// 현재 수직 스크롤 좌표 값을 실시간으로 저장
	var scrollPos = $(document).scrollTop();
	
	// ID 체크를 위해 DB 검사하는 페이지로 이동
	location.href="m_join_check_id.jsp?id=" + inputId + "&scrollPos=" + scrollPos;
	
	return true;
}

// 비밀번호 검사
function checkPw() {
	
}

// 이메일 도메인 입력
function inputEmail(inputType) {
	
	var emailDomain = document.getElementById("email_domain");
	var type = inputType.value;
	
	emailDomain.value = type;
	
}

// 휴대전화번호 숫자 외 입력 방지
function checkNum(inputVal) {
	
	var id = inputVal.id;
	var textbox = document.getElementById(id);
	var inputText = inputVal.value;
	var text = "";
	
	if ( isNaN(inputText) ) {
		
		textbox.value = "";
		
		text = "숫자만 입력 가능합니다.";
		$("#result_phone").html(text);
		
	} else {
		
		text = "";
		$("#result_phone").html(text);
	}
}
