<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import ="theater.theaterDAO" %>
    <%@ page import ="movie.movieDTO" %>
<%@ page import = "movie.movieDAO" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>reservation2.jsp</title>
 <script src="http://code.jquery.com/jquery-latest.js"></script>

<%
String sgrade="";

%>

<%!
String arr2[];
int javapcount=0;

int general2=0;
int teen2=0;

int totalPeople=0;
int choiceSeat=0;

String seatArr[] = new String[100];
String seat="";

%> 

</head>
<body>
<%

String movie = (String)session.getAttribute("movie");
String theater = (String)session.getAttribute("theater");
int room = (int)session.getAttribute("room");
String date = (String)session.getAttribute("date");
String time = (String)session.getAttribute("time");
System.out.println("*************session******************");
System.out.println(movie+theater+room+date+time);
System.out.println("*************session******************");
//받아온 값
//fnum=roomDTO [room_num=1, start_time=16:30, movie_name=도리를 찾아서, sdate=2016.07.26, edate=2016.08.10]
			
		if(request.getParameter("fnum")!=null){
			arr2 = new String[50];
			arr2 =request.getParameter("fnum").split(",");
			
			for(int i=0; i<arr2.length;i++){
			System.out.println(arr2[i]);
			}
			movieDAO dao = movieDAO.getInstance();
			movieDTO dto = new movieDTO();
			dto = dao.get_grade_Movie(arr2[0]);
			
			sgrade = dto.getGrade();
			////등급얻어옴완료
			System.out.println("dto.getGrade()=="+dto.getGrade());
		
		}else{
			
		}
/////////////////예매된 좌석번호
		theaterDAO tdao = theaterDAO.getInstance();
		List<String>arr_seat = new ArrayList<String>();
		List<String>arr_seat_f = new ArrayList<String>();
		String[] temp = new String[500];
		String[] seat_list = new String[500];
		
		arr_seat= tdao.existSeat(theater,movie,room,date);
		System.out.println("arrr.size==="+arr_seat.size());
		for(int i=0; i<arr_seat.size();i++){
			System.out.println(i+"====="+arr_seat.get(i));
			System.out.println("temp.length===전"+temp.length);
			temp= arr_seat.get(i).split(",");
			System.out.println("temp.length===후"+temp.length);
		}
		
		
		for(int i=0; i<temp.length;i+=2){
			System.out.println(i+"===="+ temp[i]);
			String a = temp[i]+","+temp[i+1];
			arr_seat_f.add(a);
		}
		
		for(int i=0; i<arr_seat_f.size();i++){
			System.out.println(i+"==arr_seat_f==");
			System.out.println(i+"===="+arr_seat_f.get(i));
		}
		
		


%>
<script type="text/javascript">
function popupOpen(){
	var popUrl = "reservation2_af.jsp?grade=<%=sgrade%>";	//팝업창에 출력될 페이지 URL
	var popOption = "width=470, height=260, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
<%-- 	<%if(sgrade!=""){%>	 --%>
	window.open(popUrl,"",popOption);
<%-- 	<%}%> --%>
	}


</script>

<%if(sgrade.equals("")){}
else{%>

		<script type="text/javascript">
				popupOpen();
			</script>
<%} %>

<%//********************************************************************예매화면시작******************************************************; %>


<input type="submit" value="reset" onclick="location.href='reservation_af.jsp?btn2=btn2'"/>
<%
if(request.getParameter("btn2")!=null){
	javapcount=0;
	general2=0;
	teen2=0;

	totalPeople=0;
	choiceSeat=0;
}
%>
<table border ="1">
<tr>
<td>인원선택</td>
<td>상영정보</td>
</tr>
<tr>

<td>
<%
if(request.getParameter("general2")!=null){
	general2=Integer.parseInt(request.getParameter("general2"));
}
if(request.getParameter("teen2")!=null){
	teen2=Integer.parseInt(request.getParameter("teen2"));
}

%>
일반 :<input type="image" src="image/left.png" onclick="location.href='reservation_af.jsp?general2=<%=general2%>'"><%=general2%><input type="image" src="image/left.png" onclick="location.href='reservation_af.jsp?general2_p=<%=general2%>'">
청소년 :<input type="image" src="image/left.png" onclick="location.href='reservation_af.jsp?teen2=<%=teen2%>'"><%=teen2%><input type="image" src="image/left.png" onclick="location.href='reservation_af.jsp?teen2_p=<%=teen2%>'">


<%
System.out.println("general2="+general2+"teen2="+teen2);
totalPeople=general2+teen2;
System.out.println("totalpeople="+totalPeople);
%>
</td>


<td>
영화 제목 : <%=movie %>
<br>영화관 : <%=theater%>
<br>상영관 : <%=room%>관
<br>상영일 : <%=date%>
<br>상영시간 : <%=time%> 
<br>선택 인원 : 성인<%=general2%>명		청소년<%=teen2%>명 
</td>
</tr>

</table>


<br><br>
<input type="image" src="image/screen.png">
<br>
<%

int i=0; int j=0; char aString=65;
for(i=0; i<10; i++){
	String str = String.valueOf(aString);
	%>
	<br>
		<%
		for(j=0; j<15; j++){ 
			for(int k=0; k<arr_seat_f.size();k++){
				
					char temp_ch = arr_seat_f.get(k).charAt(0);
					arr_seat_f.get(k).substring(1, 2);
					System.out.println("j=="+j+"arr_seat_f.get(k).substring(2, 2)=="+Integer.parseInt(arr_seat_f.get(k).substring(2, 3)));
					
					System.out.println("temp_ch=="+temp_ch);
					System.out.println("aString=="+aString);
						if(j==Integer.parseInt(arr_seat_f.get(k).substring(2, 3))&&temp_ch==aString){
							%>
							<input type="image" src="image/seat2.gif">
												
							<%
						}else{%>
						<img alt="좌석이미지" src="image/seat.gif" name=<%=aString+","+j%> onclick="setImage(this)"/>
							<%
						}
			/* 	if(j==Integer.parseInt(arr_seat_f.get(k).substring(1, 2))){
					System.out.println("j=="+j+"arr_seat_f.get(k).substring(2, 2)=="+arr_seat_f.get(k).substring(2, 3));
				}else{
					System.out.println("else문");
				} */
			}
		%> 
		<%}
	aString++;} %>
	
	
	
<%-- 	
	<%

int i=0; int j=0; char aString=65;
for(i=0; i<10; i++){
	String str = String.valueOf(aString);
	%>
	<br>
		<%
		for(j=0; j<15; j++){ 
					%>
					<img alt="좌석이미지" src="image/seat.gif" name=<%=aString+","+j%> onclick="setImage(this)"/>
		
		
			<%
		for(j=0; j<15; j++){ 
			for(int k=0; k<arr_seat_f.size();i+=2){
					char temp_ch = arr_seat_f.get(k).charAt(0);
					if(j==Integer.parseInt(arr_seat_f.get(k+1))&& aString==temp_ch){%>
						<img alt="좌석이미지" src="image/seat2.gif" name=<%=aString+","+j%> onclick="setImage(this)"/>
					<%}else{%>
					<img alt="좌석이미지" src="image/seat.gif" name=<%=aString+","+j%> onclick="setImage(this)"/>
					<% 
					}
			}
		%>
		<%}
	aString++;} %> --%>
<br>
------------------
<input type="hidden" value=""  id="ImageName"   name="ImageName"/>

<input type="hidden" value="" id="choiceSeat"   name="choiceSeat"/>



<script type="text/javascript">
seatArray = new Array();

$("img").click(function ( event ){
	
	var choiceSeat = document.getElementById('choiceSeat');
	var src2 = $(this).attr("src");
	
if(<%=totalPeople%>==0){
		alert("인원수를 먼저 선택하세요.");	
	}else if(choiceSeat.innerHTML==<%=totalPeople%>){
		if(src2==="image/seat2.gif"){
			var src =($(this).attr("src")==="image/seat2.gif")?"image/seat.gif":"image/seat.gif";
			$(this).attr("src", src);
			choiceSeat.innerHTML = Number(choiceSeat.innerHTML)-1;
			for (i=0; i<seatArray.length;i++){
				if(seatArray[i]===$(this).attr("name")){
					seatArray.splice(i,1);
				}
			}
			alert("length="+seatArray.length);
		}else{
			alert("선택한 인원 수를 초과하였습니다.");
	}
	}else{
		if(src2=="image/seat2.gif"){
			var src =($(this).attr("src")==="image/seat2.gif")?"image/seat.gif":"image/seat.gif";
			$(this).attr("src", src);
			choiceSeat.innerHTML = Number(choiceSeat.innerHTML)-1;
			
			for (i=0; i<seatArray.length;i++){
				if(seatArray[i]===$(this).attr("name")){
					seatArray.splice(i,1);
				}
			}
			alert("length="+seatArray.length);
		
		}else if(src2=="image/seat.gif"){
			var src =($(this).attr("src")==="image/seat.gif")?"image/seat2.gif":"image/seat2.gif";
			$(this).attr("src", src);
			choiceSeat.innerHTML = Number(choiceSeat.innerHTML)+1;
			seatArray.push($(this).attr("name"));
			alert("length="+seatArray.length);
		}
	}
});


  function setImage(control)
{	
   /* document.getElementById("ImageName").value = control.name; */
   alert("control.name"+control.name);

//   seatArray.push(control.name); 
 //  alert("length="+seatArray.length);
 }  
 function nextpage(){
	 if(choiceSeat.innerHTML<<%=totalPeople%>){
		 alert("선택하신 인원수만큼 좌석을 모두 선택하세요");
	 }else{
	 alert("length="+seatArray.length);

	document.location.href="reservation_af.jsp?seatArray="+seatArray;
	 }
 }
 
 </script> 
 <%
session.setAttribute("general",general2);
 session.setAttribute("teen",teen2);
 %> 



<input type="button" value="결제하기" onclick="nextpage();">

</body>
</html>