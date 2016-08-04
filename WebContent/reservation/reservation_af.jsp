<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
 <%@ page import ="DB.DBControll" %>
<%@ page import ="movie2.movieDTO" %>
<%@ page import = "movie2.movieDAO" %>
<%@ page import = "theater2.theaterDAO" %>
<%@ page import = "theater2.theaterDTO" %>
<%@ page import = "reservation.reservationDAO" %>
<%@ page import = "java.util.*" %>
<title>reservation_af</title>

<%


	
theaterDAO tdao = theaterDAO.getInstance();
reservationDAO rdao = reservationDAO.getInstance();
	
String name = request.getParameter("name");
List<String> tslist = tdao.selectTheater(name);
String result="";
for(int i=0; i<tslist.size();i++){
	  result+=tslist.get(i).toString()+",";
}
String movie = request.getParameter("movie");
String room = request.getParameter("room");
if(result!=""){
%>
<script type="text/javascript">
location.href='reservation.jsp?result=<%=result%>';
</script>
<%}else if(request.getParameter("name")!=null){
%>
<script type="text/javascript">
location.href='reservation.jsp?movie=<%=name%>';
</script>

<%}else if(request.getParameter("name")==null&request.getParameter("room")!=null){%>
<script type="text/javascript">
location.href='reservation.jsp?room=<%=room%>';
</script>
<%}else if(request.getParameter("room")!=null){%>
<script type="text/javascript">
location.href='reservation.jsp?room=<%=request.getParameter("room")%>';
</script>
<%} else if(request.getParameter("room")==null & request.getParameter("date")!=null){%>
<script type="text/javascript">
location.href='reservation.jsp?date=<%=request.getParameter("date")%>';
</script>
<%} else if(request.getParameter("mv_name")!=null){%>
<script type="text/javascript">
location.href='reservation.jsp?mv_name=<%=request.getParameter("mv_name")%>';
</script>
<%} else if(request.getParameter("name2")!=null){%>
<script type="text/javascript">
location.href='reservation.jsp?name2=<%=request.getParameter("name2")%>';
</script>
<%}else if(request.getParameter("btn")!=null){%>
<script type="text/javascript">
location.href='reservation.jsp?btn=btn';
</script>
<%}else if(request.getParameter("btn2")!=null){%>
<script type="text/javascript">
location.href='reservation2.jsp?btn2=btn2';
</script>
<%}else if(request.getParameter("btn3")!=null){%>
<script type="text/javascript">
location.href='reservation3.jsp?btn3=btn3';
</script>
<%}else if(request.getParameter("fnum")!=null){%>
<script type="text/javascript">
location.href='reservation.jsp?fnum=<%=request.getParameter("fnum")%>';
</script>
<%}else if(request.getParameter("twoinfo")!=null){
	if(request.getParameter("twoinfo").equals("")||request.getParameter("twoinfo").equals("")){
		%>
		<script type="text/javascript">
	location.href='reservation.jsp?none=none';
	</script>
	<%}else{
	%>
	<script type="text/javascript">
	location.href='reservation2.jsp?fnum=<%=request.getParameter("twoinfo")%>';
	</script>
<%}} else if(request.getParameter("pcount")!=null){%>
<script type="text/javascript">
location.href='reservation2.jsp?pcount=<%=request.getParameter("pcount")%>';
</script>
<%}else if(request.getParameter("general2")!=null){%>
<script type="text/javascript">
<%
int rnum=0;
	if(Integer.parseInt(request.getParameter("general2"))>0){
		rnum = Integer.parseInt(request.getParameter("general2"))-1;
	}else{
		rnum=0;
	}
%>
location.href='reservation2.jsp?general2=<%=rnum%>';
</script>
<%}else if(request.getParameter("general2_p")!=null){%>
<script type="text/javascript">
location.href='reservation2.jsp?general2=<%=Integer.parseInt(request.getParameter("general2_p"))+1%>';
</script>
<%}else if(request.getParameter("teen2")!=null){%>
<script type="text/javascript">
<%
int rnum=0;
	if(Integer.parseInt(request.getParameter("teen2"))>0){
		rnum = Integer.parseInt(request.getParameter("teen2"))-1;
	}else{
		rnum=0;
	}
%>
location.href='reservation2.jsp?teen2=<%=rnum%>';
</script>
<%}else if(request.getParameter("teen2_p")!=null){%>
<script type="text/javascript">
location.href='reservation2.jsp?teen2=<%=Integer.parseInt(request.getParameter("teen2_p"))+1%>';
</script>
<%}else if(request.getParameter("grand2")!=null){%>
<script type="text/javascript">
<%
int rnum=0;
	if(Integer.parseInt(request.getParameter("grand2"))>0){
		rnum = Integer.parseInt(request.getParameter("grand2"))-1;
	}else{
		rnum=0;
	}
%>
location.href='reservation2.jsp?grand2=<%=rnum%>';
</script>
<%}else if(request.getParameter("grand2_p")!=null){%>
<script type="text/javascript">
location.href='reservation2.jsp?grand2=<%=Integer.parseInt(request.getParameter("grand2_p"))+1%>';
</script>
<%}else if(request.getParameter("seat")!=null){%>
<script type="text/javascript">
location.href='reservation2.jsp?seat=<%=request.getParameter("seat")%>';
</script>
<%}else if(request.getParameter("seatArray")!=null){
	session.setAttribute("hiddenseat", request.getParameter("seatArray"));//출력용아님  db저장용

	List<String>arr_seat = new ArrayList<String>();
	List<String>arr_seat_f = new ArrayList<String>();
	List<String>now_arr_seat_f = new ArrayList<String>();
	List<String>temp = new ArrayList<String>();
	String[] temp2 = new String[500];
	String[] now_temp = new String[500];
	String[] seat_list = new String[500];
	
	arr_seat= tdao.existSeat((String)session.getAttribute("theater"),(String)session.getAttribute("movie"),(int)session.getAttribute("room"),(String)session.getAttribute("date"));
	
	if(arr_seat.size()!=0){
	
		for(int k=0; k<arr_seat.size();k++){
				for(int i=0; i<arr_seat.get(k).length();i++){
					
					temp2= arr_seat.get(k).split(",");
				
					for(int n=0; n<temp2.length;n++){
				
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
		
		System.out.println("session="+(String)session.getAttribute("hiddenseat"));
		String nowSeat = (String)session.getAttribute("hiddenseat");
		
		for(int i=0; i<nowSeat.length()+1;i+=4){
			now_arr_seat_f.add(nowSeat.substring(i,i+3));
		}
		
		for(int i=0; i<now_arr_seat_f.size();i++){
			System.out.println(i+"=now_arr_seat_f=="+now_arr_seat_f.get(i));
		}
		

		for(int i=0; i<now_arr_seat_f.size();i++){
				for(int k=0; k<arr_seat_f.size();k++){
						if(now_arr_seat_f.get(i).equals(arr_seat_f.get(k))){
							%>
							<script type="text/javascript">
							location.href='reservation2.jsp?seat_result=false';
							</script>
							<%
				
						}else{
							System.out.println("else문");
							System.out.println("arr_seat_f.size()==="+arr_seat_f.size());
						%>
						
						<%
						}
				}
		}%>
			<script type="text/javascript">
							location.href='reservation3.jsp?seatArray2=<%=request.getParameter("seatArray")%>';
							</script> 
		<% 
	}else{
		boolean a = rdao.InputReservation((String)session.getAttribute("id"), 
						(String)session.getAttribute("date"),
						(String)session.getAttribute("movie"), 
						(String)session.getAttribute("theater") , 
						(int)session.getAttribute("room"), 
						(String)session.getAttribute("time"), 
						(String)session.getAttribute("hiddenseat") ,
						(int)session.getAttribute("general")+(int)session.getAttribute("teen") );
			System.out.println("a=="+a);
			%>
			<script type="text/javascript">
				location.href='reservation3.jsp?seatArray=<%=request.getParameter("seatArray")%>';
				</script>
			<%	
	}
}
////해당 영화 상영일 상영관의 예메된 좌석 String

else if(request.getParameter("usepoint")!=null){%>
<script type="text/javascript">
location.href='reservation3.jsp?usepoint=<%=request.getParameter("usepoint")%>';
</script>
<%}else if(request.getParameter("coupon")!=null){%>
<script type="text/javascript">
location.href='reservation3.jsp?coupon=<%=request.getParameter("coupon")%>';
</script>
<%} %>


</head>
<body>

</body>
</html>