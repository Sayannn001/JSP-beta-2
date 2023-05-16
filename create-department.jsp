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
		String DeptName = request.getParameter("departmentname");
		String DeptCode = request.getParameter("departmentcode");
		String Short = request.getParameter("short");
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try 
		{
			Statement stmt= conn.createStatement();
			String query = "insert into tbldept SET DeptName = ? , DeptCode = ?, Short = ?;";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1,DeptName);
			pstmt.setString(2,DeptCode);
			pstmt.setString(3,Short.toUpperCase());
			
			int rows=pstmt.executeUpdate();
			if(rows>0)
			{
				session.setAttribute("update",true);
				response.sendRedirect("manage-departments.jsp");
			}
		}
		catch (SQLIntegrityConstraintViolationException e)
		{
			session.setAttribute("duplicate",true);
			session.setAttribute("updateno",true);
			response.sendRedirect("add-department.jsp");
		}
		catch(Exception e)
		{
			session.setAttribute("error",e.getMessage());
			session.setAttribute("updateno",true);
			response.sendRedirect("add-department.jsp");
		}
	}
	else
	{
		session.setAttribute("passno",true);
		response.sendRedirect("index.jsp");
	}
%>
				