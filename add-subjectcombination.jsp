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
		PreparedStatement pstmt = null;
		ResultSet rs = null;
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width, initial-scale=1">
        <title>TMSL | Add Subject Combination</title>
        <link rel="icon" type="image/x-icon" href="images/favicon.png">
        <link rel="stylesheet" href="css/bootstrap.min.css" media="screen" >
        <link rel="stylesheet" href="css/font-awesome.min.css" media="screen" >
        <link rel="stylesheet" href="css/animate-css/animate.min.css" media="screen" >
        <link rel="stylesheet" href="css/lobipanel/lobipanel.min.css" media="screen" >
        <link rel="stylesheet" href="css/prism/prism.css" media="screen" >
        <link rel="stylesheet" href="css/select2/select2.min.css" >
        <link rel="stylesheet" href="css/main.css" media="screen" >
        <script src="js/modernizr/modernizr.min.js"></script>
    </head>
    <body class="top-navbar-fixed">
        <div class="main-wrapper">

            <!-- ========== TOP NAVBAR ========== -->
            <!-- ========== TOP NAVBAR ========== -->
            <nav class="navbar top-navbar bg-white box-shadow">
            	<div class="container-fluid">
                    <div class="row">
                        <div class="navbar-header no-padding">
                        
                			<a class="navbar-brand" href="dashboard.jsp">
                			    <img style="max-height: 120%" src="images/home.png" >
                			</a>
                			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse-1" aria-expanded="false">
                				<span class="sr-only">Toggle navigation</span>
                				<i class="fa fa-ellipsis-v"></i>
                			</button>
                            <button type="button" class="navbar-toggle mobile-nav-toggle">
                				<i class="fa fa-bars"></i>
                			</button>
                		</div>
                        <!-- /.navbar-header -->

                		<div class="collapse navbar-collapse" id="navbar-collapse-1">
                			<ul class="nav navbar-nav" data-dropdown-in="fadeIn" data-dropdown-out="fadeOut">
                				<!--li class="hidden-xs hidden-xs"><!-- <a href="#">My Tasks</a>></li-->
                               
                			</ul>
                            <!-- /.nav navbar-nav -->

                			<ul class="nav navbar-nav navbar-right" data-dropdown-in="fadeIn" data-dropdown-out="fadeOut">
                             
                				
                				    <li><a href="logout.jsp" class="color-danger text-center"><i class="fa fa-sign-out"></i> Logout</a></li>
                					
                		
                            
                			</ul>
                            <!-- /.nav navbar-nav navbar-right -->
                		</div>
                		<!-- /.navbar-collapse -->
                    </div>
                    <!-- /.row -->
            	</div>
            	<!-- /.container-fluid -->
            </nav>  
          <!-----End Top bar>
            <!-- ========== WRAPPER FOR BOTH SIDEBARS & MAIN CONTENT ========== -->
            <div class="content-wrapper">
                <div class="content-container">

                    <!-- ========== LEFT SIDEBAR ========== -->
                   <div class="left-sidebar bg-black-300 box-shadow">
                        <div class="sidebar-content">
                            <div class="user-info">
                                <img src="http://placehold.it/90/c2c2c2?text=Admin" alt="User" class="img-circle profile-img">
                                <h6 class="title">Administrator</h6>
                                <small class="info">TMSL</small>
                            </div>
                            <!-- /.user-info -->

                            <div class="sidebar-nav">
                                <ul class="side-nav color-gray">
                                    <li class="nav-header">
                                        <span class="">Main</span>
                                    </li>
                                    <li>
                                        <a href="dashboard.jsp"><i class="fa fa-dashboard"></i> <span>Dashboard</span> </a>
                                     
                                    </li>

                                    <li class="nav-header">
                                        <span class="">Options</span>
                                    </li>
                                    <li class="has-children">
                                        <a href="#"><i class="fa fa-file-text"></i> <span>Departments</span> <i class="fa fa-angle-right arrow"></i></a>
                                        <ul class="child-nav" style="display: none;">
                                            <li><a href="add-department.jsp"><i class="fa fa-bars"></i> <span>Add Department</span></a></li>
                                            <li><a href="manage-departments.jsp"><i class="fa fa fa-server"></i> <span>Manage Department</span></a></li>
                                           
                                        </ul>
                                    </li>
  <li class="has-children">
                                        <a href="#"><i class="fa fa-file-text"></i> <span>Subjects</span> <i class="fa fa-angle-right arrow"></i></a>
                                        <ul class="child-nav" style="display: none;">
                                            <li><a href="add-subject.jsp"><i class="fa fa-bars"></i> <span>Add Subject</span></a></li>
                                            <li><a href="manage-subjects.jsp"><i class="fa fa fa-server"></i> <span>Manage Subjects</span></a></li>
                                           <li><a href="add-subjectcombination.jsp"><i class="fa fa-newspaper-o"></i> <span>Add Subject Combination </span></a></li>
                                           <a href="manage-subjectcombination.jsp"><i class="fa fa-newspaper-o"></i> <span>Manage Subject Combination </span></a>
                                        </ul>
                                    </li>
   <li class="has-children">
                                        <a href="#"><i class="fa fa-users"></i> <span>Students</span> <i class="fa fa-angle-right arrow"></i></a>
                                        <ul class="child-nav" style="display: none;">
                                            <li><a href="add-students.jsp"><i class="fa fa-bars"></i> <span>Add Students</span></a></li>
                                            <li><a href="manage-students.jsp"><i class="fa fa fa-server"></i> <span>Manage Students</span></a></li>
                                           
                                        </ul>
                                    </li>
<li class="has-children">
                                        <a href="#"><i class="fa fa-info-circle"></i> <span>Result</span> <i class="fa fa-angle-right arrow"></i></a>
                                        <ul class="child-nav" style="display: none;">
                                            <li><a href="add-result.jsp"><i class="fa fa-bars"></i> <span>Add Result</span></a></li>
                                            <li><a href="manage-results.jsp"><i class="fa fa fa-server"></i> <span>Manage Result</span></a></li>
                                           
                                        </ul>
                                        </li><li><a href="change-password.jsp"><i class="fa fa fa-server"></i> <span> Admin Change Password</span></a></li>
                                           
                                    
                            </ul></div>
                            <!-- /.sidebar-nav -->
                        </div>
                        <!-- /.sidebar-content -->
                    </div>                
 <!-- /.left-sidebar -->

                    <div class="main-page">

                     <div class="container-fluid">
                            <div class="row page-title-div">
                                <div class="col-md-6">
                                    <h2 class="title">Add Subject Combination</h2>
                                
                                </div>
                                
                                <!-- /.col-md-6 text-right -->
                            </div>
                            <!-- /.row -->
                            <div class="row breadcrumb-div">
                                <div class="col-md-6">
                                    <ul class="breadcrumb">
                                        <li><a href="dashboard.jsp"><i class="fa fa-home"></i> Home</a></li>
                                        <li><a href="manage-subjects.jsp"> Subjects</a></li>
                                        <li class="active">Add Subject Combination</li>
                                    </ul>
                                </div>
                             
                            </div>
                            <!-- /.row -->
                        </div>
                        <div class="container-fluid">
                           
                        <div class="row">
                                    <div class="col-md-12">
                                        <div class="panel">
                                            <div class="panel-heading">
                                                <div class="panel-title">
                                                    <h5>Add Subject Combination</h5>
                                                </div>
                                            </div>
                                            <div class="panel-body">
                                            <%try 
											{
												if(session.getAttribute("update")!=null)
												{
								
											%>
											<div class="alert alert-success left-icon-alert" role="alert">
 											<strong>Record updated successfully</strong>
 											</div>
 											<%
 												session.setAttribute("update",null);
												}
												else if(session.getAttribute("updateno")!=null && session.getAttribute("error")!=null)
						                        {
						                        	session.setAttribute("updateno",null);
						                        	session.setAttribute("error",null);
						                        	%>
						                        	
						                        	<div class="alert alert-danger left-icon-alert" role="alert">
														<strong>Record creation failed!</strong> SQL Error.
													</div>
						                        	<%
						                        }
												else if(session.getAttribute("updateno")!=null && session.getAttribute("duplicate")!=null)
						                        {
						                        	session.setAttribute("updateno",null);
						                        	session.setAttribute("duplicate",null);
						                        	%>
						                        	
						                        	<div class="alert alert-danger left-icon-alert" role="alert">
														<strong>Record creation failed!</strong> The combination already exists.
													</div>
						                        	<%
						                        }

											}
                                            catch(Exception e)
                                            {
                                                   e.printStackTrace();                                	
                                            }
											%>
                                                <form class="form-horizontal" method="post" action="create-subjectcombination.jsp">
                                                    <div class="form-group">
                                                        <label for="default" class="col-sm-2 control-label">Department</label>
                                                        <div class="col-sm-10">
														<select name="department" class="form-control" id="default" required="required">
        												<option value="">Select Department</option>
        												<% 
            											try
        												{
                											// Get the database connection
                											Connection conn = ConnectionProvider.getCon();
                											// Execute the SQL query to retrieve classes
                											String sql = "SELECT * FROM tbldept";
                											pstmt = conn.prepareStatement(sql);
                											rs = pstmt.executeQuery();

                											// Loop through the result set and generate HTML options
                											while (rs.next())
                											{
                    											String id = rs.getString("id");
                    											String deptname = rs.getString("DeptName");
                    											String shhort = rs.getString("Short");
                    											String optionValue = id;
                    											String optionText = deptname + "(" + shhort + ")";
        												%>
        												<option value="<%= optionValue %>"><%= optionText %></option>
        												<% 
                										}
       													 %>
   														</select>
                                                        </div>
                                                    </div>
                                                    
                                                    
                                                    <div class="form-group">
                                                        <label for="default" class="col-sm-2 control-label">Subject</label>
                                                        <div class="col-sm-10">
														<select name="subject" class="form-control" id="default" required="required">
        												<option value="">Select Subject</option>
        												<% 
            												sql = "SELECT * FROM tblsubjects";
                											pstmt = conn.prepareStatement(sql);
                											rs = pstmt.executeQuery();

                											// Loop through the result set and generate HTML options
                											while (rs.next())
                											{
                    											String id = rs.getString("id");
                    											String SubjectName = rs.getString("SubjectName");
                    											String SubjectCode = rs.getString("SubjectCode");
                    											
        												%>
        												<option value="<%= id %>"><%= SubjectName + "(" + SubjectCode + ")" %></option>
        												<% 
                										}
       													 %>
   														</select>
                                                        </div>
                                                    </div>

                                                    

                                                    
                                                    <div class="form-group">
                                                        <div class="col-sm-offset-2 col-sm-10">
                                                            <button type="submit" name="submit" class="btn btn-primary">Add</button>
                                                        </div>
                                                    </div>
                                                </form>

                                            </div>
                                        </div>
                                    </div>
                                    <!-- /.col-md-12 -->
                                </div>
                    </div>
                </div>
                <!-- /.content-container -->
            </div>
            <!-- /.content-wrapper -->
        </div>
        <!-- /.main-wrapper -->
        <script src="js/jquery/jquery-2.2.4.min.js"></script>
        <script src="js/bootstrap/bootstrap.min.js"></script>
        <script src="js/pace/pace.min.js"></script>
        <script src="js/lobipanel/lobipanel.min.js"></script>
        <script src="js/iscroll/iscroll.js"></script>
        <script src="js/prism/prism.js"></script>
        <script src="js/select2/select2.min.js"></script>
        <script src="js/main.js"></script>
        <script>
            $(function($) {
                $(".js-states").select2();
                $(".js-states-limit").select2({
                    maximumSelectionLength: 2
                });
                $(".js-states-hide").select2({
                    minimumResultsForSearch: Infinity
                });
            });
        </script>
    </body>
        <div class="foot"><footer>
    <small>Copyright © Techno India Group </small>
</footer> </div>

<style> .foot{text-align: center; */}</style>
<%
		}
catch(Exception e)
{
}
	}
else
	{
		%>
		<script>
		alert("Invalid Session! Please Login to continue.");
		window.location.href = "index.jsp";
		</script>
	<%}%>
</html>
