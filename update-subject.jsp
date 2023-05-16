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
		String SubjectName=request.getParameter("subjectname");
		String SubjectCode=request.getParameter("subjectcode");
		String id=request.getParameter("suid");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try 
		{
				Statement stmt= conn.createStatement();
				String query = "update tblsubjects  set SubjectName=?,SubjectCode=? WHERE id=?;";
				pstmt = conn.prepareStatement(query);	
				pstmt.setString(1,SubjectName.toUpperCase());
				pstmt.setString(2,SubjectCode);
				pstmt.setString(3,id);
				int rows=pstmt.executeUpdate();
				if(rows>=0)
				{
					session.setAttribute("update",true);
					response.sendRedirect("manage-subjects.jsp");
				}
		}
		catch (SQLIntegrityConstraintViolationException e)
		{
			session.setAttribute("duplicate",true);
			session.setAttribute("updateno",true);
			response.sendRedirect("edit-subject.jsp?id="+id);
		}
		catch(Exception e)
		{
			session.setAttribute("error",e.getMessage());
			session.setAttribute("updateno",true);
			response.sendRedirect("edit-subject.jsp?id="+id);
		}
	}
	else
	{
		session.setAttribute("passno",true);
		response.sendRedirect("index.jsp");
	}
%>
