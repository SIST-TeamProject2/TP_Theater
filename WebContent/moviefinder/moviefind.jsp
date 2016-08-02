<%@page import="javax.print.DocFlavor.STRING"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%request.setCharacterEncoding("utf-8"); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<title>Insert title here</title>


<script type="text/javascript">
	$(document).ready(function() {
		$("#mvplus").hide();

	});
	
	$(document).ready(function() {
	    //전체선택 체크박스 클릭
		$("#all_genre").click(function(){
			//만약 전체 선택 체크박스가 체크된상태일경우
			if($("#all_genre").prop("checked")) {
				//해당화면에 전체 checkbox들을 체크해준다
				$("input[name=genre]").prop("checked",true);
			// 전체선택 체크박스가 해제된 경우
			} else {
				//해당화면에 모든 checkbox들의 체크를해제시킨다.
				$("input[name=genre]").prop("checked",false);
			}
		})
			$("#all_grade").click(function(){
			//만약 전체 선택 체크박스가 체크된상태일경우
			if($("#all_grade").prop("checked")) {
				//해당화면에 전체 checkbox들을 체크해준다
				$("input[name=grade]").prop("checked",true);
			// 전체선택 체크박스가 해제된 경우
			} else {
				//해당화면에 모든 checkbox들의 체크를해제시킨다.
				$("input[name=grade]").prop("checked",false);
			}
		})
		// 하나라도 누르면 전체 옵션이 풀림
		$("input[name=genre]").click(function(){
			if($("input[name=genre]").prop("checked")) {
				$("#all_genre").prop("checked",false);
			}
		})
		$("input[name=grade]").click(function(){
			if($("input[name=grade]").prop("checked")) {
				$("#all_grade").prop("checked",false);
			}
		})
		// 초기화 버튼
		$("#btn_reset").click(function(){
			$("input[name=grade]").prop("checked",false);
			$("input[name=genre]").prop("checked",false);
			
		})

	});
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////	
	$(document).ready(function() {
		$("#btn_submit").click(function(){
		 	var keyword_type = document.getElementById("keyword_type").value;
		    var keyword = document.getElementById("keyword").value;
		    
		    
		    if($('#all_genre').is(":checked") || $(":checkbox[name='genre']:checked").length == 0) {
		      	genre = "공포,SF,멜로,코미디,애니메이션,액션,기타";

            } else {
                genre = $(":checkbox[name='genre']:checked").map(function() { return this.value; }).get();
            }

		    if($('#all_grade').is(":checked") || $(":checkbox[name='grade']:checked").length == 0) {
		    	grade = "전체,12,15,청불";
            } else {
            	grade = $(":checkbox[name='grade']:checked").map(function() { return this.value; }).get();
            }
		    
		    
		    location.href="moviefind.jsp?pgchk=2&keyword_type="+keyword_type+"&keyword="+keyword+"&genre="+genre+"&grade="+grade;
		    
		    
		})
		$("#keyword").keypress(function(e) { 
		    if (e.keyCode == 13){
		 
		   	var keyword_type = document.getElementById("keyword_type").value;
		    var keyword = document.getElementById("keyword").value;
		    
		    
		    if($('#all_genre').is(":checked") || $(":checkbox[name='genre']:checked").length == 0) {
		       	genre = "공포,SF,멜로,코미디,애니메이션,액션,기타";
            } else {
                genre = $(":checkbox[name='genre']:checked").map(function() { return this.value; }).get();
            }

		    if($('#all_grade').is(":checked") || $(":checkbox[name='grade']:checked").length == 0) {
		    	grade = "전체,12,15,청불";
            } else {
            	grade = $(":checkbox[name='grade']:checked").map(function() { return this.value; }).get();
            }
		    
		    
		    location.href="moviefind.jsp?pgchk=2&keyword_type="+keyword_type+"&keyword="+keyword+"&genre="+genre+"&grade="+grade;
		    
		    
		    }    
		});
	});
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////	
	
	
</script>

</head>
<body>
	<fieldset>

		<table border="1" bgcolor="#555555">
			<col width="120">
			<col width="680">
			<tr>
				<th>영화검색</th>
				<td><select id="keyword_type">
						<option value="0" selected>전체</option>
						<option value="1">영화제목</option>
						<option value="2">주연배우</option>
						<option value="3">감독</option>
				</select> <input type="text" id="keyword"  minlength="2" maxlength="20"
					style="width: 410px;" placeholder="키워드를 입력해 주세요" value="" /></td>
			</tr>
			<tr>
				<th>장르</th>
				<td>
					<ul>
						<li><input type="checkbox" id="all_genre" 
							name="all-genre" value="all" /><label for="all_genre">전체</label></li>

						<li><input type="checkbox" id="genre217" name="genre"
							value="공포" /><label for="genre217">공포/호러</label></li>

						<li><input type="checkbox" id="genre721" name="genre"
							value="SF" /><label for="genre721">SF</label></li>

						<li><input type="checkbox" id="genre1228" name="genre"
							value="멜로" /><label for="genre1228">멜로/로맨스</label></li>

						<li><input type="checkbox" id="genre732" name="genre"
							value="코미디" /><label for="genre732">코미디</label></li>

						<li><input type="checkbox" id="genre727" name="genre"
							value="애니메이션" /><label for="genre727">애니메이션</label></li>
							
						<li><input type="checkbox" id="genre727" name="genre"
							value="애니메이션" /><label for="genre727">액션</label></li>

						<li><input type="checkbox" id="genre1895" name="genre"
							value="기타" /><label for="genre1895">기타</label></li>
					</ul>
				</td>
			</tr>
			<tr>
				<th>관람등급</th>
				<td>
					<ul>
						<li><input type="checkbox" id="all_grade" name="all-grade"
							value="전체" /><label for="all_grade">전체</label></li>

						<li><input type="checkbox" id="grade233" name="grade"
							value="전체" /><label for="grade233">전체관람가</label></li>

						<li><input type="checkbox" id="grade230" name="grade"
							value="12" /><label for="grade230">12세 관람가</label></li>

						<li><input type="checkbox" id="grade231" name="grade"
							value="15" /><label for="grade231">15세 관람가</label></li>

						<li><input type="checkbox" id="grade232" name="grade"
							value="청불" /><label for="grade232">청소년 관람불가</label></li>
					</ul>
				</td>
			</tr>
		</table>
		<div class="wrap-submit">
			<button type="submit" class="round inred" id="btn_submit">
				<span>검색</span>
			</button>
			<button type="submit" id="btn_reset">
				<span>초기화</span>
			</button>
		</div>
	</fieldset>
<%
////////////////페이지 확인하는 변수//////////////////////////
int pgchk;
if(request.getParameter("pgchk")==null){
	pgchk =1;
}else{
	String pg = request.getParameter("pgchk");
	 pgchk = Integer.parseInt(pg);
}
/////////////////위에서 뿌린 입력 정보 /////////////////////
String keyword_type;

if(request.getParameter("keyword_type")==null){
	keyword_type ="";
}else{
	keyword_type = request.getParameter("keyword_type");
}
String keyword;

if(request.getParameter("keyword")==null){
	keyword ="";
}else{
	keyword = request.getParameter("keyword");
}
String genre;

if(request.getParameter("genre")==null){
	genre ="";
}else{
	genre = request.getParameter("genre");
}
String grade;

if(request.getParameter("grade")==null){
	grade ="";
}else{
	grade = request.getParameter("grade");
}

/////////////////////////////////////////////////////////
if(pgchk==1){
%>
	<fieldset id="fieldset1">
		<jsp:include page="../movie/movie.jsp">
		<jsp:param value="7" name="count" />
		</jsp:include>
	</fieldset>
	<%}else{ %>
	<jsp:include page="../moviefinder/findmovielist.jsp">
		<jsp:param value="<%=keyword_type%>" name="keyword_type" />
		<jsp:param value="<%=keyword%>" name="keyword" />
		<jsp:param value="<%=genre%>" name="genre" />
		<jsp:param value="<%=grade%>" name="grade" />
		</jsp:include>
	
	<%} %>\
	
</body>
</html>