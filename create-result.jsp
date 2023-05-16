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
		String StudentId= request.getParameter("stid");
		String ClassId= request.getParameter("clid");
		String SubjectId= request.getParameter("suid");
		String[] marks = request.getParameterValues("marks[]");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try 
		{
			for(int i=0;i<marks.length;i++)
			{
				Statement stmt= conn.createStatement();
				String query = "INSERT INTO tblresult  set marks=?,StudentId=?,SubjectId=?,ClassId=?;";

				pstmt = conn.prepareStatement(query);	
				out.println(query);
				pstmt.setString(1,marks[i]);
				pstmt.setString(2,StudentId);
				pstmt.setString(3,SubjectId);
				pstmt.setString(4,ClassId);
				int rows=pstmt.executeUpdate();
				if(rows>=0)
				{
					session.setAttribute("update",true);
					response.sendRedirect("manage-results.jsp");
				}
				else
				{
					session.setAttribute("updateno",true);
					session.setAttribute("alogin",true);
					response.sendRedirect("add-result.jsp");
				}
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	else
	{
		session.setAttribute("passno",true);
		response.sendRedirect("manage-results.jsp");
	}
%>
				