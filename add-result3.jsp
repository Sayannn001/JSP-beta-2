<%@page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@page import="Project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@page import="javax.sql.*" %>
<%@page import="java.io.*" %>
<%@page import="javax.naming.*" %>
<%
	ResultSet rs=null;
	if (session.getAttribute("alogin") != null) 
	{
		String optionValue="";
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width, initial-scale=1">
        <title>SRMS Admin| Add Result </title>
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
                                    <h2 class="title">Declare Result</h2>
                                
                                </div>
                                
                                <!-- /.col-md-6 text-right -->
                            </div>
                            <!-- /.row -->
                            <div class="row breadcrumb-div">
                                <div class="col-md-6">
                                    <ul class="breadcrumb">
                                        <li><a href="dashboard.jsp"><i class="fa fa-home"></i> Home</a></li>
                                
                                        <li class="active">Student Result</li>
                                    </ul>
                                </div>
                             
                            </div>
                            <!-- /.row -->
                        </div>
                        <div class="container-fluid">
                           
                        <div class="row">
                                    <div class="col-md-12">
                                        <div class="panel">
                                           
                                            <div class="panel-body">
<!-- ?php if($msg){?>
<div class="alert alert-success left-icon-alert" role="alert">
 <strong>Well done!</strong><?php echo htmlentities($msg); ?>
 </div><?php } 
else if($error){?>
    <div class="alert alert-danger left-icon-alert" role="alert">
                                            <strong>Oh snap!</strong> <?php echo htmlentities($error); ?>
                                        </div>
                                        <?php } ?-->
                                                <form class="form-horizontal" method="post" action="create-result.jsp">

 <div class="form-group">
<label for="default" class="col-sm-2 control-label">Class</label>
 <div class="col-sm-10">
 <% 
            											try
        												{
                											// Get the database connection
                											Connection conn = ConnectionProvider.getCon();
                											// Execute the SQL query to retrieve classes
                											PreparedStatement pstmt = null;
                											String ClassId=request.getParameter("classid");
                											String query = "SELECT ClassName,Section FROM tbldept where id=?";
                											pstmt = conn.prepareStatement(query);
                											pstmt.setString(1,ClassId);
                											rs = pstmt.executeQuery();
                											rs.next();
        												%>
 <input type="text" name="class" class="form-control clid" id="classid"  readonly value="<%= rs.getString("ClassName") + " (" + rs.getString("Section") +")"%>">
 <%
															String StudentId=request.getParameter("studentid");
 															query = "SELECT StudentName FROM tblstudents where StudentId=?";
                											pstmt = conn.prepareStatement(query);
                											pstmt.setString(1,StudentId);
                											rs = pstmt.executeQuery();
                											rs.next();
                											
%>
		</div>
	</div>
	
<input type="hidden" name="clid" id="clid" value="<%=ClassId %>">	
<input type="hidden" name="stid" id="stid" value="<%=StudentId %>">	
 <div class="form-group">
<label for="default" class="col-sm-2 control-label">Student Name</label>
 <div class="col-sm-10">
 <input type="text" name="studentname" class="form-control clid" id="studentname"  readonly value="<%= rs.getString("StudentName")%>">       												

                                                        </div>
                                                    </div>           

                                                    <div class="form-group">
                                                      
                                                        <div class="col-sm-10">
                                                    <div  id="reslt">
                                                    </div>
                                                        </div>
                                                    </div>
<%
	query = "SELECT * FROM tblresult where StudentId=?";
	pstmt = conn.prepareStatement(query);
	pstmt.setString(1,StudentId);
	rs = pstmt.executeQuery();
	if(rs.next())
	{
		session.setAttribute("noresult",true);
		response.sendRedirect("add-result.jsp");
	}
	else
	{
		query = "SELECT tblsubjects.SubjectName,tblsubjects.id FROM tblsubjectcombination join  tblsubjects on  tblsubjects.id=tblsubjectcombination.SubjectId WHERE tblsubjectcombination.ClassId=? order by tblsubjects.SubjectName";
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1,ClassId);
		rs = pstmt.executeQuery();
		int count=0;
		while(rs.next())
		{
			count++;
			
%>
<input type="hidden" name="suid" id="suid" value="<%=rs.getString("id") %>">	
<div class="form-group">
                                                        <label for="date" class="col-sm-2 control-label">Subject <%=count %></label>
                                                        <div class="col-sm-10">
                                                    <div  id="subject">
                                                    <p><%=rs.getString("SubjectName") %><input type="text" name="marks[]" value="" class="form-control" required="required" placeholder="Enter marks out of 100" autocomplete="off" control-id="ControlID-4"></p>

                                                    </div>
                                                        </div>
                                                    </div>
<%} }%>

                                                    
                                                    <div class="form-group">
                                                        <div class="col-sm-offset-2 col-sm-10">
                                                            <button type="submit" name="submit" id="submit" class="btn btn-primary">Declare Result</button>
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
