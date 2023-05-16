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
		//session.getAttribute("pass");
		Connection conn = ConnectionProvider.getCon();
		String ClassId = request.getParameter("classid");		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String url="add-result2.jsp?=";
		String k="";
		try 
		{
			Statement stmt= conn.createStatement();
			String query = "SELECT * FROM tblstudents WHERE ClassId= ? order by StudentName";

			pstmt = conn.prepareStatement(query);
			pstmt.setString(1,ClassId);
			
			rs = pstmt.executeQuery();
			rs.next();
			k=rs.getString("StudentId");
			url=url+k+"&";
			response.sendRedirect(url);
		}
		catch (SQLIntegrityConstraintViolationException e)
		{
			session.setAttribute("updateno",true);
			session.setAttribute("alogin",true);
			response.sendRedirect("add-result2.jsp");
		}
		catch(Exception e)
		{
			out.println("Error: " + e.getMessage());
		    e.printStackTrace();
		}
	}
	else
	{
		session.setAttribute("passno",true);
		response.sendRedirect("add-result2.jsp");
	}
%>
				