<%@page import="member.memberDTO"%>
<%@page import="java.util.List"%>
<%@page import="INQUIRY_BOARD.Inquiry_Board_Dao"%>
<%@page import="INQUIRY_BOARD.Inquiry_Board_Dto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel = "stylesheet" href="../css/Board.css">
<script type="text/javascript">

</script>
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../include/header.jsp"/>
<jsp:include page="../include/nav.jsp"/>
<jsp:include page="../member/login_stat_check.jsp"/>
<div class="section_inquiry">
<%request.setCharacterEncoding("utf-8"); %>

<%!public String arrow(int depth){
	String rs="<img src='../image/arrow.png' width='20px' height='20px'/>";	
	String nbsp="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
	String ts="";								
	
	for(int i = 0; i < depth; i++){	
		ts +=nbsp;
	}
	return depth==0?"":ts+rs;
}
%>
	<%
	memberDTO mdto = (memberDTO) session.getAttribute("loginMember");
	String id = "a";
	if(mdto!=null){id=mdto.getId();}
	
	Inquiry_Board_Dao dao = Inquiry_Board_Dao.getInstance(); 
	List<Inquiry_Board_Dto> I_list = dao.Inquiry_list(id);
	%>
	
	<%!public Integer toInt(String x) {
	int a = 0;
	try {
		a = Integer.parseInt(x);
	} catch (Exception e) {
	}
	return a;
	}%>

	
	<div id="middle_wrap">
		<table class="tbl_board">
			<col width="50"><col width="300"><col width="150"><col width="100"><col width="100">
			<tr>
			<th>번호</th>
			<th>문의제목</th>
			<th>작성일</th>
			<th>조회수</th>
			<th>만족도</th>
			</tr>
			<!-- 잠깐 스탑 여기서 review dto,dao 만들어서 불러야될듯 -->
			<%
			Inquiry_Board_Dao I_dao = Inquiry_Board_Dao.getInstance();
				List<Inquiry_Board_Dto> reList = I_dao.Inquiry_list(id);

				request.setAttribute("reList", reList);

				int pageno = toInt(request.getParameter("pageno"));
				if (pageno < 1) {//현재 페이지
					pageno = 1;
				}
				int total_record = reList.size(); //총 레코드 수
				int page_per_record_cnt = 10; //페이지 당 레코드 수
				int group_per_page_cnt = 10; //페이지 당 보여줄 번호 수[1],[2],[3],[4],[5]
				//                                                    [6],[7],[8],[9],[10]
				int record_end_no = pageno * page_per_record_cnt;
				int record_start_no = record_end_no - (page_per_record_cnt);
				if (record_end_no > total_record) {
					record_end_no = total_record;
				}
				int total_page = total_record / page_per_record_cnt + (total_record % page_per_record_cnt > 0 ? 1 : 0);
				if (pageno > total_page) {
					pageno = total_page;
				}

				//          현재 페이지(정수) / 한페이지 당 보여줄 페지 번호 수(정수) + (그룹 번호는 현제 페이지(정수) % 한페이지 당 보여줄 페지 번호 수(정수)>0 ? 1 : 0)
				int group_no = pageno / group_per_page_cnt + (pageno % group_per_page_cnt > 0 ? 1 : 0);
				//            현재 그룹번호 = 현재페이지 / 페이지당 보여줄 번호수 (현재 페이지 % 페이지당 보여줄 번호 수 >0 ? 1:0)   
				//   ex)    14      =   13(몫)      =    (66 / 5)      1   (1(나머지) =66 % 5)           

				int page_eno = group_no * group_per_page_cnt;
				//            현재 그룹 끝 번호 = 현재 그룹번호 * 페이지당 보여줄 번호 
				//   ex)    70      =   14   *   5
				int page_sno = page_eno - (group_per_page_cnt - 1);
				//             현재 그룹 시작 번호 = 현재 그룹 끝 번호 - (페이지당 보여줄 번호 수 -1)
				//   ex)    66   =   70 -    4 (5 -1)

				if (page_eno > total_page) {
					//            현재 그룹 끝 번호가 전체페이지 수 보다 클 경우      
					page_eno = total_page;
					//            현재 그룹 끝 번호와 = 전체페이지 수를 같게
				}

				int prev_pageno = page_sno - group_per_page_cnt; // <<  *[이전]* [21],[22],[23]... [30] [다음]  >>
				//            이전 페이지 번호   = 현재 그룹 시작 번호 - 페이지당 보여줄 번호수   
				//   ex)      46      =   51 - 5            
				int next_pageno = page_sno + group_per_page_cnt; // <<  [이전] [21],[22],[23]... [30] *[다음]*  >>
				//            다음 페이지 번호 = 현재 그룹 시작 번호 + 페이지당 보여줄 번호수
				//   ex)      56      =   51 - 5
				if (prev_pageno < 1) {
					//            이전 페이지 번호가 1보다 작을 경우      
					prev_pageno = 1;
					//            이전 페이지를 1로
				}
				if (next_pageno > total_page) {
					//            다음 페이지보다 전체페이지 수보가 클경우      
					next_pageno = total_page / group_per_page_cnt * group_per_page_cnt + 1;
					//            next_pageno=total_page
					//            다음 페이지 = 전체페이지수 / 페이지당 보여줄 번호수 * 페이지당 보여줄 번호수 + 1 
					//   ex)            =    76 / 5 * 5 + 1   ????????       
				}

				// [1][2][3].[10]
				// [11][12]
			%>
			<%
				if (reList.size() == 0) {
			%>
			<tr>
				<td colspan="6">등록된 게시글이 없습니다.</td>
			</tr>
			<%
				}
			%>
			<%
				for (int i = record_start_no; i < record_start_no + page_per_record_cnt; i++) {
					if (reList.size() == i)
						break;
					Inquiry_Board_Dto I_dto = reList.get(i);
					/* for(int i =0;i<reList.size();i++){
					ReviewDTO redto = reList.get(i); */
			%>
			<%
				if (I_dto.getDel() == 0) {
			%>
			<tr>
				<td align="center"><%=i + 1%></td>
				<td><%=arrow(I_dto.getDepth()) %>
				<a href="Board_Inquiry_detail.jsp?seq=<%=I_dto.getSeq()%>&id=<%=id%>"><%=I_dto.getTitle() %></a> 
				</td>
				<td align="center"><%=I_dto.getDate().toString().substring(0, 10)%></td>
				<td align="center"><%=I_dto.getRead_count()%></td>
				<td><%for(int j =0; j<I_dto.getStar_count(); j++){%>
				<img alt="없데욤" src="../image/sai_1.gif">
				<%}%>
				</td>
			</tr>
		<%}else {
			%>
			<tr>
				<td align="center"><%=i + 1%></td>
				<td colspan="3" align="center">삭제된 게시물입니다.
				<td>
			</tr>
			<%}%>
			<%}%>
		
		<!-- 페이징 하는 부분!!! -->
		<tr><td colspan="5" align="center">
		<a href="Board_Inquiry_list.jsp?pageno=1&id=<%=id%>">[맨앞으로]</a> 
		<a href="Board_Inquiry_list.jsp?pageno=<%=prev_pageno%>&id=<%=id%>">[이전]</a>
		<%
			for (int i = page_sno; i <= page_eno; i++) {
		%>
		<a href="Board_Inquiry_list.jsp?pageno=<%=i%>&id=<%=id%>"> <%
		 	if (pageno == i) {
		 %>
							[<%=i%>] <%
		 	} else {
		 %> <%=i%> <%
		 	}
		 %>
		</a>
		<%--	콤마	 --%>
		<%
			if (i < page_eno) {
		%>
		,
		<%
			}
		%>
		<%
			}
		%>

		<a href="Board_Inquiry_list.jsp?pageno=<%=next_pageno+1%>&id=<%=id%>">[다음]</a> 
		<a href="Board_Inquiry_list.jsp?pageno=<%=total_page%>&id=<%=id%>">[맨뒤로]</a>
		<a href="Board_Inquiry_write.jsp?id=<%=id%>"><button>글쓰기</button></a>
		<!-- 페이징 하는 부분!!! -->
		</td></tr>
	</div>
	</table>
	</div>
<jsp:include page="../include/footer.jsp"/>
<jsp:include page="../include/aside.jsp"/>
</body>
</html>