<%@page import="java.util.List"%>
<%@page import="movie.movieDTO"%>
<%@page import="movie.movieDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="movie.movieDAO"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/swfobject/2.2/swfobject.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<style type="text/css">
.poster {
	margin: 10px;
	padding: 10px;
}

div#popular-trailer {
	background-color: black;
	width: 900px;
	height: 500px;
	padding-top: 20px;
	padding-bottom: 20px;
	padding-left: 20px;
}

h5 {
	margin-top: 0px;
	margin-bottom: 1px;
	text-align: right;
}

input.img {
	margin: 5px;
}

input.rank-trailer {
	width: 120px;
	height: 150px;
	margin: 3px;
}

td#trailer {
	font-size: 15px;
	color: #ffffff;
	text-decoration: none;
}

iframe#s_video {
	margin-top: 5px;
	margin-bottom: 5px;
	padding: 5px;
}
</style>

<!-- CSS -->
<link rel="stylesheet" href="../css/movie.css">

</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
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

	});
</script>


<body>

	<jsp:include page="../include/header.jsp" />
	<jsp:include page="../include/nav.jsp" />

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
		<%
			}
		%>

		<%
			String strFinderHide2 = request.getParameter("hide2");

			if (strFinderHide2 == null) {
		%>

		<h2>무비차트</h2>
		<!-- 	<h5>
		<button id="mv_chart">무비차트</button>
		<button id="mv_pre">상영 예정작</button>
	</h5> -->
		<hr>



		<!-- 	<form action="moviedetail.jsp" method="get"> -->
		<table style="border-collapse: collapse;">
			<tr>
				<%
					for (int i = 1; i <= count; i++) {
				%>

				<td align="center"><h2 align="center" style="margin-bottom: 0px;">
						NO.<%=i%></h2> 
						<input type="image" class="poster"	style="margin-bottom: 0px; margin-top: 1px;"
					src="<%=list.get(i - 1).getPoster()%>"
					onclick="location.href='../movie/moviedetail.jsp?seq=<%=list.get(i - 1).getSeq()%>'"><br>
					
					<h6 align="left" style="margin-left: 20px; margin-top: 1px; margin-bottom: 0px;">
					예매율<br>개봉 : <%=list.get(i - 1).getStart_time()%></h6> 
					
					<input type="image" class="img" style="margin-left: 20px;"	src="../image/btn_movie_like_off.png"
					onclick="location.href='../movie/likeclick.jsp?seq=<%=list.get(i - 1).getSeq()%>&WHERE=../movie/movie.jsp?count=<%=count%>'">
					<%=list.get(i - 1).getHeart()%> 
					<input type="image" class="img"	src="../image/btn_movie_tiketing.png" onclick="location.href='tiket.jsp'"></td>
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
		<!-- 	</form> -->
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
			<font color="#ffffff" style="font-weight: bolder;">인기 트레일러</font><br>
			<br>
			<table style="color: #ffffff">
				<col width="130">
				<col width="420">
				<col width="250">
				<tr>
					<td colspan="2"><iframe style="border: 0px;" width="500"
							height="300" src="<%=list.get(0).getVideo()%>">크롬으로
							접속부탁드립니다.</iframe></td>
					<td rowspan="2" valign="top"><iframe class="s_video"
							style="border: 0px;" width="180" height="100"
							src="<%=list.get(1).getVideo()%>">크롬으로 접속부탁드립니다.</iframe> <br>
						<iframe class="s_video" style="border: 0px;" width="180"
							height="100" src="<%=list.get(2).getVideo()%>">크롬으로
							접속부탁드립니다.</iframe> <br> <iframe class="s_video" style="border: 0px;"
							width="180" height="100" src="<%=list.get(3).getVideo()%>">크롬으로
							접속부탁드립니다.</iframe></td>

				</tr>

				<tr>
					<td><input type="image" class="rank-trailer"
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