<%@page import="org.apache.coyote.RequestGroupInfo"%>
<%@page import="movie.movieDTO"%>
<%@page import="movie.movieDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src ="http://ajax.googleapis.com/ajax/libs/swfobject/2.2/swfobject.js"></script>
<style type="text/css">
hr {
	border: 1.5px solid #000000;
}

</style>
</head>
<body>
<%
String sseq = request.getParameter("seq");
int seq = Integer.parseInt(sseq);

String id = "temporarilyID-B";

movieDAO dao = movieDAO.getInstance();
movieDTO dto = dao.moviedetail(seq);


int pg = 1;

if(request.getParameter("pg")!=null) {
	pg = Integer.parseInt(request.getParameter("pg"));
}


%>
<h2>영화상세</h2>
<hr>

<table border="1">
<col width="15%"><col width="85%">
<tr>
<td rowspan="2"><img src="<%=dto.getPoster() %>"  alt="title"></td><td><%=dto.getName() %><br>예매율 : </td>
</tr>
<tr>
<td>감독 : <%=dto.getDiretor() %> /배우 : <%=dto.getActor() %><br>장르 :<%=dto.getGenre() %> /기본 :<%=dto.getGrade()%>세 이상,<%=dto.getRunning_time() %>분 <br>개봉 : <%=dto.getStart_time() %> </td>
</tr>
</table>
<div>
<%=dto.getStory() %>
</div>
<table border="1">
<col width="100%">
<tr><td>연령별 예매 분포</td></tr>
<tr><td>여기에는 그래프</td></tr>
<tr><td><input type="button" value="평점작성" onclick="location.href='gradewriteAf.jsp?seq=<%=seq%>&id=<%=id%>&title=<%=dto.getName() %>'"></td></tr>
</table>
<hr>
<jsp:include page="commentbbs.jsp">
<jsp:param name="mv_seq" value="<%=seq %>"/> 
<jsp:param name="pg" value="<%=pg %>"/> 

</jsp:include>
</body>
</html>