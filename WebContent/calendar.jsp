<%@page import='calendar.calendarDTO' %>
<%@page contentType="text/html; charset=UTF-8" %>
<%@page import='java.util.Calendar' %>
<%@page import='java.util.List' %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>달력</title>


</head>
<body>

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

// 요일(1 ~ 7) 1:일요일
int dayOfWeek=cal.get(Calendar.DAY_OF_WEEK);	// 6

////////////////////////////////

%>

<hr/>

<div align="center">

<table border="1">
<col width="20"/><col width="20"/><col width="20"/>
<col width="20"/><col width="20"/><col width="20"/>
<col width="20"/>
 <tr class='date'>
	<td colspan="7">

	</td>
</tr> 

<tr height="20">
	<td colspan="7" align="center">
		
		<font color="red" style="font-size:50">
			<%=String.format("%d년&nbsp;&nbsp;%d월", year, month) %>
		</font>
	
	</td>
</tr>


<tr height="20" align="center">
	<td valign="middle">일</td>
	<td>월</td>
	<td>화</td>
	<td>수</td>
	<td>목</td>
	<td>금</td>
	<td>토</td>
</tr>

<tr height="20" align="left" valign="top">

<%
for(int i = 1;i < dayOfWeek; i++){
	%>
	<td>&nbsp;</td>
	<%	
}
int lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
for(int i = 1;i <= lastDay; i++){
	%>	
	

 <td height="20" align="left" valign="top">
		<a href="calaf.jsp?=<%=i%>"><%=i%></a>
		
	</td> 
	
	<%
	if((i+dayOfWeek-1)%7==0){	// 개행
	%>
		</tr><tr height="20" align="left" valign="top">
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

</body>
</html>




