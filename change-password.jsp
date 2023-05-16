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
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width, initial-scale=1">
        <title>TMSL | Admin change password</title>
        <link rel="icon" type="image/x-icon" href="images/favicon.png">
        <link rel="stylesheet" href="css/bootstrap.css" media="screen" >
        <link rel="stylesheet" href="css/font-awesome.min.css" media="screen" >
        <link rel="stylesheet" href="css/animate-css/animate.min.css" media="screen" >
        <link rel="stylesheet" href="css/lobipanel/lobipanel.min.css" media="screen" >
        <link rel="stylesheet" href="css/prism/prism.css" media="screen" > <!-- USED FOR DEMO HELP - YOU CAN REMOVE IT -->
        <link rel="stylesheet" href="css/main.css" media="screen" >
        <script src="js/modernizr/modernizr.min.js"></script>
        <script type="text/javascript">
function valid()
{
if(document.chngpwd.newpassword.value!= document.chngpwd.confirmpassword.value)
{
alert("New Password and Confirm Password Field do not match! Please check and try again.");
document.chngpwd.confirmpassword.focus();
return false;
}
else if(document.chngpwd.newpassword.value == document.chngpwd.password.value)
{
	alert("New password and current password are same! Please check and try again.");
	document.chngpwd.newpassword.focus();
	return false;
}
return true;
}
</script>
         <style>
        .errorWrap {
    padding: 10px;
    margin: 0 0 20px 0;
    background: #fff;
    border-left: 4px solid #dd3d36;
    -webkit-box-shadow: 0 1px 1px 0 rgba(0,0,0,.1);
    box-shadow: 0 1px 1px 0 rgba(0,0,0,.1);
}
.succWrap{
    padding: 10px;
    margin: 0 0 20px 0;
    background: #fff;
    border-left: 4px solid #5cb85c;
    -webkit-box-shadow: 0 1px 1px 0 rgba(0,0,0,.1);
    box-shadow: 0 1px 1px 0 rgba(0,0,0,.1);
}
        </style>
    </head>
    <body class="top-navbar-fixed">
        <div class="main-wrapper">
            <div class="content-wrapper">
                <div class="content-container">                  
 <!-- /.left-sidebar -->
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
                    <div class="main-page">
                        <div class="container-fluid">
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
            
            
                            <div class="row page-title-div">
                            
                            
                                <div class="col-md-6">
                                    <h2 class="title">Admin Change Password</h2>
                                </div>
                                
                            </div>
                            
                            <!-- /.row -->
                            <div class="row breadcrumb-div">
                                <div class="col-md-6">
                                    <ul class="breadcrumb">
            							<li><a href="dashboard.jsp"><i class="fa fa-home"></i> Home</a></li>
            						
            							<li class="active">Admin change password</li>
            						</ul>
                                </div>
                               
                            </div>
                            
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
                                                    <h5>Admin Change Password</h5>
                                                </div>
                                            </div>
<%
		try 
		{
			String newpassword=request.getParameter("newpassword");
			if(session.getAttribute("pass")!=null)
			{
								
				%>
				<div class="alert alert-success left-icon-alert" role="alert">
 					<strong>Password Successfully Updated!</strong>
 					</div>
 				<%
 				session.setAttribute("pass",null);
			}
			if(session.getAttribute("passno")!=null)
			{%>
				
    <div class="alert alert-danger left-icon-alert" role="alert">
                                            <strong>Oh snap!</strong>
                                            
                                        </div>
                                        <%session.setAttribute("passno",null);
                                        } %>
  
                                            <div class="panel-body">

                                                <form  name="chngpwd" method="post" onSubmit="return valid();" action="update-password.jsp">
                                                    <div class="form-group has-success">
                                                        <label for="success" class="control-label">Current Password</label>
                                                		<div class="">
                                    <input type="password" name="password" class="form-control" required="required" id="success">
                                                      
                                                		</div>
                                                	</div>
                                                       <div class="form-group has-success">
                                                        <label for="success" class="control-label">New Password</label>
                                                        <div class="">
                                                            <input type="password" name="newpassword" required="required" class="form-control" id="success">
                                                        </div>
                                                    </div>
                                                     <div class="form-group has-success">
                                                        <label for="success" class="control-label">Confirm Password</label>
                                                        <div class="">
                                                            <input type="password" name="confirmpassword" class="form-control" required="required" id="success">
                                                        </div>
                                                    </div>
  <div class="form-group has-success">

                                                        <div class="">
                                                           <button type="submit" name="submit" class="btn btn-success btn-labeled">Change<span class="btn-label btn-label-right"><i class="fa fa-check"></i></span></button>
                                                    </div>


                                                    
                                                </form>

                                              
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /.col-md-8 col-md-offset-2 -->
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
        <script src="js/jquery-ui/jquery-ui.min.js"></script>
        <script src="js/bootstrap/bootstrap.min.js"></script>
        <script src="js/pace/pace.min.js"></script>
        <script src="js/lobipanel/lobipanel.min.js"></script>
        <script src="js/iscroll/iscroll.js"></script>

        <!-- ========== PAGE JS FILES ========== -->
        <script src="js/prism/prism.js"></script>

        <!-- ========== THEME JS ========== -->
        <script src="js/main.js"></script>



        <!-- ========== ADD custom.js FILE BELOW WITH YOUR CHANGES ========== -->
    </body>
        <div class="foot"><footer>
    <small>Copyright © Techno India Group </small>
</footer> </div>

<style> .foot{text-align: center; */}</style>
</html>
<%}
		catch(Exception e)
		{
			e.printStackTrace();
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

