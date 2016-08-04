<%@page import="member.memberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" href="../css/Board.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js" ></script>
<script type="text/javascript">
$(function(){
	$('#cancel').click(function(){
		var id= $('#id').val();
		alert(id);
		location.href="Board_Inquiry_list.jsp?id="+id;
	});
});	
</script>
</head>
<body>
<jsp:include page="../include/header.jsp"/>
<jsp:include page="../include/nav.jsp"/>
<jsp:include page="../member/login_stat_check.jsp"/>
<div class="section_inquiry">
<%request.setCharacterEncoding("utf-8"); %>
	<jsp:include page="../member/login_stat_check.jsp"/>
	
	<%
	String id="";
	memberDTO mdto = (memberDTO) session.getAttribute("loginMember");
	if(mdto!=null){id = mdto.getId();} %>
	<table class="tlb_eve_write">
		<tr>
			<td>이름</td>
			<td colspan="3"></td>
		</tr>
		<tr>
			<td>휴대전화</td>
			<td></td>
			<td>이메일</td>
			<td></td>
		</tr>
		<tr>
		<td colspan="4"><br>※문의에 빠른 답변을 위해 회원가입시 입력하신 연락처를 확인해 주세요. <a><button>수정</button></a></td>
		</tr>
	</table>
	
	<form action="Board_Inquiry_writeAf.jsp">
	<input type="hidden" id="id" name="id" value="<%=id%>">
	<table>
		<tr>
			<td>제목</td>
			<td colspan="3"><input type="text" name="title" size="79"></td>
		</tr>
		<tr>
			<td>내용</td>
			<td colspan="3"><textarea rows="20" cols="60" name="content"></textarea> </td>
		</tr>
		<tr>
			<td align="right" colspan="4">
				<input type="submit" value="완료">
				<button type="button" onclick="cancel()" id="cancel">취소</button>
			</td>
		</tr>
	</table>
	</form>
	</div>
<jsp:include page="../include/footer.jsp"/>
<jsp:include page="../include/aside.jsp"/>
</body>
</html>