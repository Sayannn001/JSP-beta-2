<%@page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@page import="Project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@page import="javax.sql.*" %>
<%@page import="javax.naming.*" %>

<%
	if (session.getAttribute("alogin") != null) 
	{
    	session.setAttribute("alogin", "");
	}
	String username1=request.getParameter("username");
	String password1=request.getParameter("password");
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try 
	{
		String query = "select  UserName,Password from admin";
		Connection conn = ConnectionProvider.getCon();
		pstmt = conn.prepareStatement(query);
		rs = pstmt.executeQuery();
		rs.next();
		if(username1.equals(rs.getString("UserName")) && password1.equals(rs.getString("Password")))
		{
			session.setAttribute("alogin", true);
			response.sendRedirect("dashboard.jsp");
		}
		else
		{
			//response.sendRedirect("index.jsp?error=Invalid username or password");
			//response.sendRedirect("index.jsp");
			%>
			<script>
			alert("Incorrect username or password");
			window.location.href = "index.jsp";
			</script>
			<%
		}
	}
	catch (Exception e)
	{
	}
%>