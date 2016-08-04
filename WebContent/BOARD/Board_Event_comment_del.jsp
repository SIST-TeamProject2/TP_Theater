<%@page import="BOARD_COMMENT.Board_Comment_Dao"%>
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
	
	String c_sseq = request.getParameter("c_seq"); 
	int c_seq = Integer.parseInt(c_sseq);
	Board_Comment_Dao dao = Board_Comment_Dao.getInstance();
	dao.Comment_del(c_seq);
	%>
	<script type="text/javascript">
	alert("삭제완료");
	location.href = "Board_Event_detail.jsp?seq=<%=seq%>";
	</script>
	
</body>
</html>