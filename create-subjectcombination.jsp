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
		String ClassId = request.getParameter("department");
		String SubjectId = request.getParameter("subject");
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try 
		{
			Statement stmt= conn.createStatement();
			String query = "insert into tblsubjectcombination SET ClassId = ? , SubjectId = ?, status = 1;";

			pstmt = conn.prepareStatement(query);

			pstmt.setString(1,ClassId);
			pstmt.setString(2,SubjectId);
			
			int rows=pstmt.executeUpdate();
			if(rows>0)
			{
				session.setAttribute("update",true);
			}
			response.sendRedirect("manage-subjectcombination.jsp");
		}
		catch (SQLIntegrityConstraintViolationException e)
		{
			session.setAttribute("duplicate",true);
			session.setAttribute("updateno",true);
			response.sendRedirect("add-subjectcombination.jsp");
		}
		catch(Exception e)
		{
			session.setAttribute("error",e.getMessage());
			session.setAttribute("updateno",true);
			response.sendRedirect("add-subjectcombination.jsp");
		}
	}
	else
	{
		session.setAttribute("passno",true);
		response.sendRedirect("index.jsp");
	}
%>
				