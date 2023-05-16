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
		String StudentId = request.getParameter("StudentId");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try 
		{
			Statement stmt= conn.createStatement();
			String query = "delete from tblresult where StudentId = ?;";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1,StudentId);
			pstmt.executeUpdate();
			session.setAttribute("update",true);
			response.sendRedirect("manage-results.jsp");
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}
	else
	{
		response.sendRedirect("dashboard.jsp");
	}
%>