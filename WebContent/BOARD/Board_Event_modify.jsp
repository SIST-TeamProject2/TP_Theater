<%@page import="member.memberDTO"%>
<%@page import="EVENT_BOARD.Event_Board_Dto"%>
<%@page import="EVENT_BOARD.Event_Board_Dao"%>
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
		var filename_r = $('#filename_r').val();
		var seq=$('#seq').val();
		var id= $('#id').val();
		alert("여기 오면 좀 떠라");
		alert("filename"+filename);
		alert("filename_r"+filename_r);
		alert(content);
		alert("seq = "+seq);
		if(filename_r=="a"){
			location.href="Board_Event_modifyAf.jsp?id="+id+"&title="+title+"&content="+content+"&category="+category+"&filename="+filename+"&seq="+seq;
		}else{
			location.href="Board_Event_modifyAf.jsp?id="+id+"&title="+title+"&content="+content+"&category="+category+"&filename="+filename_r+"&seq="+seq;	
		}
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

<%
String sseq = request.getParameter("seq"); 
int seq = Integer.parseInt(sseq);

Event_Board_Dao dao = Event_Board_Dao.getInstance();
Event_Board_Dto dto = dao.getDTO(seq); %>
	<%	
		String filename_r = request.getParameter("filename_r");

		String id = request.getParameter("id");										/* 글쓴이아이디 */
		String category=request.getParameter("category");
		String title = request.getParameter("title");
		String content = request.getParameter("content").replaceAll("<br>", "\r\n");
		String filename = request.getParameter("filename");
	%>
	<form name="test2" action="Board_Event_modify_poto.jsp" method="post" enctype="multipart/form-data">
		<input type="hidden" id="filename_r" name="filename_r" value="<%=filename_r%>">
		<input type="hidden" id="seq" name = "seq" value="<%=seq %>">
		<table>
			<col width="50" /><col width="550" /><col width="50" />
			<tr>
				<td>아이디</td>
				<td colspan="2"><%=id %> <input type="hidden" id="id" name="id" value="<%=id%>"></td>
			</tr>
			<tr>
				<td>제목</td>
				<td colspan="2">
					<select id="category">
							<option value="02" selected="selected"><%="[응모]"%></option>
							<option value="03"><%="[기타]"%></option>
					</select>
					<input type="text" id="title" name="title" size="60" value="<%=title%>">
				</td>
			</tr>
			<%if(!filename_r.equals("a")){%>
			<tr>
				<td colspan="3">
					<img src="../../../../../upload/<%=filename_r%>" width=505 height=384></img>
				</td>
			</tr>
			<%}else{%>	
			<tr>
				<td colspan="3">
					<img src="../../../../../upload/<%=filename%>" width=505 height=384></img>
				</td>
			</tr>
			<%} %>	
			<tr>
				<td colspan="3"><textarea rows="20" cols="60" name="content" id="content"><%=content%></textarea></td>
			</tr>
	</table>
	<table>
		<tr align="center">
				<%if(filename!=null) {%>
					<td><%=filename %></td>
					<input type="hidden" id=filename value="<%=filename%>">
				<%}else{%>
				<td colspan="2"><input type="file" name="fileload" style="width: 400px;" value="dfasdf" accept=".jpg, .jpeg, .gif, .png"></td>
				<%} %>
				<%if(filename==null){ %>
				<td><input type="submit" value="업로드" > </td>
				<%}%>
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