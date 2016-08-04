<%@page import="java.util.List"%>
<%@page import="theater.*"%>
<%@page import="theater.theaterDAO"%>
<%@page import="theater.theaterscheduleDTO"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%request.setCharacterEncoding("utf-8"); %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>theaters</title>
<script type="text/javascript">
$(document).ready(function(){
   $(".field").click(function(){
      num = $(this).val();
      location.href = "favorite_theaters.jsp?num="+num;
    });
    $(".f_name").click(function(){
       var t_name = $(this).val();
      <%
      String t;
      if(request.getParameter("num")==null){
         t = "1";
      }else{
         t = request.getParameter("num");   
      }
      %>
       alert(t_name);
      location.href = "favorite_theaters.jsp?num="+<%=t%>+"&t_name="+t_name;
    });
    $(".date").click(function(){
       var date = $(this).val();
       alert(date);
       <%
      String a;
      if(request.getParameter("num")==null){
         a = "1";
      }else{
         a = request.getParameter("num");   
      }
      String b ="";
      if(request.getParameter("t_name")==null){
         if(a.equals("1")){
            b = "강남";
         }
         if(a.equals("2")){
            b = "김포";
         }
         if(a.equals("3")){
            b = "계양";
         }
         
      }else{
         b = request.getParameter("t_name");   
      }
      %>
      
      location.href = "favorite_theaters.jsp?key=1&num=<%=a%>&t_name=<%=b%>&date="+date;       
    });
    
});
</script>
</head>
<body>
<%
String num; 
if(request.getParameter("num")==null){
 num = "1";
}else{
   num = request.getParameter("num");
}
%>

<%
theaterDAO dao = theaterDAO.getInstance();
List<theaterDTO> list = dao.fieldlist(num);
%>

<div>
<table border="1">
<tr>
<td>cgv</td>
<!-- <td><button>1</button><button>2</button><button>3</button><button>4</button><button>5</button></td>
<td><button>+</button></td> -->
</tr>
<tr>
<td colspan="3" align="center">
<button class="field" value="1">서울</button>
<button class="field" value="2">경기</button>
<button class="field" value="3">인천</button>
</td>
</tr>
<tr>
<td colspan="<%=list.size()%>">
<%
for(int i=0;i<list.size();i++){
if(i!=0&&i%5==0){ %>
<br>
   <% } %>
<button class="f_name" value="<%=list.get(i).getT_name()%>"><%=list.get(i).getT_name() %></button>
<%   } %>
</td>
</tr>
</table>
<br>
<br>
<%
String t_name; 
if(request.getParameter("t_name")==null){
   t_name = "강남";
   
}else{
   t_name = request.getParameter("t_name");
}

if(num.equals("2")){
   if(request.getParameter("t_name")==null){
      t_name = "김포";
      
   }else{
      t_name = request.getParameter("t_name");
   }
}else if(num.equals("3")){
   if(request.getParameter("t_name")==null){
      t_name = "계양";
      
   }else{
      t_name = request.getParameter("t_name");
   }
}

%>
<div>
<%

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
%>
<!-- 요일선택 -->
</div>
<div>
<%
int date;
if(day+5 >lastday){
date = lastday;
}else{
   date =day+5;
}
%>
<table border="1">
<tr>
<%
   for(int i = day;i<date ;i++){
%>
   <td><button class="date" value="<%=year%>.<%=two(month+"")%>.<%=two(i+"")%>"><%=two(month+"") %>월<%=two(i+"") %>일</button></td>      
<%
   }
%>
</tr>
<%
String key ="";
if(request.getParameter("key")==null){
   key = "0";
   
}else{
   key = request.getParameter("key");
}

if(key.equals("1")){
   String sdate = "";
   if(request.getParameter("date")==null){
      sdate = year+"."+two(month+"")+"."+two(day+"");
      
   }else{
      sdate = request.getParameter("date");
   }
   
   
   List<theaterscheduleDTO> llist = dao.getschedule(t_name, sdate);
%>

<%for(int i=0;i<llist.size();i++){
   int outcount = dao.reservation_count_people(llist.get(i).getTr_movie_name(), sdate,t_name);
   %>
<tr>

<td colspan="<%=date%>"><%=llist.get(i).getTr_movie_name() %><br><%=150-outcount %>/150</td>
</tr>
<%} %>

<% } %>
</table>
</div>
</body>
</html>