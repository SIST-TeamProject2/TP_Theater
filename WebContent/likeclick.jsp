<%@page import="movie.movieDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String sseq = request.getParameter("seq");
int seq = Integer.parseInt(sseq);

movieDAO dao = movieDAO.getInstance();
boolean isS = dao.likecount(seq);

if(isS){
%><script type="text/javascript">
location.href="movie.jsp";
</script>
<%}else{ %>
<script type="text/javascript">
alert("추천하지 못하였습니다.");
location.href="movie.jsp";
</script>
<%} %>
</body>
</html>