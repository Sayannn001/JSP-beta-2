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
		String SubjectName = request.getParameter("subjectname");
		String SubjectCode = request.getParameter("subjectcode");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try 
		{
			Statement stmt= conn.createStatement();
			String query = "insert into tblsubjects SET SubjectName = ? , SubjectCode = ?;";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1,SubjectName.toUpperCase());
			pstmt.setString(2,SubjectCode);			
			int rows=pstmt.executeUpdate();
			if(rows>0)
			{
				session.setAttribute("update",true);
			}
			response.sendRedirect("manage-subjects.jsp");
		}
		catch (SQLIntegrityConstraintViolationException e)
		{
			session.setAttribute("duplicate",true);
			session.setAttribute("updateno",true);
			response.sendRedirect("add-subject.jsp");
		}
		catch(Exception e)
		{
			session.setAttribute("error",e.getMessage());
			session.setAttribute("updateno",true);
			response.sendRedirect("add-subject.jsp");
		}
	}
	else
	{
		session.setAttribute("passno",true);
		response.sendRedirect("index.jsp");
	}
%>
				