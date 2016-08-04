<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import ="theater2.theaterDAO" %>
    <%@ page import ="movie2.movieDTO" %>
<%@ page import = "movie2.movieDAO" %>
<%@ page import = "reservation.reservationDAO" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../css/reservation.css">
<title>reservation2.jsp</title>
 <script src="http://code.jquery.com/jquery-latest.js"></script>

<%!
String arr2[];
int javapcount=0;

int general2=0;
int teen2=0;

int totalPeople=0;
int choiceSeat=0;

String seatArr[] = new String[100];
String seat="";

reservationDAO rdao = reservationDAO.getInstance();
movieDAO mdao = movieDAO.getInstance();
%> 
<%
String sgrade="";
if(request.getParameter("seat_result")!=null){
	if(request.getParameter("seat_result").equals("false")){
		choiceSeat=0;
	%>
	<script type="text/javascript">
	alert("이런...이미 선점된 좌석입니다. 다른좌석을 선택하세요");
	</script>
	<%
	}
}else{
	
}
%>

</head>
<body>
<jsp:include page="../include/header.jsp"/>
<jsp:include page="../include/nav.jsp"/>
<div class="section_reservation">

<%

String movie = (String)session.getAttribute("movie");
String theater = (String)session.getAttribute("theater");
int room = (int)session.getAttribute("room");
String date = (String)session.getAttribute("date");
String time = (String)session.getAttribute("time");
///System.out.println("*************session******************");
//System.out.println(movie+theater+room+date+time);
//System.out.println("*************session******************");

/////////////////예매된 좌석번호
		theaterDAO tdao = theaterDAO.getInstance();
		List<String>arr_seat = new ArrayList<String>();
		List<String>arr_seat_f = new ArrayList<String>();
		List<String>temp = new ArrayList<String>();
		String[] temp2 = new String[500];
		String[] seat_list = new String[500];
		
		arr_seat= tdao.existSeat(theater,movie,room,date);
		//System.out.println("arr_seat.size==="+arr_seat.size());
		
		if(arr_seat.size()!=0){
			for(int i=0; i<arr_seat.size();i++){
			//	System.out.println(i+"====="+arr_seat.get(i));
			
			}
			for(int k=0; k<arr_seat.size();k++){
					for(int i=0; i<arr_seat.get(k).length();i++){
						
						temp2= arr_seat.get(k).split(",");
					//	System.out.println("temp2.length=="+temp2.length);
						for(int n=0; n<temp2.length;n++){
							//System.out.println("temp2["+n+"]==="+temp2[n]);
		
						}
					}
					for(int i=0; i<temp2.length;i++){
						temp.add(temp2[i]);
					}

			}
			
			for(int i=0; i<temp.size();i+=2){
				String a = temp.get(i)+","+temp.get(i+1);
				arr_seat_f.add(a);
			}
			
			for(int i=0; i<arr_seat_f.size();i++){
			//	System.out.println(i+"==arr_seat_f==");
				//System.out.println(i+"===="+arr_seat_f.get(i));
			} 
		}else{
			//System.out.println("else문");
			//System.out.println("arr_seat_f.size()==="+arr_seat_f.size());
		}
		
/* 		
		for(int i=0; i<arr_seat_f.size();i++){
			System.out.println("reservation2");
			System.out.println(arr_seat.get(i));
		} */
		
%>
<script type="text/javascript">
function popupOpen(){
	var popUrl = "reservation2_af.jsp?grade=<%=mdao.get_grade_Movie2((String)session.getAttribute("movie"))%>";
	var popOption = "width=350, height=250, resizable=no, scrollbars=no, status=no;"; 
	window.open(popUrl,"",popOption);

	}


</script>


<%if(request.getParameter("fnum")==null){}
else{
	//sgrade=mdao.get_grade_Movie((String)session.getAttribute("movie"));
%>

		<script type="text/javascript">
				popupOpen();
			</script>
<%} %>
<%-- <%if(sgrade.equals("")){}
else{%>

		<script type="text/javascript">
				popupOpen();
			</script>
<%} %> --%>

<%
if(request.getParameter("btn2")!=null){
	javapcount=0;
	general2=0;
	teen2=0;

	totalPeople=0;
	choiceSeat=0;
}
%>

<div class="first2">
<input type="image" align="right" alt="새로고침이미지없음" src="../image/새로고침.png" onclick="location.href='reservation_af.jsp?btn2=btn2'"/>
</div>


<div class="second2">
<table>
<tr>
<th colspan="2" >인원선택</th>
<th >상영정보</th>
</tr>
<tr>

<%
if(request.getParameter("general2")!=null){
	general2=Integer.parseInt(request.getParameter("general2"));
}
if(request.getParameter("teen2")!=null){
	teen2=Integer.parseInt(request.getParameter("teen2"));
}

%>
<td>
성인<br><br>
<input type="image"   src="../image/plus.png" onclick="location.href='reservation_af.jsp?general2_p=<%=general2%>'">

<br>
&nbsp;&nbsp;<%=general2%>
<br>
<input type="image"  src="../image/minus.png" onclick="location.href='reservation_af.jsp?general2=<%=general2%>'">
<br>




<%
//System.out.println("general2="+general2+"teen2="+teen2);
totalPeople=general2+teen2;
//System.out.println("totalpeople="+totalPeople);
%>
</td>

<td>
청소년<br><br>
&nbsp;&nbsp;<input type="image"  src="../image/plus.png" onclick="location.href='reservation_af.jsp?teen2_p=<%=teen2%>'">

<br>
&nbsp;&nbsp;&nbsp;<%=teen2%>
<br>
&nbsp;&nbsp;<input type="image"   src="../image/minus.png" onclick="location.href='reservation_af.jsp?teen2=<%=teen2%>'">

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
</div>
<br>

<div class="third2">

<input type="image" src="../image/seatInfo.gif"><br><br>
</div>


<div class="fourth2">
<input type="image" src="../image/screen.png">
<br><br>
<%

int i=0; int j=0; char aString=65;

List<Integer> tempArr = new ArrayList<Integer>();
List<Integer> tempArr2 = new ArrayList<Integer>();
for(i=0; i<10;i++){

//System.out.println("arr_seat_f.size()===="+arr_seat_f.size());
for(j=0; j<10; j++){ 

	if(arr_seat_f.size()!=0){
	/* 	int dummy=0;
		int dummy2=0; */
		for(int k=0; k<arr_seat_f.size();k++){
	
				char temp_ch = arr_seat_f.get(k).charAt(0);
				arr_seat_f.get(k).substring(1, 2);
			//	System.out.println("j=="+j+"arr_seat_f.get("+k+").substring(2, 2)=="+Integer.parseInt(arr_seat_f.get(k).substring(2, 3)));
		
			//	System.out.println("temp_ch=="+temp_ch);
			//	System.out.println("aString=="+aString);
					if(j==Integer.parseInt(arr_seat_f.get(k).substring(2, 3))&&temp_ch==aString){
						//tempArr.add(j);
						/* System.out.println("if문이다");
						System.out.println("i="+i+"j="+j+"aString="+temp_ch); */
						tempArr.add(i);
						tempArr2.add(j);
					/* 	System.out.println("tempArr.size()="+tempArr.size());
						System.out.println("tempArr2.size()="+tempArr2.size()); */
						
						%>
					 <input type="image" src="../image/seat3.gif">  
											
						<%
					}else {	
					//	out.println(i+","+j);
						%>
						<%	
					}
		}	

//////////////////////////////////////////////////////////////////////////////////////////////////////////	
int check=-1; int check2=-1;
		for(int n=0; n<tempArr.size();n++){
			if(i==tempArr.get(n)&&j==tempArr2.get(n)){
				check=tempArr.get(n);
				check2=tempArr2.get(n);
			}
		}
		if(i==check&&j==check2){
							%>
							<%
						}else {%>
							 <img alt="좌석이미지" src="../image/seat.gif" name=<%=aString+","+j%> onclick="setImage(this)"/>  
							 <%
						
						}

		//////////////////////////////////////////////////////////////////////////////////////////////////////////		
	}else{
			//System.out.println("else문");%>
	<img alt="좌석이미지" src="../image/seat.gif" name=<%=aString+","+j%> onclick="setImage(this)"/> 
		<%
	}
%> 
<%} 
aString++;%><br>
<%} %>
<br>
<br>
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
		if(src2==="../image/seat2.gif"){
			var src =($(this).attr("src")==="../image/seat2.gif")?"../image/seat.gif":"../image/seat.gif";
			$(this).attr("src", src);
			choiceSeat.innerHTML = Number(choiceSeat.innerHTML)-1;
			for (i=0; i<seatArray.length;i++){
				if(seatArray[i]===$(this).attr("name")){
					seatArray.splice(i,1);
				}
			}
		//	alert("length="+seatArray.length);
		}else{
			alert("선택한 인원 수를 초과하였습니다.");
	}
	}else{
		if(src2=="../image/seat2.gif"){
			var src =($(this).attr("src")==="../image/seat2.gif")?"../image/seat.gif":"../image/seat.gif";
			$(this).attr("src", src);
			choiceSeat.innerHTML = Number(choiceSeat.innerHTML)-1;
			
			for (i=0; i<seatArray.length;i++){
				if(seatArray[i]===$(this).attr("name")){
					seatArray.splice(i,1);
				}
			}
			//alert("length="+seatArray.length);
		
		}else if(src2=="../image/seat.gif"){
			var src =($(this).attr("src")==="../image/seat.gif")?"../image/seat2.gif":"../image/seat2.gif";
			$(this).attr("src", src);
			choiceSeat.innerHTML = Number(choiceSeat.innerHTML)+1;
			seatArray.push($(this).attr("name"));
		//	alert("length="+seatArray.length);
		}
	}
});


  function setImage(control)
{	
   /* document.getElementById("ImageName").value = control.name; */
 //  alert("control.name"+control.name);
 
//   seatArray.push(control.name); 
 //  alert("length="+seatArray.length);
 }  
 function nextpage(){
	 if(choiceSeat.innerHTML<<%=totalPeople%>){
		 alert("선택하신 인원수만큼 좌석을 모두 선택하세요");
	 }else if(<%=totalPeople%>==0){
		 alert("인원수를 먼저 선택하세요.");
	 } else{
	// alert("length="+seatArray.length);

	document.location.href="reservation_af.jsp?seatArray="+seatArray;
	 }
 }
 
 </script> 
 <%
session.setAttribute("general",general2);
 session.setAttribute("teen",teen2);


 %> 

</div>

<input type="button" align="right"  value="결제하기" onclick="nextpage();">
</div>
<jsp:include page="../include/footer.jsp"/>
<jsp:include page="../include/aside.jsp"/>
</body>
</html>