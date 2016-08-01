<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>결제창</title>
<%!
int account_money=0;
int usepoint=0;
String coupon="";
%>
<%
String seatString="";
String temp[] = new String[50];
if(request.getParameter("seatArray")!=null){
	String seat = request.getParameter("seatArray");
	String seatArr[] = new String[seat.length()/2];
	temp=seat.split(",");
	
	for(int i=0; i<temp.length;i+=2){
		seatArr[i]=temp[i]+"열 "+temp[i+1]+". ";
	
	}
	for(int i=0; i<seatArr.length;i+=2){
		System.out.println(i+"===="+seatArr[i]);
		seatString+=seatArr[i];
	}
	///짝수i에 값있음!!
	
	session.setAttribute("seat",seatString);
	System.out.println("*******");
	System.out.println(session.getAttribute("seat"));
}
%>
<script type="text/javascript">
function payMethod(){
 	
	
	num_temp = document.all.pay.length; 
	
	 for (i=0;i<num_temp ;i++) 
	 { 
	  if (document.all.pay[i].checked == true) 
	  { 
	  	if(pay[i].value=="card"||pay[i].value=="phone"){
	  		alert("현재 점검중입니다. 다른결제수단을 선택하세요^^");
	  	}
	  break;
	  } 
	 } 
	 if (i == num_temp) 
	 { 
	  alert("하나를 선택하세요"); 
	 }  
}
</script>

</head>
<body>
<table border="1" width=80%>

<tr>
<td>영화제목 : </td>
<td><%=session.getAttribute("movie") %></td>
</tr>

<tr>
<td>영화관 : </td>
<td><%=session.getAttribute("theater") %> &nbsp;&nbsp;&nbsp;<%=session.getAttribute("room") %>관</td>
</tr>
<tr>
<td>상영일 : </td>
<td><%=session.getAttribute("date") %></td>
</tr>

<tr>
<td>시간 : </td>
<td><%=session.getAttribute("time") %></td>
</tr>

<tr>
<td>인원 : </td>
<td>성인 : <%=session.getAttribute("general") %>명, 청소년 : <%=session.getAttribute("teen") %>명</td>
</tr>

<tr>
<td>좌석 : </td>
<td><%=session.getAttribute("seat") %></td>
</tr>


</table>

<form name = point method="get" action="reservation_af.jsp">
<table border="1" width=80%>
<tr>
	<td colspan="2">포인트</td>
	<td colspan="2">쿠  폰</td>
</tr>

<tr>
	<td>현재 보유 포인트 : </td>
	<td><input type="text" name="point" size="2" readonly="readonly">p</td>
	
	
	<td rowspan="2">
<select onchange="location.href='reservation_af.jsp?coupon='+this.value">
<option >쿠폰선택</option>
<option value="2000">영화할인권(2000원)</option>
<option value="8000">매점할인권(8000원)</option>
</select>
<br>
<%
if(request.getParameter("coupon")!=null){
	coupon = request.getParameter("coupon");
}
if(coupon.equals("")){
}
else{
	out.println(coupon+"사용");
}
%>

</td>
	</tr>
	<tr>
	<td >사용할 포인트 : </td>
	<td><input type="text" name="usepoint" size="2">p   (1000p=1000원)<input type="submit" value="사용"/></td>
	
</tr>
</table>
</form>
<table border="1" width=80%>
<tr>
<td>결제 금액 : </td>
<%
int adult=0;
int teen=0;
if(((int)session.getAttribute("general"))>0){
	adult = ((int)session.getAttribute("general"))*9000;
	account_money+=adult;
}else{
	adult=0;
}
if(((int)session.getAttribute("teen"))>0){
	teen = ((int)session.getAttribute("teen"))*8000;
	account_money+=teen;
}else{
	adult=0;
}

%>
<td><%=account_money%>원</td>
</tr>
<%
if(request.getParameter("usepoint")!=null){
	usepoint = Integer.parseInt(request.getParameter("usepoint"));
}

%>
<tr>
<td>할인 금액 : </td>
<td>-<%=usepoint%>원</td>
</tr>

<tr>
<td>할인 후 총 결제 금액 : </td>
<td><%=account_money-usepoint %>원</td>
</tr>

<tr>
<td>결제 수단</td>
<td>
<input type="radio" name="pay" value="bank"  checked="checked" onclick="payMethod()">무통장입금
<input type="radio" name="pay" value="card" onclick="payMethod()">신용/체크카드
<input type="radio" name="pay" value="phone" onclick="payMethod()">휴대폰결제
</td>
</tr>
</table>

<script type="text/javascript">
function nextP(){

}
</script>

<input type="submit" value="결제완료" onclick="location.href='reservation4.jsp?total=<%=account_money-usepoint %>';" />
</body>
</html>