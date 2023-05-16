<%@page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@page import="Project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@page import="javax.sql.*" %>
<%@page import="java.io.*" %>
<%@page import="javax.naming.*" %>
<%
	if (session.getAttribute("alogin") != null) 
	{
		Connection conn = ConnectionProvider.getCon();
		String Id = request.getParameter("Id");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try 
		{
			Statement stmt= conn.createStatement();
			String query = "delete from tbldept where Id = ?;";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1,Id);
			pstmt.executeUpdate();
			session.setAttribute("update",true);
			response.sendRedirect("manage-departments.jsp");
		}
		catch (Exception e)
		{
			session.setAttribute("error",true);
			session.setAttribute("updateno",true);
			response.sendRedirect("manage-departments.jsp");
		}
	}
	else
	{
		response.sendRedirect("index.jsp");
	}
	%>