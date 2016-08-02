<%@page import="java.util.List"%>
<%@page import="movie.movieDAO"%>
<%@page import="movie.movieDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String keyword_type = request.getParameter("keyword_type");
int type = Integer.parseInt(keyword_type); 

String keyword = request.getParameter("keyword");
String copy_keyword = request.getParameter("keyword");
String genre = request.getParameter("genre");

String grade = request.getParameter("grade");

if(type ==0){
	keyword_type ="MV_ALL";
}else if(type==1){
	keyword_type ="MV_NAME";
}else if(type==2){
	keyword_type ="MV_ACTOR";
}else if(type==3){
	keyword_type ="MV_DIRETOR";
} 

//등급
String Agrade[] = grade.split(",");
String Bgrade = "";
String Cgrade = "";
for(int i =0;i<Agrade.length;i++){
/* 	System.out.println("Agrade = "+Agrade[i]); */
	Bgrade +="'"+Agrade[i]+"',";
}



//장르
String Agenre[] = genre.split(",");
String Bgenre = "";
String Cgenre = "";
for(int i = 0;i<Agenre.length;i++){
/* 	System.out.println("Agenre = "+Agenre[i]); */
	Bgenre +="'"+Agenre[i]+"',";
}

/* 
System.out.println("Bgrade = "+Bgrade);
System.out.println("Bgenre = "+Bgenre); 
*/
//여기서  스트링 마지막 값 자름
Cgrade = Bgrade.substring(1, Bgrade.length()-2);
Cgenre = Bgenre.substring(1, Bgenre.length()-2);
keyword = "%"+keyword+"%";


/* System.out.println("Cgrade = "+Cgrade);
System.out.println("Cgenre = "+Cgenre);
System.out.println("keyword = "+keyword); */
/////////////////////////////////////////////////////
/* System.out.println("keyword_type = "+keyword_type);

System.out.println("keyword = "+keyword);
 */


movieDAO dao = movieDAO.getInstance();
List<movieDTO> list = dao.moviefind(Cgrade,keyword_type,keyword,Cgenre);


%>
<script type="text/javascript">
$(document).ready(function() {
$("#like_btn").click(function(){
	alert("클릭");
	
});
});
</script>
<p align="center">아래의 선택조건에 해당되는 영화가 <b style="color: red;">총 <%=list.size() %></b> 건 검색되었습니다.</p>
<fieldset>
<table>
<col width="100"><col width="700">

<%if(keyword!=""){ %>
  <tr>
  <td>키워드</td>
  <td><%=keyword.substring(1, keyword.length()-1)%></td>
  </tr>
<%} %>

  <tr>
  <td>장르</td>
  <td>
  <%
/*   System.out.println(genre); */
  	if(genre.equals("공포,SF,멜로,코미디,애니메이션,액션,기타")){%>
  		전체
  	<%}else{%>
  		<%=genre %>
  <% } %>
  </td>
  </tr>
  <tr>
  <td>관람등급</td>
  <td>
   <%
  	if(grade.equals("전체,12,15,청불")){%>
  		전체
  	<%}else{%>
  		<%=grade %>
  <% } %>
  </td>
  </tr>
  
</table>
<%
//페이징 처리
int total = list.size();
	int size = list.size();
	int size2 = size;
	
	final int ROWSIZE = 8; // 페이지당 게시물수
	final int BLOCK = 5; // 보여주는 페이지 수
	int indent = 0;

	int pg = 1;
	
	if(request.getParameter("pg")!=null) {
		pg = Integer.parseInt(request.getParameter("pg"));
	}
	
	int end = (pg*ROWSIZE);
	
	int allPage = 0;

	int startPage = ((pg-1)/BLOCK*BLOCK)+1;
	int endPage = ((pg-1)/BLOCK*BLOCK)+BLOCK;
	
	allPage = (int)Math.ceil(total/(double)ROWSIZE);
	
	if(endPage > allPage) {
		endPage = allPage;
	}
	
	size2 -=end;
	if(size2 < 0) {
		end = size;
	}
	if(total > 0){
%>
<!-- 여기 부터 페이징 -->
</fieldset>
<fieldset style="background-color: aqua;">
<table>
<col width="200"><col width="200"><col width="200"><col width="200">
<!-- 여기서 포문을 돌리자 -->
<tr>
<%	
int a = 0;
if((ROWSIZE*pg)>total){
	 a = total;
}else{
	 a = ROWSIZE*pg;
}

for(int i=(ROWSIZE*pg)-8;i<a;i++){ %>
<% if(i!=0&&i%4==0){%>
</tr><tr>
<%}%>
<td>

<input type="image"  class="poster" style="margin-bottom: 0px; margin-top: 1px;" src="<%=list.get(i).getPoster()%>" onclick="location.href='../movie/moviedetail.jsp?seq=<%=list.get(i).getSeq()%>'"><br>
<h6 align="left" style="margin-left: 20px; margin-top: 1px; margin-bottom: 0px;">예매율<br>개봉 : <%=list.get(i).getStart_time() %></h6>
<input type="image" class="img" src="../image/btn_movie_tiketing.png" onclick="location.href='tiket.jsp'">

</td>
<%} %>
</tr>

</table>
<%}else{ %>
작성된 평가가 없습니다.
<%} %>

<table width="100%" cellpadding="0" cellspacing="0" border="0" style="margin-top: 0px;padding-top: 0px;">
  <tr><td colspan="2"></td></tr>
  <tr>
	<td  align="center" >
		<%
			for(int i=startPage; i<= endPage; i++){
				if(i==pg){
		%>
					<u><b>[<%=i %>]</b></u>
		<%
				}else{
		%>
					[<a href="moviefind.jsp?pg=<%=i %>&pgchk=2&keyword_type=<%=type%>&keyword=<%=keyword%>&genre=<%=genre%>&grade=<%=grade%>"><%=i %></a>]
		<%
				}
			}
		%>
	
		</td>
		</tr>
	
 </table>
<%-- </fieldset>
<fieldset style="background-color: black;">
		<!-- <div> -->
		<font color="#ffffff" style="font-weight: bolder;">인기 트레일러</font><br><br>
		<table style="color: #ffffff">
		<col width="130"><col width="420"><col width="250">
		<tr><td colspan="2"><iframe style="border: 0px;" width="500" height="300" src="<%=list.get(0).getVideo()%>">크롬으로 접속부탁드립니다.</iframe></td>
		<td rowspan="2" valign="top">
		<iframe class="s_video" style="border: 0px;" width="180" height="100" src="<%=list.get(1).getVideo()%>">크롬으로 접속부탁드립니다.</iframe>
		<br>
		<iframe class="s_video" style="border: 0px;" width="180" height="100" src="<%=list.get(2).getVideo()%>">크롬으로 접속부탁드립니다.</iframe>
		<br>
		<iframe class="s_video" style="border: 0px;" width="180" height="100" src="<%=list.get(3).getVideo()%>">크롬으로 접속부탁드립니다.</iframe>
		</td>
		</tr>
		<tr><td><input type="image" class="rank-trailer"  src="<%=list.get(0).getPoster()%>" onclick="location.href='moviedetail.jsp?seq=<%=list.get(0).getSeq()%>'"></td><td id ="trailer"><a href="moviedetail.jsp?seq=<%=list.get(0).getSeq()%>"><%=list.get(0).getName() %></a><br><%=list.get(0).getGenre() %><br><%=list.get(0).getStart_time() %></td></tr>
		</table>
	</fieldset> --%>
</body>
</html>