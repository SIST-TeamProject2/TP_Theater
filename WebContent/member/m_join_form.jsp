<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import = "java.util.Calendar" %>

<%@ page import = "member.memberDTO" %>

<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>

<!-- JavaScript -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script type="text/javascript" src="../js/m_join_form.js"></script>

<!-- CSS -->
<link rel="stylesheet" href="../css/m_join.css">
<link rel="stylesheet" href="../css/footer.css">

</head>
<body>

<script type="text/javascript">

$(function(){
	// ID 중복체크 후 돌아왔을 경우 이전 수직 스크롤 위치로 이동
	var scrollPos = ${ param.scrollPos };
	var resultCheckId = ${ param.result };
		
	if ( resultCheckId != null ) {
    	window.scrollTo(0, scrollPos);
	}
});

</script>

<!-- 최종 확인을 위한 입력 값 저장 -->
<jsp:useBean id="member" class="member.memberDTO"/>

<div class="header">
	<jsp:include page="m_join_header.jsp"/>
</div>

<div class="header_2">
	<div class="step">
		<img src="../image/tap_join_01_off.jpg"/>
		<img src="../image/tap_join_02_off.jpg"/>
		<img src="../image/tap_join_03_on.jpg"/>
		<img src="../image/tap_join_04_off.jpg"/>
	</div>
</div>

<div class="section">
	<form name="frm_join_input" action="" method="post">
	
	<div class="summary">
		<h1>CJ 회원가입을 위해 아래 회원정보를 입력해 주세요.</h1>
		<br/>
		<p>CJ 회원가입 후에도 각 제휴 브랜드 웹사이트에서 통합 아이디를 사용하여 로그인 하시려면,</p>
		      각 브랜드 웹사이트의 이용약관에 대한 동의를 거친 후에 이용 가능합니다.
	</div>
	<br/><br/>
	<div class="input_frm">
		<img src="../image/text_join_title.gif"/>
		<br/>
		
		<table class="tbl_frm">
		<col width="150px"/><col width="850px"/>
		<tr>
			<td class="input_type">· 아이디</td>
			<td class="input_val">
				<input type="text" id="id" name="id" value="${ param.id }" size="20" maxlength="12"/>
				<input type="button" class="btn_chk_id" value="중복확인" onclick="return checkId()"/>
				<c:choose>
					<c:when test="${ param.result == true }">
						<img src="../image/icon_mark_x.png"/>
						<font color="red"><b>이미 존재하는 아이디입니다.</b></font>
						<c:set var="okId" value="false"/>
					</c:when>
					<c:when test="${ param.result == false }">
						<img src="../image/icon_mark_check.png"/>
						<font color="blue"><b>사용 가능한 아이디입니다.</b></font>
						<c:set var="okId" value="true"/>
					</c:when>
				</c:choose>
				<br/>
				<p>- 영문자, 숫자 조합하여 6~12자리이어야 합니다.</p>
				<p>- 이미 사용중인 아이디이거나, 다른 회원님과 중복된 아이디는 CJ 아이디로 사용하실수 없습니다.</p>
				<p>- CGV, CJmall, Mnet 등 기존의 CJ 제휴 브랜드 회원님의 경우는 기존에 사용하고 계신 아이디가 새롭게 생성하신</p>
				&nbsp;&nbsp;통합 아이디로 변경됩니다.
			</td>
		</tr>
		<tr>
			<td class="input_type">· 비밀번호</td>
			<td class="input_val">
				<input type="password" id="pw" name="pw" size="21" maxlength="12" onkeydown="return checkPw()"/>
				<span id="result_pw" class="result_pw"></span>
				<p>- 영문자, 숫자, 특수문자 모두 최소 1가지 이상 조합하여 8~12자리이어야 합니다.</p>
				<p>- 아이디와 4자리 이상 동일하거나, 4자리 이상 반복되는 문자와 숫자는 사용이 불가합니다.</p>
				<p>- 사용 가능 특수 문자 : ! " # $ % &amp; ' ( ) * + , - . / : ; &lt; = &gt; ? @ [ ] ^ _ ` { | } ~</p>
				<p>- 공백 불가</p>
			</td>
		</tr>
		<tr>
			<td class="input_type">· 비밀번호 확인</td>
			<td class="input_val">
				<input type="password" id="pw_confirm" size="21" maxlength="12" onblur="return checkPwConfirm()"/>
				<span id="result_pw_confirm" class="result_pw_confirm"></span>
			</td>
		</tr>
		<tr>
			<td class="input_type">· 이름</td>
			<td class="input_val">
				<input type="text" size="20" maxlength="40"/>
			</td>
		</tr>
		<tr>
			<td class="input_type">· 생년월일</td>
			<td class="input_val">
				<% Calendar cal = Calendar.getInstance(); %>
				<c:set var="year" value="<%= cal.get(Calendar.YEAR) %>"/>
				
				<select id="birth_year">
					<!-- 1900년생 ~ 2002년생(만 14세) -->
					<c:forEach var="i" begin="0" end="${ year - 1900 - 14 }">
						<option label="${ (year-14) - i }" value="${ (year-14) - i }"/>
					</c:forEach>
				</select>
				
				년&nbsp;&nbsp;&nbsp;&nbsp;
				
				<select id="birth_month">
					<c:forEach var="i" begin="1" end="12">
						<option label="${ i }" value="${ i }"/>
					</c:forEach>
				</select>
				
				월&nbsp;&nbsp;&nbsp;&nbsp;
				
				<select id="birth_day"></select>
				일
				<p>- 설정하신 생일을 기준으로 15일 전 생일쿠폰이 발급됩니다.</p>
			</td>
		</tr>
		<tr>
			<td class="input_type"><p>· CJ ONE</p><p>마케팅 정보</p><p>수신동의</p>
			<td class="input_val">
				<input type="checkbox" id="chkbox_all" value="모두동의" onclick="return allCheck(this)"/>모두 동의
				
				<table class="tbl_check">
				<col width="200px"/><col width="100px"/><col width="100px"/><col width="100px"/>
				<tr>
					<th></th><th>E-mail</th><th>SMS</th><th>전화</th>
				</tr>
				<tr>
					<td>CJ ONE</td>
					<td><input type="checkbox" id="chkbox_email" name="marketing_agree" /></td>
					<td><input type="checkbox" id="chkbox_sms" name="marketing_agree"/></td>
					<td><input type="checkbox" id="chkbox_phone" name="marketing_agree"/></td>
				<tr/>
				</table>
				
				<p>- CJ ONE 회원님께 드리는 포인트/이벤트/문화공연/상품 등의 정보 수신에 동의해주세요.</p>
				<p>- CJ ONE 개인정보 수집 및 활용 동의 (선택)에 거부한 회원님은 CJ ONE 마케팅 정보 수신을 받으실 수 없습니다.</p>
			</td>
		</tr>
		<tr>
			<td class="input_type">· E-MAIL 주소</td>
			<td class="input_val">
				<input type="text" id="email" size="20" maxlength="64"/>
				@
				<select>
					<option label="직접입력" value="" selected="selected" onclick="inputEmail(this)"/>
					<option label="네이버" value="naver.com" onclick="inputEmail(this)"/>
					<option label="한메일" value="daum.net" onclick="inputEmail(this)"/>
					<option label="네이트" value="nate.com" onclick="inputEmail(this)"/>
					<option label="지메일" value="gmail.com" onclick="inputEmail(this)"/>
				</select>
				<input type="text" id="email_domain" name="email_domain" size="20"/>
				<span id="result_email" class="result_email"></span>
				<br/>
				<p>- E-MAIL 주소 입력 시 사용 가능 특수 문자:-._</p>
			</td>
		</tr>
		<tr>
			<td class="input_type">· 휴대전화번호</td>
			<td class="input_val">
				<select name="phone_1">
					<option label="010" value="010" selected="selected"/>
					<option label="011" value="011"/>
					<option label="016" value="016"/>
					<option label="017" value="017"/>
					<option label="018" value="018"/>
					<option label="019" value="019"/>
					<option label="070" value="070"/>
					<option label="0130" value="0130"/>
					<option label="0303" value="0303"/>
					<option label="0502" value="0502"/>
					<option label="0504" value="0504"/>
					<option label="0505" value="0505"/>
					<option label="0506" value="0506"/>
				</select>
				-
				<input type="text" id="phone_2" name="phone_2" size="10" maxlength="4" onkeyup="checkNum(this)"/>
				-
				<input type="text" id="phone_3" name="phone_3" size="10" maxlength="4" onkeyup="checkNum(this)"/>
				<span id="result_phone" class="result_phone"></span>
				<p>- 주문 및 배송, 쿠폰, 이벤트 정보 등을 제공 받으실 수 있습니다.</p>
			</td>
		</tr>
		</table>
		
	</div>
	<div class="area_btn">
		<br/><br/>
		<input type="image" name="cancel" src="../image/btn_join_cancel.gif"/>
		<input type="image" name="submit" src="../image/btn_join_confirm.png"/>
	</div>
	</form>
</div>

<div class="footer">
	<jsp:include page="../include/footer.jsp"/>
</div>

</body>
</html>