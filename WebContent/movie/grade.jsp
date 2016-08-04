<%@page import="java.util.List"%>
<%@page import="movie.movieDTO"%>
<%@page import="movie.movieDAO"%>
<%@page import = "member.memberDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="movie.movieDAO"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/movie.css">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/swfobject/2.2/swfobject.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>


<%
	List<movieDTO> list = movieDAO.INSTANCE.MovieList();
	int count = list.size();

	int num;
	if (request.getParameter("num") == null) {

		num = 0;

	} else {
		num = Integer.parseInt(request.getParameter("num"));

	}
%>
<script type="text/javascript">
function pre(num,seq,name) {
	num = num-4;
	
	location.href="grade.jsp?num="+num+"&mv_seq="+seq+"&name="+name;
}

function next(num,seq,name) {
	num = num+4;

	location.href="grade.jsp?num="+num+"&mv_seq="+seq+"&name="+name;
}
function clickimg(seq,name,num) {
	
	location.href="grade.jsp?mv_seq="+seq+"&name="+name+"&num="+num;
	
}

</script>
<script type="text/javascript">
$(function() {
	$(".greadoffimg").click(function() {
		alert("로그인 후 이용가능합니다.");
	});
	
});
</script>

<!-- CSS -->
<link rel="stylesheet" href="../css/movie.css">


</head>
<body>
	<jsp:include page="../include/header.jsp" />
	<jsp:include page="../include/nav.jsp" />



	<%!public String two(String msg) {
		String str = "";

		if (msg.length() > 12) {
			str = msg.substring(0, 12) + "...";
		} else {
			str = msg;
		}

		return str;

	}%>
<%
String id ="";
boolean key = false;
if(session.getAttribute("loginMember")==null){
	
}else{
	key = true;
	memberDTO mdto = (memberDTO) session.getAttribute("loginMember");
	id = mdto.getId();
	
}

%>	
	<div class="section_grade">

		<H2>평점</H2>
		<div id="grade" style="background-color: #555555">
			<table>
				<col width="20">
				<col width="240">
				<col width="240">
				<col width="240">
				<col width="240">
				<col width="20">
				<tr>
			
					<%
						/* 
						String sseq = request.getParameter("mv_seq");
						int seq = Integer.parseInt(sseq); */
						int seq;

						if (request.getParameter("mv_seq") == null) {
							seq = 1;
						} else {
							String sseq = request.getParameter("mv_seq");
							seq = Integer.parseInt(sseq);
						}

						String mov_name;
						if (request.getParameter("name") == null) {
							mov_name = "부산행";
						} else {
							mov_name = request.getParameter("name");
						}

						//System.out.println(seq);
						int pg = 1;

						if (request.getParameter("pg") != null) {
							pg = Integer.parseInt(request.getParameter("pg"));
						}

						//System.out.println(list.size());
						if (num < 0) {
							num = 0;
							//System.out.println("num<0" + num);
						}

						if (num > (count - 4)) {
							num = count - 4;
							//System.out.println("num>count" + num);

						}
						%>
						
							<%
					int prenum =0;
					if(num-4 < 0){
						prenum = 0;
					}else{
						prenum = num-4;
					}
					%>
							<td><button onclick="javascript:pre(<%=num%>,'<%=list.get(prenum).getSeq()%>','<%=list.get(prenum).getName()%>')">이전</button></td>
					<%
						for (int i = num; i < num + 4; i++) {
					/* 	if(num == i){	 */
					%>
					<td>
						<input type="image" class="poster" src="<%=list.get(i).getPoster()%>" onclick="javascript:clickimg(<%=list.get(i).getSeq()%>,'<%=list.get(i).getName()%>',<%=num%>)"><br>
						<b style="text-align: left; padding-left: 20px;" ><%=two(list.get(i).getName())%></b>
						<br><font style="margin-top: 0px; padding-left: 20px;"><%=list.get(i).getStart_time()%></font>
						<br> 
						<%if(key){ %>
						<input type="image" class="greadlikeimg"   src="../image/btn_movie_like_on.png" onclick="location.href='../movie/likeclick.jsp?seq=<%=list.get(i).getSeq()%>&WHERE=../grade/grade.jsp?num=<%=num%>'">
						<%}else{ %>
						<input type="image" class="greadoffimg"	src="../image/btn_movie_like_off.png">
					<%} %>
						<%=list.get(i).getHeart()%>
						<input type="image" src="../image/btn_movie_tiketing.png"
						onclick="location.href='../reservation/reservation.jsp?movie=<%=list.get(i).getName()%>'">
					</td>
					<%
					/* 	} */
							}
					%>
					<td>
					<%
					int nextnum =0 ;
					
					if(num+4 >= list.size() || num+4 >list.size()-4){
						nextnum = list.size()-4;
					}else{
						nextnum = num+4;
					}
					%>
					<button onclick="javascript:next(<%=num%>,'<%=list.get(nextnum).getSeq()%>','<%=list.get(nextnum).getName()%>')">다음</button>
					</td>
				</tr>
			</table>
		</div>
		<br>
	

			<div align="center">
			<% if(key){ %>
				<jsp:include page="gradewrite.jsp">
				<jsp:param name="seq" value="<%=seq%>" />
				<jsp:param name="id" value="<%=id%>" />
				<jsp:param name="title" value="<%=mov_name%>" />
				<jsp:param name="pagekey" value="gradepage" />
				<jsp:param name="num" value="<%=num %>" />
				</jsp:include>
			<%}else{ %>
				<p align="center">로그인 후 작성 가능합니다.</p>
				<% } %>
			</div>
			
				<jsp:include page="maincomment.jsp">
				<jsp:param name="mv_seq" value="<%=seq%>" />
				</jsp:include>
				<jsp:include page="../include/footer.jsp" />
				<jsp:include page="../include/aside.jsp" />

</body>
</html>