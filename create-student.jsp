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
		//int StudentId=Integer.parseInt(request.getParameter("StudentId"));
		String StudentName = request.getParameter("fullname");
		int RollId = Integer.parseInt(request.getParameter("rollid"));
		String StudentEmail = request.getParameter("email");
		String Gender = request.getParameter("gender");
		int ClassId = Integer.parseInt(request.getParameter("class"));
		String DOB = request.getParameter("dob");
		//String Status = request.getParameter("status");
		int Status= 1;//Integer.parseInt(request.getParameter("status"));
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try 
		{
			Statement stmt= conn.createStatement();
			String query = "insert into tblstudents SET StudentName = ? , RollId = ?, StudentEmail = ? , ClassId = ?, Gender = ? , DOB = ? , Status = 1;";

			pstmt = conn.prepareStatement(query);

			pstmt.setString(1,StudentName);
			pstmt.setInt(2,RollId);
			pstmt.setString(3,StudentEmail);
			pstmt.setInt(4,ClassId);
			pstmt.setString(5,Gender);
			pstmt.setString(6,DOB);
			int rows=pstmt.executeUpdate();
			if(rows>0)
			{
				session.setAttribute("update",true);
				response.sendRedirect("manage-students.jsp");
			}
			else
			{
				session.setAttribute("updateno",true);
				session.setAttribute("alogin",true);
				response.sendRedirect("add-students.jsp");
			}
		}
		catch (SQLIntegrityConstraintViolationException e)
		{
			session.setAttribute("updateno",true);
			session.setAttribute("alogin",true);
			response.sendRedirect("add-students.jsp");
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
				