$(function(){

	// select(년) 또는 select(월)이 변경 되었을 때 select(일)의 개수 다시 설정
	$("#birth_year, #birth_month").change(function(){
		createBirthDayList();
	});
	
	
	// 아이디 중복 확인 버튼
	$("#btn_chk_id").click(function(){
		
		var result = checkId();
		
		if ( result ) {
			$.ajax({
				
				type : "POST",
				url : "join_check_id.jsp",
				data: { "m_id" : $("#m_id").val() },
				dataType: "html",
				
				success : function(data){
				    $("#result_id").html(data) ;
				},
				
				error : function(){
				    alert("중복검사 실패...");
				}
			});
		}
	});
	
////////// 마케팅 수신 동의 체크(3개가 전부 선택되면 모두 선택이 자동 체크) //////////
	
	// 화면 진입 시 각 항목이 모두 체크된 상태면 '모두 동의'가 체크됨 ※ 회원정보 수정 화면에서 적용
	if ( $("#chkbox_email, #chkbox_sms, #chkbox_phone").is(":checked") ) {
		$("#chkbox_all").attr("checked", true);
	}
	
	// 각 항목들이 체크될 때 모든 항목이 체크 되면 '모두 동의'가 체크됨
	$("#chkbox_email, #chkbox_sms, #chkbox_phone").click(function(){
		
		var chkEmail = $("#chkbox_email").is(":checked");
		var chkSMS = $("#chkbox_sms").is(":checked");
		var chkPhone = $("#chkbox_phone").is(":checked");
		
		if ( chkEmail && chkSMS && chkPhone ) {
			$("#chkbox_all").attr("checked", true);
		}
	});
});


////////// 생년월일 select(일)의 개수 설정 //////////

function createBirthDayList(memberDay) {
	
	var selYear = $("#birth_year").val();		// select(년)에서 선택된 값
	var selMonth = $("#birth_month").val();		// select(월)에서 선택된 값
	var date = new Date(selYear, selMonth, 0);
	var lastDay = date.getDate();				// select(년, 월) 값으로 설정된 날짜의 마지막 날 구하기
	
	var htmlTag = "";
	
	for ( var i = 1; i < lastDay+1; i++ ) {
		htmlTag += "<option label='" + i + "' value='" + i + "'/>";
	}
	
	$("#birth_day").html(htmlTag);
	$("#birth_day option:eq(" + memberDay + ")").attr("selected", "selected");
}


////////// 회원 가입 취소 //////////

function checkCancelAddMember() {
	
	var result = confirm("회원가입을 취소하시겠습니까?");
	if ( result ) {
		return true;
	}
	
	return false;
}


//////////////////////////////

		// [입력값 검사] //

//////////////////////////////

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

////////// 아이디 중복 검사 //////////

function checkId() {
	
	var minLength = 6;
	var inputId = $("#m_id").val();
	
	if ( inputId == "" ) {
		
		alert("아이디를 입력해주세요.");
		$("#m_id").focus();
		
		return false;
		
	} else if ( inputId.length < minLength ) {
		
		alert("최소 6글자 이상 입력해주세요.");
		$("#m_id").focus();
		
		return false;
	}
	
	var charSpace = false;
	var charNum = false;
	var charEng = false;
	
	// 공백, 숫자, 영문자 확인 ※ 유니코드 검사
	for ( var i = 0; i < inputId.length; i++ ) {
		if ( !(inputId.charCodeAt(i) >= 65 && inputId.charCodeAt(i) <= 90)
			&& !(inputId.charCodeAt(i) >= 97 && inputId.charCodeAt(i) <= 122)
			&& !(inputId.charCodeAt(i) >= 48 && inputId.charCodeAt(i) <= 57)) {
			
			alert("영문 또는 숫자만 입력 가능합니다.");
			$("#m_id").focus();
			
			return false;
		}
		
		// '공백' 체크
		charSpace = isSpace(inputId, i);
		
		// '숫자' 체크
		if ( inputId.charCodeAt(i) >= 48 && inputId.charCodeAt(i) <= 57 ) {
			
			charNum = true;
		}
		
		// '영문자' 체크
		if ( (inputId.charCodeAt(i) >= 65 && inputId.charCodeAt(i) <= 90)
			|| (inputId.charCodeAt(i) >= 97 && inputId.charCodeAt(i) <= 122)
			 ) {
			
			charEng = true;
		}
		
	}
	
	if ( charSpace ) {
		
		alert("공백이 포함될 수 없습니다."); 
		return false;
		
	} else if ( !charNum ) {
		
		alert("숫자가 포함되어야 합니다.");
		return false;
		
	} else if ( !charEng ) {
		
		alert("영문자가 포함되어야 합니다.");
		return false;
	}
	
	return true;
}


////////// 비밀번호 검사 //////////

function checkPw() {
	
	var inputPw = $("#m_pw").val();
	
	var charSpace = false;
	var charNum = false;
	var charEng = false;
	var charSpecial = false;
	var charMinLength = false;
	
	// 공백, 영문, 숫자, 특수문자 확인 ※ 유니코드 검사
	for ( var i = 0; i < inputPw.length; i++ ) {
		
		// '공백'이 존재하는지 체크
		if ( !charSpace ) {
			charSpace = isSpace(inputPw, i);
		}
		
		// '숫자'가 존재하는지 체크
		if ( !charNum ) {
			charNum = isNum(inputPw, i);
		}
		
		// 비밀번호에 '영문자'가 존재하는지 체크
		if ( (inputPw.charCodeAt(i) >= 65 && inputPw.charCodeAt(i) <= 90)
			|| (inputPw.charCodeAt(i) >= 97 && inputPw.charCodeAt(i) <= 122)
			&& !charEng ) {
			
			charEng = true;
		}
		
		// 비밀번호에 '특수문자'가 존재하는지 체크
		if ( (inputPw.charCodeAt(i) >= 33 && inputPw.charCodeAt(i) <= 47)
			|| (inputPw.charCodeAt(i) >= 58 && inputPw.charCodeAt(i) <= 64)
			|| (inputPw.charCodeAt(i) >= 91 && inputPw.charCodeAt(i) <= 96)
			|| (inputPw.charCodeAt(i) >= 123 && inputPw.charCodeAt(i) <= 126)
			&& !charSpecial ) {
			
			charSpecial = true;
		}
	}
	
	if ( inputPw.length < 8 ) {
		charMinLength = true;
	}
	
	var text = "";
	
	if ( charSpace )			text = "공백이 포함될 수 없습니다.";
	else if ( !charNum ) 		text = "숫자가 포함되어야 합니다.";
	else if ( !charEng ) 		text = "영문자가 포함되어야 합니다.";
	else if ( !charSpecial ) 	text = "특수문자가 포함되어야 합니다.";
	else if ( charMinLength )	text = "최소 8글자 이상이어야 합니다.";
	
	$("#result_pw").html(text);
	
	if ( charSpace || !charNum || !charEng || !charSpecial || charMinLength ) {
		return false;
	} else {
		return true;
	}
}


////////// 비밀번호 확인 검사 //////////

function checkPwConfirm() {
	
	var checkPw = false;
	var inputPw = $("#m_pw").val();
	var inputPwCfm = $("#m_pw_confirm").val();
	var text = "";
	
	if ( inputPw != inputPwCfm ) {
		text = "비밀번호가 일치하지 않습니다.";
	} else {
		checkPw = true;
	}
	
	$("#result_pw_confirm").html(text);
	
	if ( !checkPw ) {
		return false;
	} else {
		return true;
	}
}


////////// 이름 검사 //////////

function checkName() {
	
	var inputName = $("#m_name").val();
	
	if ( inputName == "" ) {
		
		alert("이름을 입력해주세요.");
		$("#m_name").focus();
		
		return false;
		
	}
	
	var charSpace = false;
	var charNum = false;
	var charSpecial = false;
	
	// 공백, 숫자, 특수문자 확인 ※ 유니코드 검사
	for ( var i = 0; i < inputName.length; i++ ) {
		
		// 이름에 '공백'이 존재하는지 체크
		charSpace = isSpace(inputName, i);
		
		// 이름에 '숫자'가 존재하는지 체크
		charNum = isNum(inputName, i);
		
		// 이름에 '특수문자'가 존재하는지 체크
		if ( (inputName.charCodeAt(i) >= 33 && inputName.charCodeAt(i) <= 47)
			|| (inputName.charCodeAt(i) >= 58 && inputName.charCodeAt(i) <= 64)
			|| (inputName.charCodeAt(i) >= 91 && inputName.charCodeAt(i) <= 96)
			|| (inputName.charCodeAt(i) >= 123 && inputName.charCodeAt(i) <= 126)
			&& !charSpecial ) {
			
			charSpecial = true;
		}
		
		if ( charSpace || charNum || charSpecial ) {
			break;
		}
	}
	
	var text = "";
	
	if ( charSpace )			text = "공백이 포함될 수 없습니다.";
	else if ( charNum ) 		text = "숫자가 포함될 수 없습니다.";
	else if ( charSpecial ) 	text = "특수문자가 포함될 수 없습니다.";
	
	$("#result_name").html(text);
	
	if ( charSpace || charNum || charSpecial ) {
		return false;
	} else {
		return true;
	}
}


////////// 이메일 검사 //////////

function checkEmail() {
	
	var inputEmail = $("#m_email").val();
	var charSpace = false;
	var charSpecial = false;
	
	// 공백, 특수문자 확인 ※ 유니코드 검사
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
	
	if ( charSpace )			text = "공백이 포함될 수 없습니다.";
	else if ( charSpecial ) 	text = "사용할 수 없는 특수문자입니다.";
	
	$("#result_email").html(text);
	
	if ( charSpace || charSpecial ) {
		return false;
	} else {
		return true;
	}
}


////////// 이메일 도메인 검사 //////////

function checkEmailDomain() {
	
	var inputEmailDomain = $("#m_email_domain").val();
	var charSpace = false;
	
	// 공백 확인 ※ 유니코드 검사
	for ( var i = 0; i < inputEmailDomain.length; i++ ) {
		
		if ( !charSpace ) {
			charSpace = isSpace(inputEmailDomain, i);
		}
	}
	
	var text = "";
	
	if ( charSpace ) text = "공백이 포함될 수 없습니다.";
	
	$("#result_email").html(text);
	
	if ( charSpace ) {
		return false;
	} else {
		return true;
	}
}


////////// 이메일 도메인 자동 입력 //////////

function inputEmailDomain(inputType) {
	
	var type = inputType.value;
	$("#m_email_domain").val(type);
	
}


////////// 휴대전화번호  검사 //////////

function checkPhone(inputVal) {
	
	var inputPhone = inputVal.val();
	var charSpace = false;
	var charText = false;
	var charMinLength = false;
	
	for ( var i = 0; i < inputPhone.length; i++ ) {
		// '공백'이 존재하는지 체크
		charSpace = isSpace(inputPhone, i);
		
		if ( charSpace ) {
			break;
		}
	}
	
	if ( isNaN(inputPhone) ) {
		charText = true;
	}
	
	if ( inputPhone.length <= 2 ) {
		charMinLength = true;
	}
	
	var text = "";
	
	if ( charSpace )			text = "공백이 포함될 수 없습니다.";
	else if ( charText )		text = "숫자만 입력 가능합니다.";
	else if ( charMinLength )	text = "휴대전화번호가 짧습니다.";
	
	$("#result_phone").html(text);
	
	if ( charSpace || charText ) {
		return false;
	} else {
		return true;
	}
}


////////// 최종 입력 정보 체크 //////////
function checkMemberInfo(member) {

/* [체크 항목]
 * 아이디
 * 비밀번호
 * 비밀번호 확인
 * 이름
 * 이메일
 * 이메일 도메인
 * 휴대전화번호(두 번째)
 * 휴대전화번호(세 번째)
 */	
	
	// 로그인 상태가 아닌 경우에만 적용 ※ 회원정보 수정 화면에서는 체크할 필요 없음
	if ( member == null ) {
		// 아이디 체크
		var confirmId = false;
		var inputId = $("#m_id").val();
		var resultId = $("#resultCheckId").val();
		
		if ( inputId == "" ) {
			
			alert("아이디를 입력해주세요.");
			moveScroll($("#m_id"));
			
			return false;
			
		} else if ( resultId == "same" || inputId != resultId ) {
			
			alert("아이디가 이미 존재하거나 중복 확인이 되지 않은 아이디입니다.");
			moveScroll($("#m_id"));
			
			return false;
			
		} else {
			confirmId = true;
		}
	}
	
	
	// 비밀번호 체크
	var confirmPw = checkPw();
	
	if ( !confirmPw ) {
		
		alert("비밀번호를 다시 확인해주세요.");
		moveScroll($("#m_pw"));
		
		return false;
	}
	
	// 비밀번호 확인 체크
	var confirmPwCfm = checkPwConfirm();
	
	if ( !confirmPwCfm ) {
		
		alert("비밀번호 확인을 다시 확인해주세요.");
		moveScroll($("#m_pw_confirm"));
		
		return false;
	}
	
	// 이름 체크
	var confirmName = checkName();
	
	if ( !confirmName ) {
		
		alert("이름을 다시 확인해주세요.");
		moveScroll($("#m_name"));
		
		return false;
	}
	
	// 이메일 체크
	var inputEmail = $("#m_email").val();
	
	if ( inputEmail == "" ) {
		
		alert("이메일을 입력해주세요.");
		$("#m_email").focus();
		
		return false;
	}
	
	var confirmEmail = checkEmail();
	
	if ( !confirmEmail ) {
		
		alert("이메일을 다시 확인해주세요.");
		moveScroll($("#m_email"));
		
		return false;
	}
	
	// 이메일 도메인 체크
	var inputEmailDomain = $("#m_email_domain").val();
	var confirmEmailDomain = checkEmailDomain();
	
	if ( inputEmailDomain == "" ) {
		
		alert("이메일 도메인을 입력해주세요.");
		$("#m_email_domain").focus();
		
		return false;
	}
	
	if ( !confirmEmailDomain ) {
		
		alert("이메일 도메인을 다시 확인해주세요.");
		moveScroll($("#m_email_domain"));
		
		return false;
	}
	
	// 휴대전화번호(두 번째) 체크
	var inputPhoneSecond = $("#phone_2").val();
	var confirmPhoneSecond = checkPhone($("#phone_2"));
	
	if ( inputPhoneSecond == "" ) {
		
		alert("휴대전화 번호를 입력해주세요.");
		$("#phone_2").focus();
		
		return false;
	} else if ( inputPhoneSecond.length <= 2 ) {
		
		alert("휴대전화번호가 짧습니다.");
		moveScroll($("#phone_2"));
		
		return false;
	}
	
	if ( !confirmPhoneSecond ) {
		
		alert("휴대전화 번호를 다시 확인해주세요.");
		moveScroll($("#phone_2"));
		
		return false;
	}
	
	// 휴대전화번호(세 번째) 체크
	var inputPhoneThird = $("#phone_3").val();
	var confirmPhoneThird = checkPhone($("#phone_3"));
	
	if ( inputPhoneThird == "" ) {
		
		alert("휴대전화 번호를 입력해주세요.");
		$("#phone_3").focus();
		
		return false;
	} else if ( inputPhoneThird.length <= 3 ) {
		
		alert("휴대전화번호가 짧습니다.");
		moveScroll($("#phone_3"));
		
		return false;
	}
	
	if ( !confirmPhoneThird ) {
		
		alert("휴대전화 번호를 다시 확인해주세요.");
		moveScroll($("#phone_3"));
		
		return false;
	}
	
	return true;
}


//////////////////////////////

		// [보조 함수] //

//////////////////////////////


//////////CJ ONE 마케팅 정보 수신동의 - 모두 동의 //////////

function allCheck() {
	
	var chk = $("#chkbox_all").is(":checked");
	
	if ( chk ) {
		$("input:checkbox[name='receive_agree']").attr("checked", true);
	} else {
		$("input:checkbox[name='receive_agree']").attr("checked", false);
	}
}


////////// 잘못 입력된 위치로 이동 //////////

function moveScroll(tag) {
	
	tag.focus();
	var inputPos = tag.offset().top;
	window.scrollTo(0, inputPos);
//	$("html, body").animate({ scrollTop : inputPos });
	
}


////////// 유효 값 검사 //////////

function isSpace(inputVal, idx) {
	
	if ( inputVal.charCodeAt(idx) == 32 ) {
		return true;
	}
	
	return;
}

function isNum(inputVal, idx) {
	
	if ( inputVal.charCodeAt(idx) >= 48 && inputVal.charCodeAt(idx) <= 57 ) {
		return true;
	}
	
	return;
}
