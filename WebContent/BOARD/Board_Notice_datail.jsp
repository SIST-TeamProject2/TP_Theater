
<%@page import="member.memberDTO"%>
<%@page import="NOTICE_BOARD.Notice_Board_Dto"%>
<%@page import="NOTICE_BOARD.Notice_Board_Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" href="../css/Board.css">

</head>
<body>
<jsp:include page="../include/header.jsp"/>
<jsp:include page="../include/nav.jsp"/>
<%request.setCharacterEncoding("utf-8"); %>
<div class="section_notice">
<%
String id="";
memberDTO mdto = (memberDTO) session.getAttribute("loginMember");
if(mdto!=null){id = mdto.getId();} 
%>
<%
String sseq = request.getParameter("seq");
int seq = Integer.parseInt(sseq);

Notice_Board_Dao dao = Notice_Board_Dao.getInstance();
Notice_Board_Dto dto = dao.get_Bdto(seq);
dao.Notice_readCount(seq);
%>

<div>
	<h2>공지/뉴스</h2>
	<h3>CGV의 주요한 이슈 및 여러가지 소식들을 확인하실 수 있습니다.</h3>
	<br><br>
	<table>
	<col width="100"><col width="200"><col width="200"><col width="100">
		<tr>
			<td><%=dto.getCategory() %></td>
			<td><%=dto.getTitle() %></td>
			<td>등록일 : <%=dto.getDate().toString().substring(0, 10) %></td>
			<td>조회수 : <%=dto.getRead_count() %></td>
		</tr>
		<tr>
			<td colspan="4"><textarea rows="20" cols="70" readonly="readonly"><%=dto.getContent() %></textarea> </td>
		</tr>
		
		<tr>
			<td colspan="4" align="right">
			<%if(id.equals("admin")) {%>
			<a href="Board_Notice_del.jsp?seq=<%=seq%>"><button>삭제</button></a>
			<a href="Board_Notice_modify.jsp?id=<%=dto.getId() %>&seq=<%=seq%>&title=<%=dto.getTitle()%>
			&content=<%=dto.getContent()%>&date=<%=dto.getDate()%>"><button>수정</button></a>
			<%} %>
			<a href="Board_Notice_list.jsp"><button>목록</button></a>
			</td>
		</tr>
	</table>
	
</div>
</div>
<jsp:include page="../include/footer.jsp"/>
<jsp:include page="../include/aside.jsp"/>
</body>
</html>