<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import ="movie.movieDTO" %>
<%@ page import = "movie.movieDAO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>reservation2.jsp</title>


<%
String sgrade="";
%>

<%!
String[] arr2;
int general=0;//일반
int teen=0;	//청소년
int grand=0;//우대 
%> 

<script type="text/javascript">
var general=0;
var teen=0;
var grand=0;
function peoplecount(){
}
</script>


</head>
<body>
<%
//받아온 값
//fnum=roomDTO [room_num=1, start_time=16:30, movie_name=도리를 찾아서, sdate=2016.07.26, edate=2016.08.10]
			
		if(request.getParameter("fnum")!=null){
			arr2 = new String[50];
			arr2 =request.getParameter("fnum").split(",");
			
			for(int i=0; i<arr2.length;i++){
			System.out.println(arr2[i]);
			}
			movieDAO dao = movieDAO.getInstance();
			movieDTO dto = new movieDTO();
			dto = dao.get_grade_Movie(arr2[0]);
			
			sgrade = dto.getGrade();
			////등급얻어옴완료
			System.out.println("dto.getGrade()=="+dto.getGrade());
		
		}else{
			
		}
%>
<script type="text/javascript">

function popupOpen(){

	var popUrl = "reservation2_af.jsp?grade=<%=sgrade%>";	//팝업창에 출력될 페이지 URL
	var popOption = "width=470, height=260, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
<%-- 	<%if(sgrade!=""){%>	 --%>
	window.open(popUrl,"",popOption);
<%-- 	<%}%> --%>
	}
	
</script>

<%if(sgrade.equals("")){}
else{%>

		<script type="text/javascript">
				popupOpen();
			</script>
<%} %>

<%//********************************************************************예매화면시작******************************************************; %>

<table border ="1">

<tr>
<td>인원선택</td>
<td>상영정보</td>
</tr>

<tr>
<td>
일반 :<input type="image" src="image/minus.png" onclick=<%general--;%>><input type="text" size="5" name="general" value="0"><input type="image" src="image/plus.png" onclick=<%general++;%>>
청소년 :<input type="image" src="image/minus.png" onclick=<%teen--; %>><input type="text" size="5" name="teen" value="0"><input type="image" src="image/plus.png" onclick=<%teen++;%>>
우대:<input type="image" src="image/minus.png" onclick=<%grand--; %>><input type="text" size="5" name="grand" value="0"><input type="image" src="image/plus.png" onclick=<%grand++;%>>

</td>

<td>
영화 제목 : <%=arr2[0]%>
<br>영화관 : <%=arr2[1]%>
<br>상영관 : <%=arr2[2]%>관
<br>상영일 : <%=arr2[3]%>
<br>상영시간 : <%=arr2[4]%> 

</td>
</tr>

</table>

<table border="1" width="1000" height="50">
<tr>
<td>screen
</td>
</tr>
</table>

</body>
</html>

