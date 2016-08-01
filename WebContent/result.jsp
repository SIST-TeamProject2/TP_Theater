<%@ page contentType = "text/html; charset = utf-8" %>
<%
request.setCharacterEncoding("utf-8");
String name = request.getParameter("name");
String lives = request.getParameter("lives");
String habby = request.getParameter("habby");
%>
<!DOCTYPE html>
<head>
<meta charset = "utf-8">
<title>값 받는 부분</title>
</head>
<body>
<br>
<table border = "1" align = "center">
<tr>
<td><%=name%></td>
</tr>
<tr>
<td><%=lives%></td>
</tr>
<tr>
<td><%=habby%></td>
</tr>
</table>
</body>
</html>