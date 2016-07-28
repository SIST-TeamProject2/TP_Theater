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
<%}else if(request.getParameter("fnum")!=null){%>
<script type="text/javascript">
location.href='reservation.jsp?fnum=<%=request.getParameter("fnum")%>';
</script>
<%}else if(request.getParameter("twoinfo")!=null){%>
<script type="text/javascript">
location.href='reservation2.jsp?fnum=<%=request.getParameter("twoinfo")%>';
</script>
<%} %> 


</head>
<body>

</body>
</html>