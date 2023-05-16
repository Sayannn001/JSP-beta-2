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
		String[] ids = request.getParameterValues("id[]");
		String[] mark = request.getParameterValues("marks[]");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try 
		{
			for(int i=0;i<ids.length;i++)
			{
				Statement stmt= conn.createStatement();
				String query = "update tblresult  set marks=? where id=?;";

				pstmt = conn.prepareStatement(query);	
				out.println(query);
				pstmt.setString(1,mark[i]);
				pstmt.setString(2,ids[i]);
				int rows=pstmt.executeUpdate();
				if(rows>=0)
				{
					session.setAttribute("update",true);
					response.sendRedirect("edit-result.jsp?StudentId="+request.getParameter("StudentId"));
				}
				else
				{
					session.setAttribute("updateno",true);
					session.setAttribute("alogin",true);
					response.sendRedirect("edit-result.jsp");
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
		response.sendRedirect("edit-result.jsp");
	}
%>
				