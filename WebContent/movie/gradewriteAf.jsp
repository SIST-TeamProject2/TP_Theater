<%@page import="movie.movieDAO"%>
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
// 평점에서 작성한 내용 전달
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

//영화 번호 시퀀스
String sseq = request.getParameter("seq");
int seq = Integer.parseInt(sseq);

//아이디
String id = request.getParameter("id");

//영화이름
String title = request.getParameter("title");

//내용
String Content = request.getParameter("Content").replace("\r\n","<br>");
//다오에서  입력한적이 있는지 유무 확인
boolean isS = movieDAO.INSTANCE.reviewfind(seq, id);
if(isS){%>
	<script type="text/javascript">
		alert("이미 작성하신 글이 있습니다.");
		history.go(-1);
	</script>
	
<%	
}else{
%>
<script type="text/javascript">
	<%-- location.href ="gradewriteAf_Af.jsp?seq=<%=seq%>&id=<%=id%>&title=<%=title%>&Content=<%=Content%>"; --%>
	location.href ="gradewriteAf_Af.jsp?seq=<%=seq%>&id=<%=id%>&title=<%=title%>&Content=<%=Content%>&pagekey=<%=pagekey%>&num=<%=num%>";
</script>
<%	
}
%>


</body>
</html>