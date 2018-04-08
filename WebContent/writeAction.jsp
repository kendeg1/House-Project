<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="bbs" class="bbs.Bbs" scope="page"/>
<jsp:setProperty name="bbs" property="type"/>
<jsp:setProperty name="bbs" property="condition"/>
<jsp:setProperty name="bbs" property="room_count"/>
<jsp:setProperty name="bbs" property="bathroom_count"/>
<jsp:setProperty name="bbs" property="additional_notes"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="buy.css">
<title>Find Housing</title>
</head>

<body>
	<%
		String username = null;
		if (session.getAttribute("username") != null){
			username = (String) session.getAttribute("username");
		}
		if (username == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('You need to Login')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		}
		else{
			BbsDAO bbsDAO = new BbsDAO();
			int result = bbsDAO.write(username, bbs.getType(), bbs.getCondition(), bbs.getRoom_count(), bbs.getBathroom_count(), 
					bbs.getAdditional_notes());
			if (result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('Failed to make a post')");
				script.println("history.back()");
				script.println("</script>");
			}
			else{
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'bbs.jsp'");
				script.println("</script>");
			}
		}
	
	
	%>

</body>
</html>