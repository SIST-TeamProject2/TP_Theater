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
<jsp:include page="../include/header.jsp"/>
<jsp:include page="../include/nav.jsp"/>
	<%request.setCharacterEncoding("utf-8"); %>
	<%
	String id = request.getParameter("id");
	String title = request.getParameter("title");
	String content = request.getParameter("content");

	Inquiry_Board_Dao dao = Inquiry_Board_Dao.getInstance();
	boolean isS = dao.writeI_board(new Inquiry_Board_Dto(id, title, content));
	
	%>
	<%if(isS){ %>
		<script type="text/javascript">
			alert("문의 완료");
		</script>
		<%pageContext.forward("Board_Inquiry_list.jsp?id="+id);%>
	<%}else{ %>
		<script type="text/javascript">
			alert("문의 실패");
			location.href = "Board_Inquiry_list.jsp?id="<%=id%>;
		</script>
	<%} %>
</body>
</html>