<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import= "member.memberDAO" %>
        <%@ page import= "coupon.couponDAO" %>
          <%@ page import= "coupon.couponDTO" %>
            <%@ page import= "java.util.*" %>
            <%@ page import = "reservation.reservationDAO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>결제창</title>


<%!
int account_money=0;
int usepoint=0;
int usecoupon=0;
String coupon="";
int point=0;
%>
<%
String seatString="";
String temp[] = new String[50];
if(request.getParameter("seatArray")!=null){
	
	String seat = request.getParameter("seatArray");
//	session.setAttribute("hiddenseat", seat);//출력용아님  db저장용
	reservationDAO rdao = reservationDAO.getInstance();
	
	/* boolean a = rdao.InputReservation((String)session.getAttribute("id"), 
			(String)session.getAttribute("date"),
			(String)session.getAttribute("movie"), 
			(String)session.getAttribute("theater") , 
			(int)session.getAttribute("room"), 
			(String)session.getAttribute("time"), 
			(String)session.getAttribute("hiddenseat") ,
			(int)session.getAttribute("general")+(int)session.getAttribute("teen") );
System.out.println("a=="+a); */

	
	
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
	
	
/* 	int seq=rdao.get_reservation_seq((String)session.getAttribute("id"), (String)session.getAttribute("date"), (String)session.getAttribute("movie"),(String)session.getAttribute("hiddenseat"));
	System.out.println("seq==="+seq);
 */
}
memberDAO mdao = memberDAO.getInstance();
session.getAttribute("id");


couponDAO cdao = couponDAO.getInstance();
List<couponDTO> carr = new ArrayList<couponDTO>();
carr = cdao.getCoupon((String)session.getAttribute("id"));


%>

<%
if(request.getParameter("btn3")!=null){
	account_money=0;
	usepoint=0;
	usecoupon=0;
	coupon="";
	point= mdao.getPoint((String)session.getAttribute("id"));
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
<%
if(request.getParameter("coupon")==null){
	point = mdao.getPoint((String)session.getAttribute("id"));
}
if(request.getParameter("usepoint")!=null){
				%>
				<script type="text/javascript">
				alert('<%=usepoint%>');
				</script>
				<%
					if(Integer.parseInt(request.getParameter("usepoint"))<point){
						usepoint = Integer.parseInt(request.getParameter("usepoint"));
						point=point-usepoint;
					}else if(Integer.parseInt(request.getParameter("usepoint"))>account_money){
						usepoint=account_money;
					}else{%>
						<script type="text/javascript">
						alert("포인트가 모자랍니다.");
						</script>
						<%
						usepoint=0;
					}
}
%>
</head>
<body><input type="button" value="Reset" onclick="location.href='reservation_af.jsp?btn3=btn3'"/>

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
	<td colspan="2">쿠  폰 (※쿠폰중복사용불가)</td>
</tr>

<tr>
	<td>현재 보유 포인트 : </td>
	<td><%=point%></td>
	
	
	<td rowspan="2">
<select onchange="location.href='reservation_af.jsp?coupon='+this.value">
<option >쿠폰선택</option>
<%for(int i=0; i<carr.size();i++){ %>
<option value="<%=carr.get(i).getDiscount_price()%>"><%=carr.get(i).getSerial()%></option>
<%} %>
</select>
<br>
<%
if(request.getParameter("coupon")!=null){
	usecoupon = Integer.parseInt(request.getParameter("coupon"));

	System.out.println("usecoupon=="+usecoupon);
	System.out.println("carr.size()=="+carr.size());
	for(int i=0; i<carr.size();i++){
		System.out.println(carr.get(i).getDiscount_price());
	 if(usecoupon==(carr.get(i).getDiscount_price())){
		 out.println("-------------------------");%><br><%
		 out.println(carr.get(i).getSerial()+"쿠폰 사용");
		}
	}
	
}else{
	usecoupon=0;
}
%>

</td>
	</tr>
	<tr>
	<td >사용할 포인트 : </td>
	<td><input type="text" name="usepoint" size="5" value="0">p <input type="submit" value="사용"/>
	<br>
			 <%out.println("-------------------------");%><br><%=usepoint+"p사용"%>
	</td>
	
</tr>
</table>
</form>
<table border="1" width=80%>
<tr>
<td>할인 전 결제 금액 : </td>
<%
if(request.getParameter("usepoint")==null&&request.getParameter("coupon")==null){
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
}else{

}

%>
<td><%=account_money%>원</td>
</tr>



<tr>
<td>할인 금액 : </td>

<td>-<%=usepoint+usecoupon%>원</td>
</tr>

<tr>
<td>할인 후 총 결제 금액 : </td>
<%
int fresult = account_money-usepoint-usecoupon;
if(fresult<0){
	fresult=0;
}
else{
	fresult=account_money-usepoint-usecoupon;
}
%>
<td><%=fresult%>원</td>
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

<input type="submit" value="결제완료" onclick="location.href='reservation4.jsp?total=<%=account_money-usepoint-usecoupon%>';" />
</body>
</html>