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
		String Id = request.getParameter("id");
		String DeptName = request.getParameter("deptname");
		String DeptCode = request.getParameter("deptcode");
		String Short = request.getParameter("short");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try 
		{
			Statement stmt= conn.createStatement();
			String query = "UPDATE tbldept SET DeptName = ? , DeptCode = ? , Short = ?  WHERE id = ?;";

			pstmt = conn.prepareStatement(query);
			pstmt.setString(1,DeptName.toUpperCase());
			pstmt.setString(2,DeptCode);
			pstmt.setString(3,Short.toUpperCase());
			pstmt.setString(4,Id);
			int rows=pstmt.executeUpdate();

			if(rows>=0)
			{
				session.setAttribute("update",true);
				response.sendRedirect("manage-departments.jsp");
			}
		}
		catch (SQLIntegrityConstraintViolationException e)
		{
			session.setAttribute("duplicate",true);
			session.setAttribute("updateno",true);
			response.sendRedirect("edit-department.jsp?Id="+Id);
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
				