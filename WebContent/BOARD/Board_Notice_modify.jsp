<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" href="../css/Board.css">
<script type="text/javascript">
function cancel() {
	location.href="Board_Notice_list.jsp?category=[전체]";
}
</script>

</head>
<body>
<%request.setCharacterEncoding("utf-8"); %>
<jsp:include page="../include/header.jsp"/>
<jsp:include page="../include/nav.jsp"/>
<div class="section_notice">
	<%
	String sseq = request.getParameter("seq");
	
	int seq = Integer.parseInt(sseq);
	String id = request.getParameter("id");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String date = request.getParameter("date");
	%>
	<div>
	<form action="Board_Notice_modifyAf.jsp" method="post">
	<input type="hidden" name="seq" value="<%=seq%>">
	<input type="hidden" name="id" value="<%=id%>">
		<table>
		<col width="50"><col width="50"><col width="400">
		<tr>
			<td>제목</td>
			<td>
			<select name="category">
				<option value="[긴급점검]">[긴급점검]</option>
				<option value="[극장]">[극장]</option>
				<option value="[기타]">[기타]</option>
			</select>
			<input size="50" type="text" name="title" value="<%=title%>"></td>
		</tr>
		<tr>
			<td>작성자</td>
			<td colspan="2"><%=id %></td>
		</tr>
		<tr>
			<td>내용</td>
			<td colspan="2"><textarea rows="20" cols="50" name = "content"><%=content %></textarea></td>
		</tr>
		<tr>
			<td colspan="3" align="right"><input type="submit" value="완료">
			<button type="button" onclick="cancel()">취소</button> </td>
		</tr>
		</table>
	</form>
	</div>
	</div>
<jsp:include page="../include/footer.jsp"/>
<jsp:include page="../include/aside.jsp"/>
</body>
</html>