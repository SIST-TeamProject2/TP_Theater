<%@page import="java.util.List"%>
<%@page import="movie.movieDTO"%>
<%@page import="movie.movieDAO"%>
<%@page import = "member.memberDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="movie.movieDAO"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>movie</title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/swfobject/2.2/swfobject.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet" href="../css/movie.css">
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
	$(function() {
		$("#mv_chart").click(function() {
			alert("mv_chart");
			location.href = "../movie/movie.jsp?bracket";
		});

		$("#mv_pre").click(function() {
			alert("mv_pre");
			location.href = "../movie/movie.jspbracket";
		});
		$(".offimg").click(function() {
			alert("로그인 후 이용가능합니다.");
		});
		
	});
</script>
<body>
	<jsp:include page="../include/header.jsp" />
	<jsp:include page="../include/nav.jsp" />
	
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
	
	
	
	<div class="section_movie_chart">
		<%!int count = 0;%>
		<%
			String m_count = request.getParameter("count");

			if (m_count == null) {
				count = 7;
			} else {
				int mv_count = Integer.parseInt(m_count);
				count = mv_count;
			}
			List<movieDTO> list = movieDAO.INSTANCE.MovieList();
		%>
		<%
			String strFinderHide = request.getParameter("hide");
			int finderHide = 1;

			if (strFinderHide != null) {
				finderHide = 0;
			}
			if (finderHide == 0) {
		%>
		<div id="area_Yongho" class="area_Yongho">
			<jsp:include page="../moviefinder/moviefind.jsp">
				<jsp:param value="7" name="count" />
			</jsp:include>
		</div>
		<% 	} %>
		<%
			String strFinderHide2 = request.getParameter("hide2");

			if (strFinderHide2 == null) {
		%>
		<h2 id="head">무비차트</h2>
		<hr>
		<table id="movie_chart" >
			<tr>
				<% for (int i = 1; i <= count; i++) { %>
				<td align="center">
				
				<h2 id="number" class="num<%=i%>">NO.<%=i%></h2> 
					
					<input type="image" class="poster" src="<%=list.get(i - 1).getPoster()%>" 
					onclick="location.href='../movie/moviedetail.jsp?seq=<%=list.get(i - 1).getSeq()%>'"><br>
					
					<h6 class="like">예매율<br>개봉 : <%=list.get(i - 1).getStart_time()%></h6> 
					<%if(key){ %>
					<input type="image" class="likeimg"	src="../image/btn_movie_like_on.png" onclick="location.href='../movie/likeclick.jsp?seq=<%=list.get(i - 1).getSeq()%>&WHERE=../movie/movie.jsp?count=<%=count%>'">
					<%}else{ %>
					<input type="image" class="offimg"	src="../image/btn_movie_like_off.png">
					<%} %>
					<%=list.get(i - 1).getHeart()%> 
					<input type="image" class="img"	src="../image/btn_movie_tiketing.png" onclick="location.href='../reservation/reservation.jsp?movie=<%=list.get(i - 1).getName()%>'"></td>
				<%
					if (i % 4 == 0) {
				%>
			</tr>
			<tr>
				<%
					}
						}
				%>
			</tr>
		</table>
		<hr>
		<%
			if (count < 8) {
		%>
		<input type="submit" id="mvplus" value="더보기"
			onclick="location.href='../movie/movieAf.jsp?count=<%=list.size()%>'" />
		<%
			}
		%>
		
		<div id="popular-trailer">
			<!-- <div> -->
			<font style="margin-left: 45px">인기 트레일러</font><br>
			<br>
			<table>
				<col width="230"><col width="420"><col width="250">
				<tr>
					<td colspan="2" align="center"><iframe id="mainiframe" src="<%=list.get(0).getVideo()%>">크롬으로 접속부탁드립니다.</iframe></td>
					<td rowspan="2" valign="top">
					<iframe class="s_video" src="<%=list.get(1).getVideo()%>">크롬으로 접속부탁드립니다.</iframe> <br>
					<iframe class="s_video" src="<%=list.get(2).getVideo()%>">크롬으로 접속부탁드립니다.</iframe> <br>
					<iframe class="s_video" src="<%=list.get(3).getVideo()%>">크롬으로 접속부탁드립니다.</iframe> </td>
				</tr>
				<tr>
					<td align="center" ><input type="image" style="margin-left: 45px;" class="rank-trailer" 
						src="<%=list.get(0).getPoster()%>"
						onclick="location.href='../movie/moviedetail.jsp?seq=<%=list.get(0).getSeq()%>'"></td>
					<td id="trailer"><a
						href="../movie/moviedetail.jsp?seq=<%=list.get(0).getSeq()%>"><%=list.get(0).getName()%></a><br><%=list.get(0).getGenre()%><br><%=list.get(0).getStart_time()%></td>
				</tr>
			</table>

		</div>
		<%
			}
		%>

	</div>

	<jsp:include page="../include/footer.jsp" />
	<jsp:include page="../include/aside.jsp" />

</body>
</html>