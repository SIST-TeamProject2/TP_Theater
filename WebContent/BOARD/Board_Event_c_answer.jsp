<%@page import="BOARD_COMMENT.Board_Comment_Dto"%>
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
<jsp:include page="../member/login_stat_check.jsp"/>

<%request.setCharacterEncoding("UTF-8"); %>
<jsp:include page="../member/login_stat_check.jsp"/>

<%
String sseq = request.getParameter("e_seq");
int eb_seq = Integer.parseInt(sseq.trim());
String c_sseq = request.getParameter("c_seq");
int c_seq = Integer.parseInt(c_sseq);

String id = request.getParameter("c_id");
String content = request.getParameter("c_content").replaceAll("\r\n", "<br/>");


if(content.equals("")){%>
<script type="text/javascript">
	alert("내용을 입력해주세요.")
	location.href = "Board_Event_detail.jsp?seq=<%=eb_seq%>"
</script>
<%}else{
Board_Comment_Dao dao=Board_Comment_Dao.getInstance();
boolean isS= dao.Comment_answer(c_seq, id, new Board_Comment_Dto(id,content), eb_seq);
	if(isS){%>
	<script>
		alert("답글 입력 성공!!");
	</script>
	<% pageContext.forward("Board_Event_detail.jsp?seq="+eb_seq); %>
	<%
	}else{
	%>	
	
	<script type="text/javascript">
	alert("답글 입력 실패!!");
	</script>
	<% pageContext.forward("Board_Event_detail.jsp?seq="+eb_seq); %>
	<%} %>
<%} %>



</body>
</html>