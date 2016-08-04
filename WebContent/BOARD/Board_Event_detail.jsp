<%@page import="member.memberDTO"%>
<%@page import="java.util.List"%>
<%@page import="BOARD_COMMENT.Board_Comment_Dto"%>
<%@page import="BOARD_COMMENT.Board_Comment_Dao"%>
<%@page import="EVENT_BOARD.Event_Board_Dao"%>
<%@page import="EVENT_BOARD.Event_Board_Dto"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%request.setCharacterEncoding("utf-8"); %>
<link rel = "stylesheet" href="../css/Board.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js" ></script>
<script type="text/javascript">
$(function(){
   $("button").click(function(){
      var st = $(this).attr("class");

      if(st=="btn"){
      var value = $(this).attr("value");
      $('#'+value).show();
      /* $('#send'+value).show(); */
      $('#btn2'+value).show();
      $('#btn'+value).hide();
      
      }else if(st=="btn2"){
      var value = $(this).attr("value");

      location.reload(); 
      $('#'+value).hide(); 
      /* $('#send'+value).hide(); */
      $('#btn2'+value).hide();
      $('#btn'+value).show();
      
      }else if(st=="del_btn"){
         var value = $(this).attr("value");
         location.href="Board_Event_del.jsp?seq="+value;
      }else if(st=="return"){
         location.href="Board_Event_list.jsp";
      }
   });
});

</script>

</head>
<body>
<jsp:include page="../include/header.jsp"/>
<jsp:include page="../include/nav.jsp"/>

<%!public String arrow(int depth){
   String rs="<img src='../image/arrow.png' width='20px' height='20px'/>";   
   String nbsp="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
   String ts="";                        
   
   for(int i = 0; i < depth; i++){   
      ts +=nbsp;
   }
   return depth==0?"":ts+rs;
}
   public String nbsp(int depth){   
   String nbsp="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
   String ts="";                        
   
   for(int i = 0; i < depth; i++){   
      ts +=nbsp;
   }
   return depth==0?"":ts;
}
%>


<%memberDTO mdto = (memberDTO) session.getAttribute("loginMember");
   String id = "";
   if(mdto!=null){id = mdto.getId();}%>


<%request.setCharacterEncoding("utf-8"); %>
<%

String sseq = request.getParameter("seq"); 
int seq = Integer.parseInt(sseq);


Event_Board_Dao dao = Event_Board_Dao.getInstance();
Event_Board_Dto dto = dao.getDTO(seq);
dao.Event_readCount(seq);

Board_Comment_Dao c_dao = Board_Comment_Dao.getInstance();
List<Board_Comment_Dto> c_list = c_dao.comment_list(seq);

boolean isS=dao.like_cheak(id, seq);   //접속자 아이디 글 seq                           /* <!-- 세션 아이디 불러올부분 --> */
%>

<div class="section_event">
<h1>이벤트게시판</h1>
<h2>CGV에 뽐낸 사진을 확인하세요.</h2>

<table class="tbl_eve_detail">
   <col width="100"><col width="200"><col width="100"><col width="100">
   <tr class="th_eve">
   <td align="right"><%=dto.getCategory()%></td>
   <td><%=dto.getTitle()%></td>
   <td>등록일 : <%=dto.getDate().toString().substring(0, 10) %></td>
   <td>조회수 : <%=dto.getRead_count() %></td> 
   </tr>
   <%if(!dto.getFile_name().equals("null")){%>
   <tr>
      <td colspan="4" align="center">
         <img src="../../../../../upload/<%=dto.getFile_name()%>" width=700 height=600></img>   
      </td>
   </tr>
   <%}%>
   <tr class="eve_content">
      <td colspan="4" class="eve_content">
         <%=dto.getContent()%>
      </td>
   </tr>
   <%if(isS){ %>
   <tr >
      <td colspan="4" align="right">
         <a href="Board_Event_l_up.jsp?seq=<%=seq %>&id=<%=id%>"><img src='../image/clike.png' width='20px' height='20px'/>좋아요</a>         <!-- 로그인한 아이디 넣을것. -->
      </td>
   </tr>
   <%}else{ %>
   <tr>
      <td colspan="4" align="right">
         <a href="Board_Event_l_cancel.jsp?seq=<%=seq %>&id=<%=id%>"><img src='../image/like.png' width='20px' height='20px'/>좋아요 취소</a>   <!-- 로그인한 아이디 넣을것. -->
      </td>
   </tr>
   <%} %>   
   <%for(int i = 0; i<c_list.size(); i++){ 
         Board_Comment_Dto c_dto = c_list.get(i);
      if(c_dto.getDel()==0){%>
      <tr class="eve_comment">
         <td colspan="4" class="eve_comment"><%=arrow(c_dto.getDepth()) %>
            <font color="#blue"><%=c_dto.getId() %></font>님 <%=c_dto.getDate() %>
            <%if(!id.equals("")){ %>
            <button class ="btn" id="btn<%=i %>" value="<%=i%>">답글</button>
            <%} %>
            <%if(id.equals(c_dto.getId())){ %>
            <button style="display: none" class ="btn2" id ="btn2<%=i %>" value="<%=i%>">취소</button>
            <a href="Board_Event_comment_del.jsp?c_seq=<%=c_dto.getSeq()%>&seq=<%=seq%>"><button>삭제</button></a>
            <%} %>
         </td>
      </tr>
   
      
      <tr class="eve_comment" >
         <td colspan="4" class="eve_comment"><%=nbsp(c_dto.getDepth()) %>
            <%=c_dto.getContent() %>
         </td>         
      </tr>
      
      <form action="Board_Event_c_answer.jsp">
      <tr id = <%=i %> style="display: none;">
         <td colspan="4" class="eve_comment">
         <input type="hidden" name="c_seq" value="<%=c_dto.getSeq()%>">
         <input type="hidden" name="c_id" value="<%=id%>">                                    <!-- 현재 로그인 아이디값 -->
         <input type="hidden" name="e_seq" value=<%=seq %>>                                    <!-- 게시판 부모글의 시퀀스값 -->
         <textarea rows="5" cols="80" name="c_content" ></textarea>
         <input type="submit" value="전송">
         </td>
      </tr>
      </form>
      <%}else{ %>
         <tr>
         <td colspan="4"><%=arrow(c_dto.getDepth()) %>
            삭제된 게시물입니다.
         </td>
      </tr>
      <%} %>
   <%} %>
   <%if(!id.equals("")){ %>
   <form action="Board_Event_comment.jsp" method="post">
   <input type="hidden" name="id" value="<%=id%>">                                       <!-- 세션 아이디 불러올부분 -->
   <tr>
      <td colspan="4" class="eve_comment">
         <!-- <input type="text" name="content" class="comment_btn" size="110" align="top"> -->
         <textarea rows="5" cols="80" name="content"></textarea>
         <input type="hidden" name="seq" value="<%=seq%>">
         <input type="submit" value="작성" >                        <!-- class="comment_btn" -->
      </td>
   </tr>

   </form>
   <%}else{ %>
   <tr>
      <td colspan="4" class="eve_comment">
         <textarea rows="5" cols="80" name="content" readonly="readonly">로그인 후 작성이 가능합니다.</textarea>
      </td>
   </tr>
   <%} %>
   <%if(!id.equals("")){ %>
   <tr>
      <td colspan="4" align="right">
      <%if(id.equals(dto.getId())){ %>                                                         <!-- 글쓴이아이디 -->
      <form action="Board_Event_modify.jsp" >
      <input type="hidden" name="category" value="<%=dto.getCategory()%>">
      <input type="hidden" name="title" value="<%=dto.getTitle()%>">
      <input type="hidden" name="content" value="<%=dto.getContent()%>">
      <input type="hidden" name="filename_r" value="<%=dto.getFile_name()%>">
      <input type="hidden" name="id" value="<%=dto.getId()%>">                        
      <input type="hidden" name="seq" value="<%=seq%>">
      <input type="submit" value="수정">
      <button type="button" id="del_btn" class="del_btn" value="<%=seq%>">삭제</button>
      <%} %>
      <button type="button" id="del_btn" class="return">목록으로</button>
      </form>
      </td>
   </tr>
   <%}else{ %>
      <tr>
         <td colspan="4" align="right"><button type="button" id="del_btn" class="return">목록으로</button></td>
      </tr>
   <%} %>
   
</table>

</div>
<jsp:include page="../include/footer.jsp"/>
<jsp:include page="../include/aside.jsp"/>
</body>
</html>