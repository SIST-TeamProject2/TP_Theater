
<%@page import="EVENT_BOARD.Event_Board_Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%request.setCharacterEncoding("utf-8"); %>
	<jsp:include page="../member/login_stat_check.jsp"/>
	<%
	String sseq = request.getParameter("seq"); 
	int seq = Integer.parseInt(sseq);
	
	Event_Board_Dao dao = Event_Board_Dao.getInstance();
	dao.Event_del(seq);
	%>
	<script type="text/javascript">
	alert("삭제완료");
	location.href = "Board_Event_list.jsp";
	</script>
	
	
</body>
</html>