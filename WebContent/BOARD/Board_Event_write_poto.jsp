
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory" %>
<%@page import="org.apache.commons.fileupload.FileItem" %>
<%@page import="org.apache.commons.fileupload.ProgressListener" %>

<%@page import="java.util.List" %>
<%@page import="java.io.File" %>
<%@page import="java.util.Iterator" %>
<%@page import="java.io.IOException" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<body>
<%request.setCharacterEncoding("utf-8"); %>
<%!
public void processFromField(FileItem item, JspWriter out) throws IOException{
	String name = item.getFieldName();
	String value = "";
	try{
		value = item.getString("utf-8");	
	}catch(Exception e){
		value = item.getString();		
	}
}
public void processUploadFile(FileItem fileItem, String dir, JspWriter out) throws IOException{
	String fieldName = fileItem.getFieldName();
	String filename = fileItem.getName();
	String contentType = fileItem.getContentType();
	long sizeInBytes = fileItem.getSize();
	
	
	// 업로드한 파일 있는 경우,
	if(sizeInBytes > 0){
		int idx = filename.lastIndexOf("\\");
		if(idx == -1){
			idx = filename.lastIndexOf("/");
		}
		filename=filename.substring(idx + 1);
		
		try{
			File uploadedFile = new File(dir, filename);
			fileItem.write(uploadedFile);
		}catch(Exception e){}
	}	
}
%>

<%
String fupload = "//211.238.142.189/upload/";
/* String fupload = "//127.0.0.1/upload/"; */

String yourTempDir = fupload;
int yourMaxRequestSize = 100*1024*1024;
int yourMaxMemorySize = 100*1024;

String filename = "";
String id = "";
String title = "";
String content = "";
String category =  "";
int del = 0;

boolean isMultipart=ServletFileUpload.isMultipartContent(request);
if(isMultipart){
	DiskFileItemFactory factory = new DiskFileItemFactory();
	factory.setSizeThreshold(yourMaxMemorySize);			//메모리사이즈 설정
	factory.setRepository(new File(yourTempDir));			//저장경로 설정
	
	ServletFileUpload upload = new ServletFileUpload(factory);	//임시파일 영역
	upload.setSizeMax(yourMaxRequestSize);
	
	List<FileItem> items = upload.parseRequest(request);		//필요의 데이터를 꺼낸다.
	
	Iterator<FileItem> it = items.iterator(); 					//for문의 인트 i랑 비슷하다. 
	
	while(it.hasNext()){
		FileItem item = it.next();								//파일 올리기
		
		//211.238.142.189/upload/
		if(item.isFormField()){									
			processFromField(item, out);
			if(item.getFieldName().equals("id")){
				id = item.getString("utf-8");					
			}else if(item.getFieldName().equals("title")){
				title = item.getString("utf-8");				
			}else if(item.getFieldName().equals("content")){
				content = item.getString("utf-8");				
			}else if(item.getFieldName().equals("category")){
				category = item.getString("utf-8");				
			}
		}else{
			if(item.getFieldName().equals("fileload")){
				int idx = item.getName().lastIndexOf("\\");		
				if(idx== -1){
					idx=item.getName().lastIndexOf("/");
				}
				filename = item.getName().substring(idx+1);
			}
			processUploadFile(item, fupload, out);
		}
	}
}
if(filename!=null){ %>
<%pageContext.forward("Board_Event_write.jsp?filename="+filename+"&title="+title+"&content="+content+"&id="+id);%>
<%}else{%>
	<script type="text/javascript">
	alert("파일을 넣고 업로드해주세요.");
	location.href="Board_Event_write.jsp";
	</script>
<%}%>

</body>
</html>