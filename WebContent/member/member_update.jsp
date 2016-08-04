<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import = "member.memberDAO" %>
<%@ page import = "member.memberDTO" %>

<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디 중복 확인</title>
</head>
<body>

<%!
private String addMonthZero(String month) {
	
	if ( month.length() == 1 ) {
		month = "0" + month;
	}
	
	return month;
}
%>

<%
request.setCharacterEncoding("UTF-8");

// 아이디, 비밀번호, 이름
String inputId = request.getParameter("m_id");
String inputPw = request.getParameter("m_pw");
String inputName = request.getParameter("m_name");

// 생일
String inputBirthYear = request.getParameter("birth_year");
String inputBirthMonth = request.getParameter("birth_month");
String inputBirthDay = request.getParameter("birth_day");
String birthDay = inputBirthYear + addMonthZero(inputBirthMonth) + addMonthZero(inputBirthDay);

// 마케팅 정보 수신
String[] receive = request.getParameterValues("receive_agree");
int receiveEmail = 0, receiveSMS = 0, receivePhone = 0;

if (  receive != null ) {
	for ( int i = 0; i < receive.length; i++ ) {
		if ( receive[i].equals("on") )		receiveEmail = 1;
		if ( receive[i].equals("on") )	receiveSMS = 1;
		if ( receive[i].equals("on") )	receivePhone = 1;
	}
}

// 이메일
String inputEmail = request.getParameter("m_email");
String inputEmailDomain = request.getParameter("m_email_domain");
String email = inputEmail + "@" + inputEmailDomain;

// 휴대전화번호
String inputPhoneFirst = request.getParameter("phone_1");
String inputPhoneSecond = request.getParameter("phone_2");
String inputPhoneThird = request.getParameter("phone_3");
String phone = inputPhoneFirst + "-" + inputPhoneSecond + "-" + inputPhoneThird;

boolean resultUpdateMember = memberDAO.INSTANCE.updateMember(new memberDTO(inputId, inputPw, inputName, birthDay, 
																		receiveEmail, receiveSMS, receivePhone, email, phone));
%>

<%
if ( resultUpdateMember ) {
	
	// 로그인 정보 갱신
	memberDTO mdto = memberDAO.INSTANCE.selectMember(inputId);
	session.removeAttribute("loginMember");
	session.setAttribute("loginMember", mdto);
	
%>
	<script type="text/javascript">
		alert("회원정보가 수정되었습니다.");
		location.href = "mypage_info.jsp";
	</script>
<%	
} else {
%>
	<script type="text/javascript">
		alert("회원정보 수정이 정상적으로 이뤄지지 않았습니다. 잠시 후 다시 시도해주세요.");
		location.href = "mypage_update_info.jsp";
	</script>
<%
}
%>

</body>
</html>