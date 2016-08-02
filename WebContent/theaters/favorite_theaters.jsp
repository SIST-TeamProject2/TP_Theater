<%@page import="java.util.List"%>
<%@page import="theater.*"%>

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
	if(i!=0&&i%5==0){%>
		<br>
	<%}
%>
<button class="f_name" value="<%=list.get(i).getT_name()%>"><%=list.get(i).getT_name() %></button>
<%	
} 
%>
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
<jsp:include page="theaters_schedule.jsp">
<jsp:param value="<%=num %>" name="num"/>
<jsp:param value="<%=t_name %>" name="t_name"/>
</jsp:include>
</div>
</body>
</html>