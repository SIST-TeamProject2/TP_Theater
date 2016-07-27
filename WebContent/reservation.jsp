
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
<%@ page import = "theater.roomDTO" %>
<%@ page import = "theater.nowDTO" %>
<%@ page import = "java.util.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <script src="http://code.jquery.com/jquery-latest.js"></script>
 
 <script>
function hide() {
	alert('hide');

$('#viewmovie').hide();
 
}
function show2() {
	alert('show2');
$('#viewmovie2').show();
	}
function hide2() {
	//alert('hide2');
$('#viewmovie2').hide();

	}
 </script>
 
<title>예매창1</title>
<%!
String str="";
String movie="영화를 선택하세요";
String room="영화관을 선택하세요";
String date="상영일를 선택하세요";
String mv_name_result="";

int check=0;
int check2=0;
int check3=0;
String[] arr;
String[] arr2;
List<Integer> check_tlist = new ArrayList<Integer>() ;
List<roomDTO> rlist = new ArrayList<roomDTO>();
List<roomDTO> rlist2 = new ArrayList<roomDTO>();
List<theaterDTO> rlist3 = new ArrayList<theaterDTO>();
%>
<%
DBConnection db = DBConnection.getInstance();

movieDAO mdao = movieDAO.getInstance();


theaterDAO tdao = theaterDAO.getInstance();
List<theaterDTO> tlist = tdao.getTheater();


///현재 선택 정보(영화, 극장, 날짜 , 시간) 담는  DTO
nowDTO ndto = new nowDTO();

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

<%System.out.println("request.getParameter(mv_name)==========="+request.getParameter("mv_name")); %> 
<%System.out.println("request.getParameter(movie)==========="+request.getParameter("movie")); %> 
<%if(request.getParameter("mv_name")==null|| request.getParameter("movie")==null){
	System.out.println("mv_name==null");
	List<movieDTO> mlist = mdao.getMovie();%>

		<div id="viewmovie">
	
			<%for(int i=0; i<mlist.size();i++){
				if(mlist.get(i).getGrade().equals("전체")){%>
					<img src = "img/symbol_movie_grade_1.png"/>
				<%}else if(mlist.get(i).getGrade().equals("12")){%>
					<img src = "img/symbol_movie_grade_2.png"/>
				<%}else if(mlist.get(i).getGrade().equals("15")){%>
					<img src = "img/symbol_movie_grade_3.png"/>
				<%}else if(mlist.get(i).getGrade().equals("청불")){%>
					<img src = "img/symbol_movie_grade_4.png"/>
				<%}else{%>
				<img src = "img/symbol_movie_grade_5.png"/>
	<%} %>
			<a id="viewmoviea" href="reservation_af.jsp?name=<%=mlist.get(i).getName()%>"><%=mlist.get(i).getName()%></a><br>
		<%} %>
		</div>
		
<%}else if(request.getParameter("mv_name")!=null){

	List<movieDTO> mlist2 = new ArrayList<movieDTO>();
	System.out.println("mv_name!=null");%>
	
		<div id="viewmovie2">
	
		<%
		mv_name_result=request.getParameter("mv_name");
		arr2 = new String[100];
		arr2 =mv_name_result.split(",");
		
		System.out.println("arr2.length=="+arr2.length);
		
		for(int i=0; i<arr2.length;i++){
			System.out.println(i +arr2[i]);
			mlist2.add(mdao.get_grade_Movie(arr2[i]));
		}
			for(int i=0; i<mlist2.size();i++){
			if(mlist2.get(i).getName()==null){
				mlist2.remove(i);
			}
		
		}
	
	/* 	for(int i=0; i<mlist2.size();i++){
			for(int j=1; j<mlist2.size()-1;j++){
				if(mlist2.get(i).getName().equals(mlist2.get(j).getName())){
					mlist2.remove(i);
				}
			}
		}  */
	System.out.println("mv_name_result="+mv_name_result);
		System.out.println("mlist2.size()=="+mlist2.size());

		for(int i=0; i<mlist2.size();i++){
			if(mlist2.get(i).getGrade().equals("전체")){%>
				<img src = "img/symbol_movie_grade_1.png"/>
			<%}else if(mlist2.get(i).getGrade().equals("12")){%>
				<img src = "img/symbol_movie_grade_2.png"/>
			<%}else if(mlist2.get(i).getGrade().equals("15")){%>
				<img src = "img/symbol_movie_grade_3.png"/>
			<%}else if(mlist2.get(i).getGrade().equals("청불")){%>
				<img src = "img/symbol_movie_grade_4.png"/>
			<%}else{%>
			<img src = "img/symbol_movie_grade_5.png"/>
<%} %>
		<a id="viewmoviea" href="reservation_af.jsp?name=<%=mlist2.get(i).getName()%>"><%=mlist2.get(i).getName()%></a><br>
	<%} %>
		</div>
<%}

%>


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
<%if(request.getParameter("mv_name")==null& request.getParameter("movie")==null) {%>

<div id = "viewarea">
<a href="reservation_af.jsp?name=서울">서울(<%=seoul/2%>)</a><br>
<a href="reservation_af.jsp?name=경기">경기(<%=gg/2%>)</a><br>
<a href="reservation_af.jsp?name=인천">인천(<%=ic/2%>)</a>
</div>
<%}else if(request.getParameter("mv_name")==null& request.getParameter("movie")!=null) {
		rlist3=tdao.movieName_getTheater(request.getParameter("movie"));
%>
<div id = "viewarea">
<%
for(int i=0; i<rlist3.size();i++){
	%>
	<a href="reservation_af.jsp?name2=<%=rlist3.get(i).getName()%>"><%=rlist3.get(i).getName()%></a><br>
	<%}
%>
</div>


<%} %>
</td>

<td>
<%
	if(request.getParameter("result")!=null){
	str = request.getParameter("result");
	
	arr = new String[100];
	arr =str.split(",");


	 for(int i=0; i<arr.length;i++){
		%>
		<a href="reservation_af.jsp?room=<%=arr[i].toString()%>"><%=arr[i].toString()%></a><br>
		<%
	} 
	check=1;
	}
	
	if(check==1&request.getParameter("result")==null){
	
	for(int i=0; i<arr.length;i++){
		%>
		<a href="reservation_af.jsp?room=<%=arr[i].toString()%>"><%=arr[i].toString()%></a><br>
		<%
	} 
	check=1;
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
		<a href="reservation_af.jsp?date=<%=year+"."+two(Integer.toString(month))+"."+two(Integer.toString(i))%>"><%=i%></a>
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

<%-- 실시간 선택 항목 출력 --%>
<table border="1">
<col width="500"/><col width="300"/><col width="300"/>


<tr>
<%
if(request.getParameter("movie")!=null){
%>
<td>
<%ndto.setName(request.getParameter("movie")); 
movie= ndto.getName();%>

영화 제목 : <%=movie%> 
</td>
<td>
영화관 : <%=room%>
</td>
<td>
상영날짜 : <%=date%>
</td>

<%} %>
</tr>

<tr>
<%
if(request.getParameter("room")!=null){
%>
<td>
<%ndto.setRoom(request.getParameter("room")); %>

<%room= ndto.getRoom();

System.out.println("room========"+room);
check_tlist = tdao.selectCode(room);//영화 제목 클릭했을때 그 영화를 상영하는 상영관 리스트
System.out.println("check_tlist.size()========"+check_tlist.size());

%>
<% 
String mv_name="";

	rlist = tdao.selectCode_getRoom(room);


for(int i=0; i<rlist.size();i++){
	mv_name+=rlist.get(i).getMovie_name()+",";
}

System.out.println("mv_name======="+mv_name);

check2=1;

 if(check2==1){%>
<script type="text/javascript">
hide();
show2();
location.href("reservation.jsp?mv_name=<%=mv_name%>");
</script>
<%} %> 

영화 제목 : <%=movie%> 
</td>
<td>
영화관 : <%=room%>
</td>
<td>
상영날짜 : <%=date%>
</td>

<%} %>
</tr>


<tr>
<%
if(request.getParameter("date")!=null){
%>
<td>
<%ndto.setDate(request.getParameter("date")); %>
<%date= ndto.getDate();%>
영화 제목 : <%=movie%> 
</td>
<td>
영화관 : <%=room%>
</td>
<td>
상영날짜 : <%=date%>
</td>
<%} %>
</tr>

<tr>
<%
if(request.getParameter("mv_name")!=null){
%>
<td>

영화 제목 : <%=movie%> 
</td>
<td>
영화관 : <%=room%>
</td>
<td>
상영날짜 : <%=date%>
</td>
<%} %>
</tr>

</table>

<%


if(movie!="영화를 선택하세요" &  room!="영화관을 선택하세요" & date!="상영일를 선택하세요"){
	List<Integer> temp = new ArrayList<Integer>();
	temp = tdao.selectCode(room);

		int fcode = temp.get(0).intValue();
		int fcode2 = temp.get(1).intValue();
		System.out.println("fcode==="+fcode);
		System.out.println("fcode2==="+fcode2);
}

if(movie!="영화를 선택하세요" &  room!="영화관을 선택하세요" ){
	rlist2 = tdao.selectCode_getRoom(room);
	for(int i=0; i<rlist2.size();i++){
		if(movie.equals(rlist2.get(i).getMovie_name())){	
		}
		else{
			%>
			<script type="text/javascript">
			alert('<%=room%>영화관에서 <%=movie%>영화가 상영중이 아닙니다');
			</script>
			<%
			/* rlist3=tdao.movieName_getRoom(movie); */
			}
	}
}

%>


</body>
</html>















