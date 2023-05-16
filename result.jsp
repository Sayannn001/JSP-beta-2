<%@page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@page import="Project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@page import="javax.sql.*" %>
<%@page import="javax.naming.*" %>
<%
    // Start the session
    session = request.getSession();

    // Get the database connection
    Connection conn = ConnectionProvider.getCon();

    // Set the session variable to empty string if it's not already
    if (session.getAttribute("alogin") != null) 
    {
        session.setAttribute("alogin", "");
    }
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width, initial-scale=1">
    	<link rel="icon" type="image/x-icon" href="images/favicon.png">
        <title>Result 2022-23</title>
        <link rel="stylesheet" href="css/bootstrap.min.css" media="screen" >
        <link rel="stylesheet" href="css/font-awesome.min.css" media="screen" >
        <link rel="stylesheet" href="css/animate-css/animate.min.css" media="screen" >
        <link rel="stylesheet" href="css/lobipanel/lobipanel.min.css" media="screen" >
        <link rel="stylesheet" href="css/prism/prism.css" media="screen" >
        <link rel="stylesheet" href="css/main.css" media="screen" >
        <script src="js/modernizr/modernizr.min.js"></script>
    </head>
    <body>
        <div class="main-wrapper">
            <div class="content-wrapper">
                <div class="content-container">

         
                    <!-- /.left-sidebar -->

                    <div class="main-page">
                        <div class="container-fluid">
                            <div class="row page-title-div">
                                <div class="col-md-12">              
                                    <h2 class="title" align="center" style="padding-right:25px;"><a  href="index.jsp">
                			    <img align=left style="max-height: 40px; padding-left:25px; " src="images/home.png" ></a>Techno Main Saltlake Result 2022-23</h2>
                                </div>
                            
                               
                            </div>
                            <!-- /.row -->
                          
                            <!-- /.row -->
                        </div>
                        <!-- /.container-fluid -->

                        <section class="section">
                            <div class="container-fluid">

                                <div class="row">
                              
                             

                                    <div class="col-md-8 col-md-offset-2">
                                        <div class="panel">
                                            <div class="panel-heading">
                                                <div class="panel-title">
<%
	String rollid = request.getParameter("rollid");
	String classid = request.getParameter("class");
	session.setAttribute("rollid", rollid);
	session.setAttribute("classid", classid);
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int cnt=1,flag=0;
	try 
	{
		String query = "SELECT tblstudents.StudentName, tblstudents.RollId, tblstudents.RegDate, tblstudents.StudentId, tblstudents.Status, tbldept.DeptName, tbldept.Short FROM tblstudents JOIN tbldept ON tbldept.id = tblstudents.ClassId WHERE tblstudents.RollId = ? AND tblstudents.ClassId = ?";
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, rollid);
		pstmt.setString(2, classid);
		rs = pstmt.executeQuery();
		while (rs.next())
		{
			flag++;
%>
<p><b>Student Name :</b> <%=rs.getString("StudentName")%></p>
<p><b>Roll Number :</b> <%=rs.getString("RollId")%></p>
<p><b>Department:</b> <%=rs.getString("DeptName")%> (<%=rs.getString("Short")%>)</p>
<%
			cnt++;
		}
	} 
	catch (Exception e) 
	{
		out.println(e);
	} 
	
%>
                                            </div>
                                            <div class="panel-body p-20">
                                                <table class="table table-hover table-bordered">
                                                <thead>
                                                        <tr>
                                                            <th>#</th>
                                                            <th>Subject</th>    
                                                            <th>Marks</th>
                                                        </tr>
                                               </thead>  
                                             <tbody>
<%
	rollid = request.getParameter("rollid");
	classid = request.getParameter("class");

	try
	{
		conn = ConnectionProvider.getCon();
		String query = "SELECT t.StudentName, t.RollId, t.ClassId, t.marks, SubjectId, tblsubjects.SubjectName FROM (SELECT sts.StudentName, sts.RollId, sts.ClassId, tr.marks, SubjectId FROM tblstudents AS sts JOIN tblresult AS tr ON tr.StudentId=sts.StudentId) AS t JOIN tblsubjects ON tblsubjects.id=t.SubjectId WHERE (t.RollId=? AND t.ClassId=?)";
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, rollid);
		pstmt.setString(2, classid);
		rs = pstmt.executeQuery();
		cnt = 1;
		int totlcount = 0;
		int outof = 0;
		if (rs.next())
		{
%>
<!--table>
<thead>
<tr>
<th scope="col">#</th>
<th scope="col">Subject Name</th>
<th scope="col">Marks</th>
</tr>
</thead>
<tbody-->
<%
			//rs.previous();
			
			do{
				flag++;
%>
<tr>
<th scope="row"><%=cnt%></th>
<td><%=rs.getString("SubjectName")%></td>
<td><%=rs.getString("marks")%></td>
</tr>
<%
				totlcount += Integer.parseInt(rs.getString("marks"));
				cnt++;
			}while (rs.next());
			outof = (cnt - 1) * 100;
%>
<tr>
<th scope="row" colspan="2">Total Marks</th>
<td><b><%=totlcount%></b> out of <b><%=outof%></b></td>
</tr>
<tr>
<th scope="row" colspan="2">Percentage</th>
<td><b><%=totlcount * 100 / outof%> %</b></td>
</tr>
<tr>
<th scope="row" colspan="2">Digital Result 2023</th>
<td><b><a titlt="print screen" alt="print screen" onclick="window.print();" target="_blank" style="cursor:pointer;">Print (Digitally Signed)</a></b></td>
</tr>
</tbody>
</table>
<%
		}
		else if(flag==1)
		{
%>
<div class="alert alert-warning left-icon-alert" role="alert">
<strong>Notice!</strong> Your result has not been declared yet.
</div>
<%
		}
	} 
	catch (Exception e) 
	{
		
	}
	if (flag==0) {
%>
<div class="alert alert-danger left-icon-alert" role="alert">
<strong>Oh snap!</strong> Invalid Roll Number.
</div>
<%
}
%>
                                        



                                                	</tbody>
                                                </table>
                                            </div>
                                        </div>
                                        <!-- /.panel -->
                                    </div>
                                    <!-- /.col-md-6 -->

                                </div>
                                <!-- /.row -->
  
                            </div>
                            <!-- /.container-fluid -->
                        </section>
                        <!-- /.section -->

                    </div>
                    <!-- /.main-page -->

                  
                </div>
                <!-- /.content-container -->
            </div>
            <!-- /.content-wrapper -->

        </div>
        <!-- /.main-wrapper -->

        <!-- ========== COMMON JS FILES ========== -->
        <script src="js/jquery/jquery-2.2.4.min.js"></script>
        <script src="js/bootstrap/bootstrap.min.js"></script>
        <script src="js/pace/pace.min.js"></script>
        <script src="js/lobipanel/lobipanel.min.js"></script>
        <script src="js/iscroll/iscroll.js"></script>

        <!-- ========== PAGE JS FILES ========== -->
        <script src="js/prism/prism.js"></script>

        <!-- ========== THEME JS ========== -->
        <script src="js/main.js"></script>
        <script>
            $(function($) {

            });
        </script>

        <!-- ========== ADD custom.js FILE BELOW WITH YOUR CHANGES ========== -->
                <div class="foot"><footer>
    <small>Copyright © Techno India Group </small>
</footer> </div>
    </body>

<style> .foot{text-align: center; */}</style>
</html>
