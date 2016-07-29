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

String genre = request.getParameter("genre");

String grade = request.getParameter("grade");


if(type ==0){
	keyword_type ="MV_NAME";
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


System.out.println("Cgrade = "+Cgrade);
System.out.println("Cgenre = "+Cgenre);
System.out.println("keyword = "+keyword);
/////////////////////////////////////////////////////
System.out.println("keyword_type = "+keyword_type);

System.out.println("keyword = "+keyword);



movieDAO dao = movieDAO.getInstance();
List<movieDTO> list = dao.moviefind(Cgrade,keyword_type,keyword,Cgenre);


%>
<p align="center">아래의 선택조건에 해당되는 영화가 <b style="color: red;">총 **</b> 건 검색되었습니다.</p>

<fieldset>
<table>
<col width="100"><col width="700">

<%if(keyword!=""){ %>
  <tr>
  <td>키워드</td>
  <td><%=keyword %></td>
  </tr>
<%} %>

  <tr>
  <td>장르</td>
  <td>
  <%
  	if(genre.equals("'공포','SF','멜로','코미디','애니메이션','기타'")){%>
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
  	if(grade.equals("'전체','12','15','청불'")){%>
  		전체
  	<%}else{%>
  		<%=grade %>
  <% } %>
  </td>
  </tr>
  
</table>
<%



%>
</fieldset>
<fieldset style="background-color: aqua;">
<table>
<col width="200"><col width="200"><col width="200"><col width="200">
<tr>
<% for(int i = 0; i<list.size();i++){ %>
	<td><img src ="<%=list.get(i).getPoster() %>"></td>
<%} %>
</tr>
</table>

</fieldset>
</body>
</html>