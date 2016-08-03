<%@page import="java.util.List"%>
<%@page import="movie.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
 <body>
<%	

 	String sseq = request.getParameter("mv_seq");
	int seq = Integer.parseInt(sseq); 
	
	List<moviereviewDTO> list = movieDAO.INSTANCE.comentlist(seq);
	
	int total = list.size();
	int size = list.size();
	int size2 = size;
	
	final int ROWSIZE = 10;
	final int BLOCK = 5;
	int indent = 0;

	int pg = 1;
	
	if(request.getParameter("pg")!=null) {
		pg = Integer.parseInt(request.getParameter("pg"));
	}
	
	int end = (pg*ROWSIZE);
	
	int allPage = 0;

	int startPage = ((pg-1)/BLOCK*BLOCK)+1;
	int endPage = ((pg-1)/BLOCK*BLOCK)+BLOCK;
	
	allPage = (int)Math.ceil(total/(double)ROWSIZE);
	
	if(endPage > allPage) {
		endPage = allPage;
	}
	
	size2 -=end;
	if(size2 < 0) {
		end = size;
	}
	if(total > 0){
%>
<table border="1">
<col width="250"><col width="250">

<!-- 여기서 포문을 돌리자 -->
<tr>
<%	
int a = 0;
if((ROWSIZE*pg)>total){
	 a = total;
}else{
	 a = ROWSIZE*pg;
}

for(int i=(ROWSIZE*pg)-10;i<a;i++){ %>

<td><%=list.get(i).getMvr_id() %><br><%=list.get(i).getMvr_content() %></td>	
<% if(i%2==1){%>
</tr><tr>
<%}%>

<%} %>
</tr>

</table>

<%}else{ %>
작성된 평가가 없습니다.
<%} %>
<table width="100%" cellpadding="0" cellspacing="0" border="0" style="margin-top: 0px;padding-top: 0px;">
  <tr><td colspan="2"></td></tr>
  <tr>
	<td  align="center" >
		<%
			for(int i=startPage; i<= endPage; i++){
				if(i==pg){
		%>
					<u><b>[<%=i %>]</b></u>
		<%
				}else{
		%>
					[<a href="grade.jsp?pg=<%=i %>&seq=<%=seq%>"><%=i %></a>]
		<%
				}
			}
		%>
	
		</td>
		</tr>
	
 </table>
 </body>
</html>