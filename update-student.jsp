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
		int StudentId=Integer.parseInt(request.getParameter("StudentId"));
		String StudentName = request.getParameter("fullname");
		String StudentEmail = request.getParameter("email");
		String Gender = request.getParameter("gender");
		//String Status = request.getParameter("status");
		int Status=Integer.parseInt(request.getParameter("status"));
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try 
		{
			Statement stmt= conn.createStatement();
			String query = "UPDATE tblstudents SET StudentName = ? , StudentEmail = ? , Gender = ? , Status = ?  WHERE StudentId = ?;";

			pstmt = conn.prepareStatement(query);
			out.println(query);
			pstmt.setString(1,StudentName);
			pstmt.setString(2,StudentEmail);
			pstmt.setString(3,Gender);
			pstmt.setInt(4,Status);
			pstmt.setInt(5,StudentId);
			int rows=pstmt.executeUpdate();

			if(rows>=0)
			{
				session.setAttribute("update",true);
				response.sendRedirect("manage-students.jsp");
			}
			else
			{
				session.setAttribute("updateno",true);
				session.setAttribute("alogin",true);
				response.sendRedirect("manage-student.jsp");
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
		response.sendRedirect("manage-students.jsp");
	}
%>
				