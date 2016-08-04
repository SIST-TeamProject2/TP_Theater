<%@page import="member.memberDTO"%>
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
	$('#success').click(function(){
		var category = $("#category option:selected").text();
		var title = $('#title').val();
		var content = $('#content').val().replace(/\n/g, '<br>');
		var filename = $('#filename').val();
		var id= $('#id').val();
		alert(content);

		location.href="Board_Event_writeaf.jsp?id="+id+"&title="+title+"&content="+content+"&category="+category+"&filename="+filename;
	});
});	

</script>
</head>
<body>
<%request.setCharacterEncoding("utf-8"); %>
<jsp:include page="../include/header.jsp"/>
<jsp:include page="../include/nav.jsp"/>
	<jsp:include page="../member/login_stat_check.jsp"/>
<div class="section_event">	
<h1>이벤트게시판</h1>
<h2>CGV에 뽐낼 사진을 올려보세요.</h2>
	<%memberDTO mdto = (memberDTO) session.getAttribute("loginMember");
	String id = "";
	if(mdto!=null){id=mdto.getId();}
	%>
	<%	
		String category=request.getParameter("category");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String filename = request.getParameter("filename");
		
		if(title==null){
			title="";
		}
		if(content==null){
			content="";
		}
	%>	
	<form name="test2" action="Board_Event_write_poto.jsp" method="post" enctype="multipart/form-data">
		<input type="hidden" id="filename" name="filename" value="<%=filename%>">
		<table class="tlb_eve_write">
			<col width="50" /><col width="550" /><col width="50" />
			<tr>
				<td class="eve_write_padding" colspan="3">아이디 : <%=id %><input type="hidden" id="id" name="id" value="<%=id%>"></td>
			</tr>
			<tr>
				<td colspan="3" class="eve_write_padding">
				제목 : 
				<select id="category">
							<option value="02"><%="[응모]"%></option>
							<option value="03"><%="[기타]"%></option>
				</select>
				<input type="text" id="title" name="title" size="60" value="<%=title%>">
				</td>
			</tr>
			<%if(filename!=null){%>
			<tr>
				<td colspan="3" align="center">
				
				<img src="../../../../../upload/<%=filename%>" width=505 height=384></img>
				<td>
			</tr>
			<%}%>
			<tr>
				<td colspan="3"  align="center"><textarea rows="20" cols="60" name="content" id="content"><%=content%></textarea></td>
			</tr>
	</table>
	<table class="tlb_eve_write">
		<tr align="center">
				<%if(filename!=null) {%>
					<td><%=filename %></td>
				<%}else{%>
				<td colspan="2"><input type="file" name="fileload" style="width: 400px;" value="dfasdf" accept=".jpg, .jpeg, .gif, .png">
				<%} %>
				<%if(filename==null){ %>
				<input type="submit" value="업로드" > 
				<%} %>
				</td>
			</tr>
	</table>
	</form>
	<a class="success" id="success" onclick="success()">완료</a>
	<a href="Board_Event_list.jsp">취소</a>
	</div>
<jsp:include page="../include/footer.jsp"/>
<jsp:include page="../include/aside.jsp"/>	
</body>
</html>