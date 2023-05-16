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
		String scid=request.getParameter("scid");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try 
		{
			Statement stmt= conn.createStatement();
			String query = "SELECT * FROM tblsubjectcombination WHERE id=?;";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1,scid);
			rs=pstmt.executeQuery();
			rs.next();

			int stat=Integer.parseInt(rs.getString("status"));
			if(stat==1)
			{


				query = "UPDATE tblsubjectcombination SET status = ? WHERE id = ?;";
				pstmt = conn.prepareStatement(query);
				pstmt.setInt(1,0);
				pstmt.setString(2,scid);
				int rows=pstmt.executeUpdate();
				if(rows>=0)
				{
					session.setAttribute("update",true);
					response.sendRedirect("manage-subjectcombination.jsp");
				}
				else
				{
					session.setAttribute("updateno",true);
					session.setAttribute("alogin",true);
					response.sendRedirect("manage-subjectcombination.jsp");
				}
			}
			else
			{
				query = "UPDATE tblsubjectcombination SET status = ? WHERE id = ?;";
				pstmt = conn.prepareStatement(query);
				pstmt.setInt(1,1);
				pstmt.setString(2,scid);
				int rows=pstmt.executeUpdate();
				if(rows>=0)
				{
					session.setAttribute("update",true);
					response.sendRedirect("manage-subjectcombination.jsp");
				}
				else
				{
					session.setAttribute("updateno",true);
					session.setAttribute("alogin",true);
					response.sendRedirect("manage-subjectcombination.jsp");
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
		response.sendRedirect("manage-subjectcombination.jsp");
	}
%>
				