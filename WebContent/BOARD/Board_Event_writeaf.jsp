<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="EVENT_BOARD.Event_Board_Dao"%>
<%@page import="EVENT_BOARD.Event_Board_Dto"%>

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

String id = request.getParameter("id");
String category = request.getParameter("category");
String title = request.getParameter("title");
String content = request.getParameter("content").replace("\r\n", "<br/>");
String filename = request.getParameter("filename");

Event_Board_Dao dao=Event_Board_Dao.getInstance();

if(title.equals("")){%>
<script type="text/javascript">
alert("제목을 입력해주세요.")
location.href="Board_Event_write.jsp?id=<%=id%>&title=<%=title%>&content=<%=content%>";
</script>	
<%}else if(content.equals("")){%>
<script type="text/javascript">
alert("내용을 입력해주세요.")
location.href="Board_Event_write.jsp?id=<%=id%>&title=<%=title%>&content=<%=content%>";
</script>	
<%}else{ %>
	<%if(filename!=null) {
		boolean isS=dao.writeE_Board(new Event_Board_Dto(id, category, title, content, filename));%>
		<%if(isS) {%>
		<script type="text/javascript">
			alert("작성완료");
			location.href="Board_Event_list.jsp";
		</script>
		<%}else{ %>
		<script type="text/javascript">
			alert("실패");
			location.href="Board_Event_list.jsp";
		</script>
		<%} %>
	<%}else{%>
	<script type="text/javascript">
	alert("파일을 넣고 업로드해주세요.");
	location.href="Board_Event_write.jsp?id=<%=id%>&title=<%=title%>&content=<%=content%>";
	</script>
	<%}%>
<%} %>
</body>
</html>