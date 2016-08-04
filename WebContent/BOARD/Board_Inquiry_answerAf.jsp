<%@page import="INQUIRY_BOARD.Inquiry_Board_Dto"%>
<%@page import="INQUIRY_BOARD.Inquiry_Board_Dao"%>
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
<%request.setCharacterEncoding("utf-8"); %>
<%
String sseq = request.getParameter("seq");
int seq = Integer.parseInt(sseq);
String id = request.getParameter("id");
String title = request.getParameter("title");
String content = request.getParameter("content");

if(title.equals("")){%>
	<script type="text/javascript">
	alert("제목을 입력해주세요.")
	location.href="Board_Inquiry_list.jsp?id=<%=id%>";
	</script>	
<%}else if(content.equals("")){%>
	<script type="text/javascript">
	alert("내용을 입력해주세요.")
	location.href="Board_Inquiry_list.jsp?id=<%=id%>";
	</script>	
<%}else{

	Inquiry_Board_Dao dao = Inquiry_Board_Dao.getInstance();
	boolean isS = dao.Inqurity_answer(seq, id, new Inquiry_Board_Dto("admin",title, content));
	if(isS){%>
		<%pageContext.forward("Board_Inquiry_list.jsp?id="+id);%>
	<%}else{%>
		<script type="text/javascript">
		alert("작성실패");
		</script>	
	<%}
	}%>
</body>
</html>