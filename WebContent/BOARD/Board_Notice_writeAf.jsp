<%@page import="NOTICE_BOARD.Notice_Board_Dao"%>
<%@page import="NOTICE_BOARD.Notice_Board_Dto"%>
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
	String id = request.getParameter("id");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String category = request.getParameter("category");
	
	Notice_Board_Dao dao = Notice_Board_Dao.getInstance();

	if(title.equals("")){%>
		<script type="text/javascript">
		alert("제목을 입력해주세요.")
		location.href="Board_Notice_list.jsp?id=<%=id%>";
		</script>	
	<%}else if(content.equals("")){%>
		<script type="text/javascript">
		alert("내용을 입력해주세요.")
		location.href="Board_Notice_list.jsp?id=<%=id%>";
		</script>	
	<%}else{
	boolean isS = dao.writeN_Board(new Notice_Board_Dto(id, category, title, content));
	if(isS){ %>
		<script type="text/javascript">
		alert("작성완료");
		location.href="Board_Notice_list.jsp";
		</script>
	<%}else{ %>
		<script type="text/javascript">
		alert("작성실패");
		location.href="Board_Notice_list.jsp";
		</script>
	<%}
	}
	%>
	
</body>
</html>