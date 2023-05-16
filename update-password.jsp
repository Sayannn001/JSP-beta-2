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
		String password1 = request.getParameter("password");
		String newpassword1 = request.getParameter("newpassword");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try 
		{
			Statement stmt= conn.createStatement();
			rs = stmt.executeQuery("SELECT Password from admin");
			rs.next();
			if(rs.getString("Password").equals(password1))
			{
				String query = "UPDATE admin SET Password = ? WHERE admin.id = 1;";
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1,newpassword1);
				int rows = pstmt.executeUpdate();
				if(rows>0)
				{
					session.setAttribute("pass",true);
					response.sendRedirect("change-password.jsp");
				}
				else
				{
					session.setAttribute("passno",true);
					session.setAttribute("alogin",true);
					response.sendRedirect("change-password.jsp");
				}
			}
			else
			{
				session.setAttribute("passno",true);
				response.sendRedirect("change-password.jsp");
				
			}
			response.sendRedirect("change-password.jsp");
		}
		catch(Exception e)
		{
		}
	}
	else
	{
		response.sendRedirect("dashboard.jsp");
	}
%>
				