<%@page import="EVENT_BOARD.Event_Board_Dto"%>
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
String id = request.getParameter("id");
String category = request.getParameter("category");
String title = request.getParameter("title");
String content = request.getParameter("content");
String filename = request.getParameter("filename");

Event_Board_Dao dao=Event_Board_Dao.getInstance();
boolean isS=dao.Event_update(seq, new Event_Board_Dto(id, category, title, content, filename));
%>

<%if(filename!=null) {%>
	<%if(isS) {%>
	<script type="text/javascript">
		alert("수정완료");
		location.href="Board_Event_list.jsp";
	</script>
	<%}else{ %>
	<script type="text/javascript">
		alert("수정실패");
		location.href="Board_Event_list.jsp";
	</script>
	<%} %>
<%}else{%>
<script type="text/javascript">
alert("파일을 넣고 업로드해주세요.");
location.href="Board_Event_list.jsp";
</script>
<%}%>
</body>
</html>