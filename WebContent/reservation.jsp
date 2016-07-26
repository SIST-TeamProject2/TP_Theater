
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page import="movie.movieDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import ="db.DBConnection" %>
<%@ page import ="movie.movieDTO" %>
<%@ page import = "movie.movieDAO" %>
<%@ page import = "theater.theaterDAO" %>
<%@ page import = "theater.theaterDTO" %>
<%@ page import = "java.util.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>예매창1</title>
<%!
String str="";

%>
<%
DBConnection db = DBConnection.getInstance();

movieDAO mdao = movieDAO.getInstance();
List<movieDTO> mlist = mdao.getMovie();

theaterDAO tdao = theaterDAO.getInstance();
List<theaterDTO> tlist = tdao.getTheater();

int seoul=0;
int gg=0;
int ic=0;

%>

</head>
<body>


 <table>
<tr>
<td>영화</td>
<td colspan="2">극장</td>
<td>날짜</td>
<td>시간</td>
</tr>



<tr>
<td>
<% for(int i=0; i<mlist.size();i++){ %>
	<%if(mlist.get(i).getGrade().equals("전체")){%>
	<img src = "img/symbol_movie_grade_1.png"/>
	<%}else if(mlist.get(i).getGrade().equals("12")){%>
	<img src = "img/symbol_movie_grade_2.png"/>
	<%}else if(mlist.get(i).getGrade().equals("15")){ %>
	<img src = "img/symbol_movie_grade_3.png"/>
	<%}else if(mlist.get(i).getGrade().equals("청불")){ %>
	<img src = "img/symbol_movie_grade_4.png"/>
	<%}else{%>
	<img src = "img/symbol_movie_grade_5.png"/>
	<%} %>

<a href="reservation_af.jsp?name=<%=mlist.get(i).getName()%>"><%=mlist.get(i).getName()%></a><br>
<%} %>
</td>



<% for(int i=0; i<tlist.size();i++){
	if(tlist.get(i).getField().equals("서울")){
		seoul++;
	}else if(tlist.get(i).getField().equals("경기")){
		gg++;
	}else if(tlist.get(i).getField().equals("인천")){
		ic++;
	}
}
%>

<td>
<a href="reservation_af.jsp?name=서울">서울(<%=seoul/2%>)</a><br>
<a href="reservation_af.jsp?name=경기">경기(<%=gg/2%>)</a><br>
<a href="reservation_af.jsp?name=인천">인천(<%=ic/2%>)</a>
</td>



<td>
<%
if(request.getParameter("result")!=null){
str = request.getParameter("result");

String[] arr = new String[100];
arr =str.split(",");

for(int i=0; i<arr.length;i++){
	%>
	<a href="reservation_af2.jsp"><%=arr[i].toString()%></a><br>
	<%
} 
}
%>
</td>
<td>


<%!
public boolean nvl(String msg){
	return msg==null || msg.trim().equals("")?true:false; 	
}

public String two(String msg){
	return msg.trim().length() < 2 ? "0"+msg : msg.trim();
}

%>

<%
Calendar cal = Calendar.getInstance();	// 오늘날짜
cal.set(Calendar.DATE, 1);

String syear = request.getParameter("year");
String smonth = request.getParameter("month");

int year = cal.get(Calendar.YEAR);
if(!nvl(syear)){
	year = Integer.parseInt(syear);
}

int month = cal.get(Calendar.MONTH)+1;
if(!nvl(smonth)){
	month = Integer.parseInt(smonth);
}

cal.set(year, month-1, 1);

int dayOfWeek=cal.get(Calendar.DAY_OF_WEEK);

%>

<hr/>

<div align="center">

<table border="1">
<col width="10"/><col width="10"/><col width="10"/>
<col width="10"/><col width="10"/><col width="10"/>
<col width="10"/>


<tr height="10">
	<td colspan="7" align="center">
		<font color="red" style="font-size:50">
			<%=String.format("%d년&nbsp;&nbsp;%d월", year, month) %>
		</font>
	
	</td>
</tr>


<tr height="10" align="center">
	<td valign="middle">일</td>
	<td>월</td>
	<td>화</td>
	<td>수</td>
	<td>목</td>
	<td>금</td>
	<td>토</td>
</tr>

<tr height="10" align="left" valign="top">

<%
for(int i = 1;i < dayOfWeek; i++){
	%>
	<td>&nbsp;</td>
	<%	
}
int lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
for(int i = 1;i <= lastDay; i++){
	%>	
	

 <td height="10" align="left" valign="top">
		<a href="calaf.jsp?=<%=year+"."+two(Integer.toString(month))+"."+two(Integer.toString(i))%>"><%=i%></a>
	</td> 
	
	<%
	if((i+dayOfWeek-1)%7==0){
	%>
		</tr><tr height="10" align="left" valign="top">
	<%
	}
}

for(int i = 0;i < (7-(dayOfWeek+lastDay-1)%7)%7; i++){
	%>
	<td>&nbsp;</td>	
	<%
}
%>

</tr>

</table>
</div>

</td>
</tr>

</table>


<table>
<%
if(request.getParameter("movie")!=null){
%>
<tr>
<td>
[ 선택한 정보  ]

영화제목 : 
</td>
<td>
<%=request.getParameter("movie") %>
</td>
</tr>
<%
}
%>

</table>

</body>
</html>