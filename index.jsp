<%@page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@page import="Project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@page import="javax.sql.*" %>
<%@page import="javax.naming.*" %>
<%
	session.invalidate();
    // Start the session
    session = request.getSession();

    // Get the database connection
    Connection conn = ConnectionProvider.getCon();

    // Set the session variable to empty string if it's not already
    if (session.getAttribute("alogin") != null) 
    {
        session.setAttribute("alogin", null);
    }
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link rel="icon" type="image/x-icon" href="images/favicon.png">
    	<meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Techno India | SRMS</title>
        <link rel="stylesheet" href="css/bootstrap.min.css" media="screen" >
        <link rel="stylesheet" href="css/font-awesome.min.css" media="screen" >
        <link rel="stylesheet" href="css/animate-css/animate.min.css" media="screen" >
        <link rel="stylesheet" href="css/prism/prism.css" media="screen" > <!-- USED FOR DEMO HELP - YOU CAN REMOVE IT -->
        <link rel="stylesheet" href="css/main.css" media="screen" >
        <script src="js/modernizr/modernizr.min.js"></script>
    </head>
    <body class="">
        <div class="main-wrapper">

            <div class="">
                <div class="row">
                <div class="row page-title-div">
                                <div class="col-md-12">              
                                    <h2 class="title" align="center" style="padding-right:25px;"><a  href="index.jsp">
                			    <img align=left style="max-height: 40px; padding-left:25px; " src="images/home.png" ></a>Techno Main Saltlake Result Management System</h2>
                                </div>
                            </div>
 					<!--h1 align="center">Student Result Management System</h1-->
 					
                    <div class="col-lg-6 visible-lg-block">

<section class="section">
                            <div class="row mt-40">
                                <div class="col-md-10 col-md-offset-1 pt-50">

                                    <div class="row mt-30 ">
                                        <div class="col-md-11">
                                            <div class="panel">
                                                <div class="panel-heading">
                                                    <div class="panel-title text-center">
                                                        <h4>For Students</h4>
                                                    </div>
                                                </div>
                                                <div class="panel-body p-20">

                                                    <div class="section-title">
                                                        <p class="sub-title">Search Results for Session 2022-23</p>
                                                    </div>
                                                    <form class="form-horizontal" action="result.jsp" method="post">
                                							<div class="form-group">
                                                    		<label for="rollid" class="col-sm-2 control-label">Roll No.</label>
                                                    		<div class="col-sm-10">
                                                    			<input type="text" name="rollid" required="required" class="form-control" id="inputEmail3" placeholder="Enter your roll number">
                                                    		</div>
                                                    	</div>
                                                    	
														<div class="form-group">
    													<label for="default" class="col-sm-2 control-label">Department</label>
    													<div class="col-sm-10">
    													<select name="class" class="form-control" id="default" required="required">
        												<option value="">Select Department</option>
        												<% 
            											try
        												{
                											// Get the database connection
                											//Connection conn = ConnectionProvider.getCon();
                											// Execute the SQL query to retrieve classes
                											String sql = "SELECT * FROM tbldept";
                											PreparedStatement pstmt = conn.prepareStatement(sql);
                											ResultSet rs = pstmt.executeQuery();

                											// Loop through the result set and generate HTML options
                											while (rs.next())
                											{
                    											String id = rs.getString("id");
                    											String deptName = rs.getString("DeptName");
                    											String shoort = rs.getString("Short");
                    											String optionValue = id;
                    											String optionText = deptName + "(" + shoort + ")";
        												%>
        												<option value="<%= optionValue %>"><%= optionText %></option>
        												<% 
                										}
                										rs.close();
                										pstmt.close();
                										conn.close();
            											}
        												catch (Exception e)
        												{
                											e.printStackTrace();
            											}
       													 %>
   														</select>
   														</div>
														</div>

                                                        <div class="form-group mt-20">
                                                    		<div class="col-sm-offset-2 col-sm-10">

                                                    			<button type="submit" name="login" class="btn btn-success btn-labeled pull-right">Search<span class="btn-label btn-label-right"><i class="fa fa-check"></i></span></button>
                                                    		</div>
                                                    	</div>
                                                        <!--div class="form-group">
                                                            
                                                            <div class="col-sm-6">
                                                               <a href="find-result.jsp"><button type="submit" name="login" class="btn btn-success btn-labeled pull-right">Search<span class="btn-label btn-label-right"><i class="fa fa-check"></i></span></button></a>
                                                            </div>
                                                        </div-->

                                                    </form>




                                                </div>
                                            </div>
                                            <!-- /.panel -->

                                        </div>
                                        <!-- /.col-md-11 -->
                                    </div>
                                    <!-- /.row -->
                                </div>
                                <!-- /.col-md-12 -->
                            </div>
                            <!-- /.row -->
                        </section>
                    </div>
                    <div class="col-lg-6">
                        <section class="section">
                            <div class="row mt-40">
                                <div class="col-md-10 col-md-offset-1 pt-50">

                                    <div class="row mt-30 ">
                                        <div class="col-md-11">
                                            <div class="panel">
                                                <div class="panel-heading">
                                                    <div class="panel-title text-center">
                                                        <h4>Admin Login</h4>
                                                    </div>
                                                </div>
                                                <div class="panel-body p-20">

                                                    <div class="section-title">
                                                        <p class="sub-title"></p>
                                                    </div>

                                                    <form class="form-horizontal" method="post" action="adminLoginAction.jsp">
                                                    	<div class="form-group">
                                                    		<label for="inputEmail3" class="col-sm-2 control-label">Username</label>
                                                    		<div class="col-sm-10">
                                                    			<input type="text" name="username" class="form-control" id="inputEmail3" required="required" placeholder="UserName">
                                                    		</div>
                                                    	</div>
                                                    	<div class="form-group">
                                                    		<label for="inputPassword3" class="col-sm-2 control-label">Password</label>
                                                    		<div class="col-sm-10">
                                                    			<input type="password" name="password" class="form-control" id="inputPassword3" required="required" placeholder="Password">
                                                    		</div>
                                                    	</div>

                                                        <div class="form-group mt-20">
                                                    		<div class="col-sm-offset-2 col-sm-10">

                                                    			<button type="submit" name="login" class="btn btn-success btn-labeled pull-right">Sign in<span class="btn-label btn-label-right"><i class="fa fa-check"></i></span></button>
                                                    		</div>
                                                    	</div>
                                                    </form>




                                                </div>
                                            </div>
                                            <!-- /.panel -->
                                            
                                        </div>
                                        <!-- /.col-md-11 -->
                                    </div>
                                    <!-- /.row -->
                                </div>
                                <!-- /.col-md-12 -->
                            </div>
                            <!-- /.row -->
                        </section>

                    </div>
                    <!-- /.col-md-6 -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /. -->

        </div>
        <!-- /.main-wrapper -->

        <!-- ========== COMMON JS FILES ========== -->
        <script src="js/jquery/jquery-2.2.4.min.js"></script>
        <script src="js/jquery-ui/jquery-ui.min.js"></script>
        <script src="js/bootstrap/bootstrap.min.js"></script>
        <script src="js/pace/pace.min.js"></script>
        <script src="js/lobipanel/lobipanel.min.js"></script>
        <script src="js/iscroll/iscroll.js"></script>

        <!-- ========== PAGE JS FILES ========== -->

        <!-- ========== THEME JS ========== -->
        <script src="js/main.js"></script>
        <script>
            $(function(){

            });
        </script>

        <!-- ========== ADD custom.js FILE BELOW WITH YOUR CHANGES ========== -->
    </body>
    <div class="foot"><footer>
    <small>Copyright © Techno India Group </small>
</footer> </div>

<style> .foot{text-align: center; */}</style>
</html>

