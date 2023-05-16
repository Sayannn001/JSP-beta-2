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
		String id = request.getParameter("id");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try 
		{
			Statement stmt= conn.createStatement();
			String query = "delete from tblsubjects where id = ?;";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1,id);
			pstmt.executeUpdate();
			session.setAttribute("update",true);
			response.sendRedirect("manage-subjects.jsp");
		}
		catch (Exception e)
		{
			session.setAttribute("error",true);
			session.setAttribute("updateno",true);
			response.sendRedirect("manage-subjects.jsp");
		}
	}
	else
	{
		response.sendRedirect("inedx.jsp");
	}
%>