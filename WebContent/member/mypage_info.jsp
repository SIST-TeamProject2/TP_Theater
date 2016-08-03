<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import = "member.memberDAO" %>

<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이페이지</title>

<!-- JavaScript -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script type="text/javascript" src="../js/mypage.js"></script>

<!-- CSS -->
<link rel="stylesheet" href="../css/mypage.css">
<link rel="stylesheet" href="../css/footer.css">

</head>

<body>

<jsp:include page="login_stat_check.jsp"/>

<jsp:include page="../include/header.jsp"/>
<jsp:include page="../include/nav.jsp"/>
<jsp:include page="mypage_aside.jsp"/>

<c:set var="loginMember" value="${ sessionScope.loginMember }"/>
<c:set var="member" value="${ memberDAO.INSTANCE.selectMember(loginMember.id) }"/>

<div class="section_mypage">

	<div class="summary">
		<h1>회원님의 소중한 정보를 안전하게 관리하세요.</h1>
	</div>
	<br/><br/>
	<div class="input_frm">
		<img src="../image/text_member_info.png"/>
		<br/>
		
		<table class="tbl_frm">
		<col width="150px"/><col width="850px"/>
		<tr>
			<td class="input_type">· 아이디</td>
			<td class="input_val">
				<input type="text" id="m_id" name="m_id" value="${ member.id }" size="20" readonly="readonly"/>
			</td>
		</tr>
		<tr>
			<td class="input_type">· 비밀번호</td>
			<td class="input_val">
				<input type="password" id="m_pw" name="m_pw" value="${ member.pw }" size="21" readonly="readonly"/>
			</td>
		</tr>
		<tr>
			<td class="input_type">· 비밀번호 확인</td>
			<td class="input_val">
				<input type="password" id="m_pw_confirm" value="${ member.pw }" size="21" readonly="readonly"/>
			</td>
		</tr>
		<tr>
			<td class="input_type">· 이름</td>
			<td class="input_val">
				<input type="text" id="m_name" name="m_name" value="${ member.name }" size="20" maxlength="40" readonly="readonly"/>
			</td>
		</tr>
		<tr>
			<td class="input_type">· 생년월일</td>
			<td class="input_val">
				${ member.birthday.substring(0, 4) }년 ${ member.birthday.substring(4, 6) }월 ${ member.birthday.substring(6, 8) }일
			</td>
		</tr>
		<tr>
			<td class="input_type"><p>· 마케팅 정보</p><p> 수신동의</p></td>
			<td class="input_val">
				<c:set var="receiveEmail" value="${ member.receiveEmail > 0 ? true : false }"/>
				<c:set var="receiveSMS" value="${ member.receiveSMS > 0 ? true : false }"/>
				<c:set var="receivePhone" value="${ member.receivePhone > 0 ? true : false }"/>
				
				E-mail 동의
				<c:choose>
					<c:when test="${ receiveEmail }">
						<input type="checkbox" checked="checked" onclick="return false"/> 
					</c:when>
					<c:when test="${ !receiveEmail }">
						<input type="checkbox" readonly="readonly"/> 
					</c:when>
				</c:choose>
				
				SMS 동의
				<c:choose>
					<c:when test="${ receiveSMS }">
						<input type="checkbox" checked="checked" onclick="return false"/> 
					</c:when>
					<c:when test="${ !receiveSMS }">
						<input type="checkbox" readonly="readonly"/> 
					</c:when>
				</c:choose>
				
				Phone 동의
				<c:choose>
					<c:when test="${ receivePhone }">
						<input type="checkbox" checked="checked" onclick="return false"/> 
					</c:when>
					<c:when test="${ !receivePhone }">
						<input type="checkbox" readonly="readonly"/> 
					</c:when>
				</c:choose>
				
			</td>
		</tr>
		<tr>
			<td class="input_type">· E-MAIL 주소</td>
			<td class="input_val">
				<input type="text" id="m_email" name="m_email" value="${ member.email }" size="20" readonly="readonly"/>
			</td>
		</tr>
		<tr>
			<td class="input_type">· 휴대전화번호</td>
			<td class="input_val">
				<input type="text" id="m_phone" name="m_phone" value="${ member.phone }" size="20" readonly="readonly"/>
			</td>
		</tr>
		<tr>
			<td class="input_type">· 등급</td>
			<td class="input_val">
				<c:choose>
					<c:when test="${ member.grade == 0 }">
						<c:set var="grade" value="일반"/>
					</c:when>
					<c:when test="${ member.grade == 1 }">
						<c:set var="grade" value="VIP"/>
					</c:when>
					<c:otherwise>
						<c:set var="grade" value="VVIP"/>
					</c:otherwise>
				</c:choose>
				${ grade }
			</td>
		</tr>
		<tr>
			<td class="input_type">· 포인트</td>
			<td class="input_val">
				${ member.point }점
			</td>
		</tr>
		</table>
		
	</div>
	<div class="area_btn">
		<br/><br/>
		
		<a href="" class="btn_member_delete" target="본인 확인"
		onclick="window.open('self_check_form.jsp', '본인 확인', 'width=300, height=300, left=600, top=300, menubar=no, status=no, toolbar=no, location=no, scrollbars=no, resizable=no, fullscreen=no'); return false;">
		<img src="../image/btn_member_delete.png"/></a>
		
		<a href="mypage_update_info.jsp" class="btn_member_update" >
		<img src="../image/btn_member_update.png"/></a>
		
	</div>
</div>

<jsp:include page="../include/footer.jsp"/>
<jsp:include page="../include/aside.jsp"/>

</body>
</html>