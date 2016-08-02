<%@page import="java.util.List"%>
<%@page import="theater.theaterDAO"%>
<%@page import="theater.theaterscheduleDTO"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>schedule</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
$(document).ready(function(){
    $(".date").click(function(){
        var a = $(this).val();
    	
    	alert(a);
    });
});
</script>
</head>
<body>
<%
String t_name;

if(request.getParameter("t_name")==null){
	t_name = "강남";	
	
}else{
	t_name =request.getParameter("t_name");
}
%>
<b>CGV<%=t_name %></b>
<hr>
<%!
public String two(String msg){
	String A = "";
	if(msg.length()<2){
		A = "0"+msg;
	}else{
		A = msg;
	}
	
	return A;
}

%>
<%
Calendar cal = Calendar.getInstance();

int year = cal.get(Calendar.YEAR);
int month = cal.get(Calendar.MONTH)+1;
int day = cal.get(Calendar.DAY_OF_MONTH);
int lastday = cal.getMaximum(Calendar.DAY_OF_MONTH);
int lday =cal.get(Calendar.DAY_OF_WEEK);

theaterDAO dao = theaterDAO.getInstance();

List<theaterscheduleDTO> list = dao.getschedule(t_name);
/*
exist_seat= tdao.reservation_count_people(room, movie, Integer.parseInt(request.getParameter("fnum").substring(0,1)), date);
System.out.println("exist_seat==="+exist_seat); 

int temp2=150;
int seatCount=temp2-exist_seat;

theaterDAO tdao = theaterDAO.getInstance();
 */
%>
<table border="1">
<col width="70"><col width="70"><col width="70"><col width="70"><col width="70">
<tr>
<%
	for(int i = day;i<day+5 &&i<lastday; i++){
	%>
	<td><button class="date" value="<%=i%>"><%=month %>월<b><%=two(i+"")%></b>일</button></td>
<%
	}
%>
</tr>
<%
for(int i = 0; i<list.size();i++){
%>	
	<tr><td colspan="5"><b><%=list.get(i).getTr_movie_name() %></b><br><div><%=list.get(i).getTr_time() %><br><%=list.get(i).getT_total_seat()-list.get(i).getTr_out_seat() %></div></td></tr>
<%
} 
%>
</table>
</body>
</html>