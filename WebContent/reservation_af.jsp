<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
 <%@ page import ="db.DBConnection" %>
<%@ page import ="movie.movieDTO" %>
<%@ page import = "movie.movieDAO" %>
<%@ page import = "theater.theaterDAO" %>
<%@ page import = "theater.theaterDTO" %>
<%@ page import = "java.util.*" %>
<title>reservation_af</title>

<%
DBConnection db = DBConnection.getInstance();
	
theaterDAO tdao = theaterDAO.getInstance();
	
String name = request.getParameter("name");
List<String> tslist = tdao.selectTheater(name);
String result="";
for(int i=0; i<tslist.size();i++){
	  result+=tslist.get(i).toString()+",";
}
System.out.println("result====="+result);

if(result!=""){
%>
<script type="text/javascript">
location.href='reservation.jsp?result=<%=result%>';
</script>
<%}else{%>
<script type="text/javascript">
location.href='reservation.jsp?movie=<%=name%>';
</script>
<%
} %>





</head>
<body>

</body>
</html>