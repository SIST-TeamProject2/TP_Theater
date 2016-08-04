<%@page import="member.memberDTO"%>
<%@page import="BOARD_COMMENT.Board_Comment_Dao"%>
<%@page import="BOARD_COMMENT.Board_Comment_Dto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel = "stylesheet" href="../css/Board.css">

</head>
<body>
<jsp:include page="../include/header.jsp"/>
<jsp:include page="../include/nav.jsp"/>

<div class="section_event">

<%request.setCharacterEncoding("UTF-8"); %>
<jsp:include page="../member/login_stat_check.jsp"/>
<%memberDTO mdto = (memberDTO) session.getAttribute("loginMember");
	String id = "";
	if(mdto!=null){id=mdto.getId();}
	%>
<%
String sseq = request.getParameter("seq");
int seq = Integer.parseInt(sseq.trim());

String content = request.getParameter("content");
%>

<%
if(content.equals("")){%>
<script type="text/javascript">
	alert("내용을 입력해주세요.")
	location.href = "Board_Event_detail.jsp?seq=<%=seq%>"
</script>
<%}else{
	Board_Comment_Dao dao=Board_Comment_Dao.getInstance();
	boolean isS= dao.Event_comment(new Board_Comment_Dto(id,content), seq);
	if(isS){%>
	<% pageContext.forward("Board_Event_detail.jsp?seq="+seq); %>  
	<%
	}else{
	%>	
	<% pageContext.forward("Board_Event_detail.jsp?seq="+seq); %>  
	<%} %>
<%}%>
</div>

<jsp:include page="../include/footer.jsp"/>
<jsp:include page="../include/aside.jsp"/>
</body>
</html>