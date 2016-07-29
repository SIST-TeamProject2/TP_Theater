<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
String id = request.getParameter("id");

//영화이름
String title = request.getParameter("title");
%>
<form action="gradewriteAf_Af.jsp?seq=<%=seq%>&id=<%=id%>&title=<%=title%>" method="post">
<caption>평점작성</caption>
<table>
<tr><td><%=title %></td></tr>
<tr><td><%=id %></td></tr>
<tr><td><textarea name="Content" cols="70" rows="2" maxlength="140" placeholder="운영원칙에 어긋나는 게시물로 판단되는 글은 제재 조치를 받을 수 있습니다."></textarea></td></tr>
<tr><td><input type="submit" value="등록"></td></tr>
</table>
</form>
</body>
</html>