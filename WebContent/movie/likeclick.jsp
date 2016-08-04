<%@page import="movie.movieDAO"%>
<%@page import = "member.memberDTO" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

String sseq = request.getParameter("seq");
int seq = Integer.parseInt(sseq);

String where = request.getParameter("WHERE"); 


memberDTO mdto = (memberDTO) session.getAttribute("loginMember");
String id = mdto.getId();

boolean check =  movieDAO.INSTANCE.likefind(seq, id);

if(check){
%>
<script type="text/javascript">
alert("이미 좋아요 눌러쪙");
history.go(-1);
</script>
<%}else{
boolean isS = movieDAO.INSTANCE.likecount(seq,id);
if(isS){
%><script type="text/javascript">

location.href= '<%=request.getHeader("referer")%>';
<%-- location.href="<%= where %>"; --%>
</script>
<%}else{ %>
<script type="text/javascript">
alert("추천하지 못하였습니다.");
history.go(-1);
</script>
<%}
}%>

</body>
</html>