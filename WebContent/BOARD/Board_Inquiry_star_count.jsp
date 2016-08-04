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
<%request.setCharacterEncoding("utf-8"); %>
<%
String sseq = request.getParameter("seq");
String sstar_count = request.getParameter("star_count"); 
String id = request.getParameter("id");
int seq = Integer.parseInt(sseq);
int star_count = Integer.parseInt(sstar_count);

Inquiry_Board_Dao dao = Inquiry_Board_Dao.getInstance();
dao.Inquiry_starcount(seq, star_count);
%>

 
<%pageContext.forward("Board_Inquiry_list.jsp?id="+id);%>

</body>
</html>