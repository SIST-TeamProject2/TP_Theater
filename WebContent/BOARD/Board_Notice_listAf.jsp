<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%request.setCharacterEncoding("utf-8"); %>
	<%
		String category = request.getParameter("category");
	%>

	<%if(category.equals("[전체]")){ %>
		<script type="text/javascript">
		location.href = "Board_Notice_list.jsp"
		</script>
	<%}else if(category.equals("[긴급점검]")){ %>
		<script type="text/javascript">
		location.href = "Board_Notice_list.jsp?category=[긴급점검]"
		</script>
	<%}else if(category.equals("[극장]")){ %>
		<script type="text/javascript">
		location.href = "Board_Notice_list.jsp?category=[극장]"
		</script>
	<%}else if(category.equals("[기타]")){ %>
		<script type="text/javascript">
		location.href = "Board_Notice_list.jsp?category=[기타]"
		</script>
	<%}%>
</body>
</html>