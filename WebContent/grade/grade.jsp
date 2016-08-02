<%@page import="java.util.List"%>
<%@page import="movie.movieDTO"%>
<%@page import="movie.movieDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="movie.movieDAO" %>
	<%request.setCharacterEncoding("UTF-8"); %>
	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/swfobject/2.2/swfobject.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>


<style type="text/css">

div{
	width: 850px;
	height: 400px
	padding-left: 30px;
	padding-right: 30px;
}
td {
	height : 100px;
	text-align: center;
	background-color: #ffffff;
margin: 20px;

}
</style>

<%

movieDAO dao = movieDAO.getInstance();


List<movieDTO> list = dao.MovieList();
int count =list.size();


int num;
if(request.getParameter("num")== null){

	 num = 0;
	
}else{
	 num = Integer.parseInt(request.getParameter("num"));
	
}

%>
<script type="text/javascript">
function pre(num) {
	num = num-4;
	location.href="grade.jsp?num="+num;
}

function next(num) {
	num = num+4;
	
	location.href="grade.jsp?num="+num;
}
function clickimg(seq,name,num) {
	alert(seq);
	alert(name);
	location.href="grade.jsp?mv_seq="+seq+"&name="+name+"&num="+num;
	
}

</script>
</head>
<body>
<%!
	public String two(String msg){
	String str = "";
	
	if(msg.length()>12){
		str = msg.substring(0, 12)+"...";
	}else{
		str = msg;
	}
	
	return str;
	
	}

%>


평점
<div id = "grade" style="background-color: #555555" >
<table>
<col width="20"><col width="150"><col width="150"><col width="150"><col width="150"><col width="20">
<tr>
<td><button onclick="javascript:pre(<%=num %>)">이전</button></td>
<%




/* 
String sseq = request.getParameter("mv_seq");
int seq = Integer.parseInt(sseq); */
int seq;

if(request.getParameter("mv_seq")==null){
	seq = 1;
}else{
	String sseq = request.getParameter("mv_seq");
	seq = Integer.parseInt(sseq);
}

String mov_name;
if(request.getParameter("name")==null){
	mov_name = "부산행";
}else{
	 mov_name = request.getParameter("name");
}

System.out.println(seq);
int pg = 1;

if(request.getParameter("pg")!=null) {
	pg = Integer.parseInt(request.getParameter("pg"));
}




System.out.println(list.size());
if(num<0){
	num = 0;
	System.out.println("num<0"+num);
}

if(num > (count-4)){
	num = count-4;
System.out.println("num>count"+num);

}



for(int i = num; i<num+4;i++){ 

	
	
%>


<td><input type="image" src="<%=list.get(i).getPoster()%>" onclick="javascript:clickimg(<%=list.get(i).getSeq()%>,'<%=list.get(i).getName()%>',<%=num%>)"><br><b style="text-align: left;"><%=two(list.get(i).getName())%></b><br><%=list.get(i).getStart_time() %>

<br>
	<input type="image" class="img" style="margin-left: 20px;" src="../image/btn_movie_like_off.png" onclick="location.href='../movie/likeclick.jsp?seq=<%=list.get(i).getSeq()%>&WHERE=../grade/grade.jsp?num=<%=num %>'">
		<%=list.get(i).getHeart() %>
			<input type="image" src="../image/btn_movie_tiketing.png" onclick="location.href='tiket.jsp'">
			
</td>

<%} %>
<td><button onclick="javascript:next(<%=num %>)">다음</button></td>
</tr>
</table> 
</div>
<input type="button" value="평점 작성" onclick="location.href='../movie/gradewriteAf.jsp?seq=<%=seq %>&id=id&title=<%=mov_name%>'">
<jsp:include page="../grade/maincomment.jsp">
<jsp:param name="mv_seq" value="<%=seq %>" />
</jsp:include>
</body>
</html>