<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>reservation2_af</title>
<%!
String a ="";
%>
<%
String grade = request.getParameter("grade");
%>
</head>
<body>

<%
a=request.getParameter("grade");

%>

<table>
<tr>

<%
if(request.getParameter("grade").equals("")){
	
}
else {
if(a.equals("15")||a.equals("12")){
	%>
	<td>
	<%=a%>세 이상 관람가<br>
	본 영화는 <br><%=a%>세 미만 고객이라도 <br>보호자 동반 관람시 관람이 가능합니다.<br>
	
	* 아동 고객 동반 시<br> 타 고객의 영화관람에 불편함을 주지 않도록 <br>관람 에티켓을 꼭 지키세요!<br>
	</td>
<%
}else if(a.equals("청불")){
%>
	<td>
	본 영화는<br>청소년 관람 불가 영화입니다.<br>
	입장 시 나이 확인합니다.<br>
	</td>
<%} else if(a.equals("전체")){%>
	<td>
	본 영화는<br>전체관람가 영화입니다.<br>
	즐거운 시간 되세요.<br>
	</td>
<%} else{%>
	<td>
	재미있게 보세요.
	</td>
<%}}%>
</tr>
</table>
<input type="button" value="확인" onclick="window.close()"/>
</body>
</html>