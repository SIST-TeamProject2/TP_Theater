<%@page import="INQUIRY_BOARD.Inquiry_Board_Dto"%>
<%@page import="INQUIRY_BOARD.Inquiry_Board_Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" href="../css/Board.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js" ></script>
<script type="text/javascript">
$(function(){
	$('#cancel').click(function(){
		var id= $('#n_id').val();
		alert(id);
		location.href="Board_Inquiry_list.jsp?id="+id;
	});
});	
</script>
</head>
<%request.setCharacterEncoding("utf-8"); %>
<%
String sseq = request.getParameter("seq");
int seq = Integer.parseInt(sseq);

Inquiry_Board_Dao dao = Inquiry_Board_Dao.getInstance();
Inquiry_Board_Dto dto = dao.I_getdto(seq);
dao.Inquiry_readcount(seq);
String id = request.getParameter("id");
%>

<body>
<%request.setCharacterEncoding("utf-8"); %>
<jsp:include page="../include/header.jsp"/>
<jsp:include page="../include/nav.jsp"/>
<jsp:include page="../member/login_stat_check.jsp"/>
<div class="section_inquiry">
	<h1>문의내용</h1>
	<h2>CGV에 문의한 내용을 확인하실 수 있습니다.</h2>
	<input type="hidden" id="n_id" value="<%=id%>">
	<form action="Board_Inquiry_answer.jsp" method="post">
	<table>
	<col width="400"><col width="200px"><col width="150">
	<tr>
		<td>
			<input type="hidden" name="title" value="<%=dto.getTitle()%>">
			<input type="hidden" name="seq" value="<%=dto.getSeq()%>">
			<input type="hidden" id = "id" name="id" value="<%=dto.getId()%>"> 
			<%=dto.getTitle()%>
		</td>	
		<td>
			등록일 : <%=dto.getDate() %>
		</td>
		<td>
			조회수 : <%=dto.getRead_count() %>
		</td>
	</tr>
	<tr>
		<td colspan="3"><textarea rows="20" cols="85"><%=dto.getContent() %></textarea> </td>
	</tr>
	<tr>
		<td colspan="3" align="right">
		<%if(id.equals("admin")){ %><input type="submit" value="답변"> <%} %>										<!-- 어드민되게 수정. -->
		<button type="button" onclick="cancel()" id="cancel">목록으로</button>
	</tr>
	</table>
	</form>

	<%if(dto.getStep()!=0){ %>
		<%if(dto.getStar_count()==0) {%>
		<form action="Board_Inquiry_star_count.jsp">
		<table>
		<h2>답변이 만족스러우신가요?</h2>
		<td colspan="3">
			<input type="hidden" name="seq" value="<%=dto.getSeq()%>">
			<input type="hidden" name="id" value="<%=dto.getId()%>">
			<input type="radio" name="star_count" value="1">매우불만족
			<input type="radio" name="star_count" value="2">불만족
			<input type="radio" name="star_count" value="3" checked>보통
			<input type="radio" name="star_count" value="4">만족
			<input type="radio" name="star_count" value="5">매우만족
			<input type="submit" value="완료">
		</td>
		</table>
		</form>
		<%} %>
	<%} %>
	</div>
<jsp:include page="../include/footer.jsp"/>
<jsp:include page="../include/aside.jsp"/>	
</body>
</html>