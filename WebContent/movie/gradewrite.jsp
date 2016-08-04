<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<%@ page import = "member.memberDTO" %>

<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		//영화 번호 시퀀스
		String sseq = request.getParameter("seq");
		int seq = Integer.parseInt(sseq);

		//아이디
		memberDTO mdto = (memberDTO) session.getAttribute("loginMember");
		String id = mdto.getId();
		/* String id = request.getParameter("id"); */
		
		//영화이름
		String title = request.getParameter("title");
		
		// 평점에서 작성된 글을 보내주기위해
		String pagekey="";
		if(request.getParameter("pagekey")==null){
			
		}else{
			pagekey = request.getParameter("pagekey");
		}
		String num="";
		if(request.getParameter("num")==null){
			num= "1";
		}else{
			num = request.getParameter("num");
		}
	%>
	
	
	<form action="gradewriteAf.jsp?seq=<%=seq%>&id=<%=id%>&title=<%=title%>&pagekey=<%=pagekey%>&num=<%=num %>" method="post">
		평점작성
		<table>
			<tr>
				<td><textarea id="c" name="Content" cols="70" rows="5" placeholder="운영원칙에 어긋나는 게시물로 판단되는 글은 제재 조치를 받을 수 있습니다."></textarea></td>
			</tr>
			<tr>
				<td align="right"><input type="submit" value="등록" onclick=""></td>
			</tr>
		</table>
	</form>
</body>
</html>