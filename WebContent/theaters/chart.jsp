<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="movie.*" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/data.js"></script>
<script src="https://code.highcharts.com/modules/drilldown.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
<%

boolean key = false;

String mv_name = request.getParameter("mv_name");


movieDAO dao = movieDAO.getInstance();
List<chartDTO> list = dao.chart(mv_name);


if(list.size()==0){
	key = false;
}else{
	key = true;
}


int total = list.size();
int teen =0;
int twen =0;
int thirty =0;
int forty = 0;

for(int i=0;i<list.size();i++){
	String a = list.get(i).getAge();
	a = a.substring(0, 4);
	int age = Integer.parseInt(a);
	age = 2016-age;
	if(age<20){
		teen++;
	}else if(age>19 && age <30){
		twen++;
	}else if(age>29 && age <40){
		thirty++;
	}else if(age>40){
		forty++;
	}
	
}

int a;
int b;
int c; 
int d;

if(key){
	 a = (teen/total)*100;
	 b = (twen/total)*100;
	 c = (thirty/total)*100; 
	 d = (forty/total)*100;
}else{
	 a = 0;
	 b = 0;
	 c = 0; 
	 d = 0;
}



%>
<div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>


<script type="text/javascript">
$(function () {
    // Create the chart
    $('#container').highcharts({
        chart: {
            type: 'column'
        },
        title: {
            text: '연령 별 예매분포'
        },
        xAxis: {
            type: 'category'
        },
      
        legend: {
            enabled: false
        },
        plotOptions: {
            series: {
                borderWidth: 0,
                dataLabels: {
                    enabled: true,
                    format: '{point.y:.1f}%'
                }
            }
        },

        tooltip: {
            headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
            pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.2f}%</b> of total<br/>'
        },
        series: [{
            name: '연령',
            colorByPoint: true,
            data: [{
                name: '10대',
                y: <%=a%>, 
            }, {
                name: '20대',
                y: <%=b%>,
            }, {
                name: '30대',
                y: <%=c%>,
            }, {
                name: '40대',
                y: <%=d%>,
            }]
        }]
       
    });
});
</script>
</body>
</html>