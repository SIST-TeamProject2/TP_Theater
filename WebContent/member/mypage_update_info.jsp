<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import = "java.util.Calendar" %>

<%@ page import = "member.memberDTO" %>

<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이페이지 수정</title>

<!-- JavaScript -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script type="text/javascript" src="../js/member.js"></script>

<!-- CSS -->
<link rel="stylesheet" href="../css/mypage.css">

</head>

<body>

<jsp:include page="login_stat_check.jsp"/>

<jsp:include page="../include/header.jsp"/>
<jsp:include page="../include/nav.jsp"/>
<jsp:include page="mypage_aside.jsp"/>

<c:set var="member" value="${ sessionScope.loginMember }"/>

<div class="section_member_update">

	<form name="frm_member_update_input" action="member_update.jsp" method="post">
	
	<div class="summary">
		<h1>회원정보 수정을 위해 아래 회원정보를 입력해 주세요.</h1>
		<br/>
	</div>
	<br/><br/>
	<div class="input_frm">
		<img src="../image/text_member_info_update.png"/>
		<br/>
		
		<table class="tbl_frm">
		<col width="150px"/><col width="850px"/>
		<tr>
			<td class="input_type">· 아이디</td>
			<td class="input_val">
				<input type="text" id="m_id" name="m_id" value="${ member.id }" size="20" readonly="readonly"/>
				<br/>
			</td>
		</tr>
		<tr>
			<td class="input_type">· 비밀번호</td>
			<td class="input_val">
				<input type="password" id="m_pw" name="m_pw" value="${ member.pw }" size="21" maxlength="12" onkeyup="checkPw()"/>
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
				<input type="password" id="m_pw_confirm" value="${ member.pw }" size="21" maxlength="12" onkeyup="checkPwConfirm()"/>
				<span id="result_pw_confirm" class="result_pw_confirm"></span>
			</td>
		</tr>
		<tr>
			<td class="input_type">· 이름</td>
			<td class="input_val">
				<input type="text" id="m_name" name="m_name" value="${ member.name }" size="20" maxlength="40" onblur="checkName()"/>
				<span id="result_name" class="result_name"></span>
			</td>
		</tr>
		<tr>
			<td class="input_type">· 생년월일</td>
			<td class="input_val">
				<!-- 유저의 생년월일(연도)을 자동으로 선택 -->
				<c:set var="member_year" value="${ member.birthday.substring(0, 4) }"/>
				
				<% Calendar cal = Calendar.getInstance(); %>
				<c:set var="year" value="<%= cal.get(Calendar.YEAR) %>"/>
				
				<select id="birth_year" name="birth_year">
					<!-- 1900년생 ~ 2002년생(만 14세) -->
					<c:forEach var="i" begin="0" end="${ year - 1900 - 14 }">
						<option label="${ (year-14) - i }" value="${ (year-14) - i }" <c:if test="${ ((year-14) - i) == member_year }">selected="selected"</c:if>/>
					</c:forEach>
				</select>
				
				년&nbsp;&nbsp;&nbsp;&nbsp;
				
				<!-- 유저의 생년월일(월)을 자동으로 선택 -->
				<c:set var="isZero" value="${ member.birthday.substring(4, 5) == 0 ? true : false }"/>
				
				<c:choose>
					<c:when test="${ isZero }">
						<c:set var="member_month" value="${ member.birthday.substring(5, 6) }"/>
					</c:when>
					<c:otherwise>
						<c:set var="member_month" value="${ member.birthday.substring(4, 6) }"/>
					</c:otherwise>
				</c:choose>
				
				<select id="birth_month" name="birth_month">
					<c:forEach var="i" begin="1" end="12">
						<option label="${ i }" value="${ i }" <c:if test="${ i == member_month }">selected="selected"</c:if>/>
					</c:forEach>
				</select>
				
				월&nbsp;&nbsp;&nbsp;&nbsp;
				
				<!-- 유저의 생년월일(일)을 자동으로 선택 -->
				<c:set var="dayPos" value="${ member.birthday.length()-2 }"/>
				<c:set var="isZero" value="${ member.birthday.substring(dayPos, 7) == 0 ? true : false }"/>
				
				<c:choose>
					<c:when test="${ isZero }">
						<c:set var="member_day" value="${ member.birthday.substring(7, 8) }"/>
					</c:when>
					<c:otherwise>
						<c:set var="member_day" value="${ member.birthday.substring(6, 8) }"/>
					</c:otherwise>
				</c:choose>
				
				<select id="birth_day" name="birth_day"></select>
				<script type="text/javascript">
					createBirthDayList('${ member_day-1 }');	// 0번째부터 시작하기 때문에 -1처리
				</script>
				일
				<p>- 설정하신 생일을 기준으로 15일 전 생일쿠폰이 발급됩니다.</p>
			</td>
		</tr>
		<tr>
			<td class="input_type"><p>· 마케팅 정보</p><p>수신동의</p>
			<td class="input_val">
				<input type="checkbox" id="chkbox_all" value="모두동의" onclick="allCheck()"/>모두 동의
				
				<table class="tbl_check">
				<col width="200px"/><col width="100px"/><col width="100px"/><col width="100px"/>
				<tr>
					<th></th><th>E-mail</th><th>SMS</th><th>전화</th>
				</tr>
				<tr>
					<td>CJ ONE</td>
					<td>
						<input type="checkbox" id="chkbox_email" name="receive_agree" 
						<c:if test="${ member.receiveEmail == 1 }">checked="checked"</c:if>/>
					</td>
					<td>
						<input type="checkbox" id="chkbox_sms" name="receive_agree" 
						<c:if test="${ member.receiveSMS == 1 }">checked="checked"</c:if>/>
					</td>
					<td>
						<input type="checkbox" id="chkbox_phone" name="receive_agree" 
						<c:if test="${ member.receivePhone == 1 }">checked="checked"</c:if>/>
					</td>
				<tr/>
				</table>
				
				<p>- CJ ONE 회원님께 드리는 포인트/이벤트/문화공연/상품 등의 정보 수신에 동의해주세요.</p>
				<p>- CJ ONE 개인정보 수집 및 활용 동의 (선택)에 거부한 회원님은 CJ ONE 마케팅 정보 수신을 받으실 수 없습니다.</p>
			</td>
		</tr>
		<tr>
			<td class="input_type">· E-MAIL 주소</td>
			<td class="input_val">
				<input type="text" id="m_email" name="m_email" 
				value="${ member.email.substring(0, member.email.indexOf('@')) }" 
				size="20" maxlength="64" onblur="checkEmail()"/>
				@
				<select>
					<option label="직접입력" value="" selected="selected" onclick="inputEmailDomain(this)"/>
					<option label="네이버" value="naver.com" onclick="inputEmailDomain(this)"/>
					<option label="한메일" value="daum.net" onclick="inputEmailDomain(this)"/>
					<option label="네이트" value="nate.com" onclick="inputEmailDomain(this)"/>
					<option label="지메일" value="gmail.com" onclick="inputEmailDomain(this)"/>
				</select>
				<input type="text" id="m_email_domain" name="m_email_domain" 
				value="${ member.email.substring(member.email.indexOf('@')+1, member.email.length()) }" size="20"/>
				<span id="result_email" class="result_email"></span>
				<br/>
				<p>- E-MAIL 주소 입력 시 사용 가능 특수 문자:-._</p>
			</td>
		</tr>
		<tr>
			<td class="input_type">· 휴대전화번호</td>
			<td class="input_val">
				
				<c:set var="member_phone" value="${ fn:split(member.phone, '-') }"/>
				
				<select name="phone_1">
					<option label="010" value="010" <c:if test="${ member_phone[0] == '010' }">selected="selected"</c:if>/>
					<option label="011" value="011" <c:if test="${ member_phone[0] == '011' }">selected="selected"</c:if>/>
					<option label="016" value="016" <c:if test="${ member_phone[0] == '016' }">selected="selected"</c:if>/>
					<option label="017" value="017" <c:if test="${ member_phone[0] == '017' }">selected="selected"</c:if>/>
					<option label="018" value="018" <c:if test="${ member_phone[0] == '018' }">selected="selected"</c:if>/>
					<option label="019" value="019" <c:if test="${ member_phone[0] == '019' }">selected="selected"</c:if>/>
					<option label="070" value="070" <c:if test="${ member_phone[0] == '070' }">selected="selected"</c:if>/>
					<option label="0130" value="0130" <c:if test="${ member_phone[0] == '0130' }">selected="selected"</c:if>/>
					<option label="0303" value="0303" <c:if test="${ member_phone[0] == '0303' }">selected="selected"</c:if>/>
					<option label="0502" value="0502" <c:if test="${ member_phone[0] == '0502' }">selected="selected"</c:if>/>
					<option label="0504" value="0504" <c:if test="${ member_phone[0] == '0504' }">selected="selected"</c:if>/>
					<option label="0505" value="0505" <c:if test="${ member_phone[0] == '0505' }">selected="selected"</c:if>/>
					<option label="0506" value="0506" <c:if test="${ member_phone[0] == '0506' }">selected="selected"</c:if>/>
				</select>
				-
				<input type="text" id="phone_2" name="phone_2" value="${ member_phone[1] }" 
				size="10" maxlength="4" onkeyup="checkPhone($('#phone_2'))"/>
				-
				<input type="text" id="phone_3" name="phone_3" value="${ member_phone[2] }"
				size="10" maxlength="4" onkeyup="checkPhone($('#phone_3'))"/>
				<span id="result_phone" class="result_phone"></span>
				<p>- 주문 및 배송, 쿠폰, 이벤트 정보 등을 제공 받으실 수 있습니다.</p>
			</td>
		</tr>
		</table>
		
	</div>
	<div class="area_btn">
		<br/><br/>
		<a href="mypage_update_info.jsp"><img src="../image/btn_join_cancel.gif"/></a>
		<input type="image" name="submit" src="../image/btn_join_confirm.png" onclick="return checkMemberInfo('${ member }')"/>
	</div>
	</form>
</div>

<div class="footer">
	<jsp:include page="../include/footer.jsp"/>
</div>

</body>
</html>