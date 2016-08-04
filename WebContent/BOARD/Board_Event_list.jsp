<%@page import="member.memberDTO"%>
<%@page import="java.util.List"%>
<%@page import="EVENT_BOARD.Event_Board_Dao"%>
<%@page import="EVENT_BOARD.Event_Board_Dto"%>
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
<%request.setCharacterEncoding("utf-8"); %>
<jsp:include page="../include/header.jsp"/>
<jsp:include page="../include/nav.jsp"/>

<div class="section_event">

	
	%>
	<%!public Integer toInt(String x) {
	int a = 0;
	try {
		a = Integer.parseInt(x);
	} catch (Exception e) {
	}
	return a;
	}%>

	<%
		/* MemberDTO memberdto = (MemberDTO)session.getAttribute("login"); */
	%>
		<table class="tbl_eve_list">
			<col width="50"/><col width="100"/><col width="400"/>
			<col width="100"/><col width="100"/><col width="80"/>
			<col width="80"/>
			<tr style="background-color: #3fc08c;">
			<th class="th_eve">번호</th>
			<th class="th_eve">구분</th>
			<th class="th_eve" align="left">제목</th>
			<th class="th_eve">작성자</th>
			<th class="th_eve">작성일</th>
			<th class="th_eve">조회수</th>
			<th	class="th_eve">추천수</th>
			</tr>
			<!-- 잠깐 스탑 여기서 review dto,dao 만들어서 불러야될듯 -->
			<%
			Event_Board_Dao E_dao = Event_Board_Dao.getInstance();
				List<Event_Board_Dto> reList = E_dao.getE_boardlist();

				request.setAttribute("reList", reList);

				int pageno = toInt(request.getParameter("pageno"));
				if (pageno < 1) {//현재 페이지
					pageno = 1;
				}
				int total_record = reList.size(); //총 레코드 수
				int page_per_record_cnt = 5; //페이지 당 레코드 수
				int group_per_page_cnt = 5; //페이지 당 보여줄 번호 수[1],[2],[3],[4],[5]
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
					Event_Board_Dto E_dto = reList.get(i);
					/* for(int i =0;i<reList.size();i++){
					ReviewDTO redto = reList.get(i); */
			%>			
			<%
				if (E_dto.getDel() == 0) {
			%>
			<tr class="td_eve">
				<td align="center"><%=i + 1%></td>
				<td align="center"><%=E_dto.getCategory() %></td>
				<td align="left"><a href="Board_Event_detail.jsp?seq=<%=E_dto.getSeq()%>"><%=E_dto.getTitle() %></a></td>
				<td align="center"><%=E_dto.getId() %></td>
				<td align="center"><%=E_dto.getDate().toString().substring(0, 10)%></td>
				<td align="center"><%=E_dto.getRead_count()%></td>
				<td align="center"><%=E_dto.getLike() %></td>
			</tr>
		<%}else {
			%>
			<tr>
				<td align="center"><%=i + 1%></td>
				<td colspan="4" align="center">삭제된 게시물입니다.
				<td>
			</tr>
			<%}%>
			<%}%>
		
		<!-- 페이징 하는 부분!!! -->
		<tr>
			<td colspan="7" align="right"><a href="Board_Event_write.jsp"><button>글쓰기</button></a></td>
		</tr>
		<tr><td colspan="7" align="center">
		<a href="Board_Event_list.jsp?pageno=1">[맨앞으로]</a> 
		<a href="Board_Event_list.jsp?pageno=<%=prev_pageno%>">[이전]</a>
		<%
			for (int i = page_sno; i <= page_eno; i++) {
		%>
		<a href="Board_Event_list.jsp?pageno=<%=i%>"> <%
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

		<a href="Board_Event_list.jsp?pageno=<%=next_pageno%>">[다음]</a> 
		<a href="Board_Event_list.jsp?pageno=<%=total_page%>">[맨뒤로]</a>
		<!-- 페이징 하는 부분!!! -->
		</td></tr>
		
	</table>
	</div>
<jsp:include page="../include/footer.jsp"/>
<jsp:include page="../include/aside.jsp"/>
</body>
</html>