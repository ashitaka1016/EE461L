<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.googlecode.objectify.*" %>
<%@ page import="com.example.pms.Employee" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>

<head>
<meta content="en-us" http-equiv="Content-Language" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<title>Welcome back</title>

<style type="text/css">
.auto-style1 {
	text-align: right;
	font-size: xx-large;
}
.auto-style3 {
	text-align: left;
}
.auto-style4 {
	text-align: center;
}
.auto-style6 {
	text-align: center;
	font-size: x-large;
}
</style>

</head>


<body style="height: 451px">


<form action ="dashboard.jsp">
	<div>
		<input height="38" name="Image1" src="images/HomeButton.png" type="image" width="57">
	</div>
</form>

<% String name = (String) request.getSession().getAttribute("employerName"); 

	if((name == null) || (name.equals(""))) {
%>

<p class="auto-style1">
Welcome back!</p>

<% } else { %>

<p class="auto-style1">
Welcome back, <% out.print(name); %>!</p>

<% } %>

	<div class="auto-style4" style="width: 222px; height: 360px;">
		<p class="auto-style6" style="width: 216px">Menu</p>
		<hr class="auto-style3" style="width: 214px" />
		
		<div id="layer1" style="position: absolute; width: 644px; height: 170px; z-index: 1; left: 241px; top: 136px" class="auto-style3">
			<p>Name: <%if(request.getSession().getAttribute("currentEmployee") != null) { out.print(((Employee)request.getSession().getAttribute("currentEmployee")).getName()); }%></p>
			<p>ID: <%if(request.getSession().getAttribute("currentEmployee") != null) { out.print(((Employee)request.getSession().getAttribute("currentEmployee")).getID()); }%></p>
			<p>Last Paid On: </p>
			<p>Upcoming Payment Date: </p>
		</div>
				
		<form action="create.jsp">
			<button name="CreateEmployeeBtn" style="height:20px;width:200px">Create Employee</button>
		</form>
		
		<form action="selectemployee.jsp" method="post">
			<button name="EditEmployeeInfoBtn" style="height:20px;width:200px">Edit Employee Info</button>
		</form>

		<form action="demo_form.asp" method="post">
			<button name="ViewTimelineBtn" style="height:20px;width:200px">View Timeline</button>
		</form>
		
		<form action="demo_form.asp" method="post">
			<button name="DisplaySummaryBtn" style="height:20px;width:200px">Display Summary</button>
		</form>
						
	</div>
	
	<div id="layer2" style="position: absolute; width: 206px; height: 22px; z-index: 2; left: 250px; top: 98px">
		<form action="/create" method="get">
			<input name="EmployeeSearch" style="width: 194px" type="text" value="Enter Employee ID" />
		</form>
	</div>

	<div><p><font color="red">Invalid ID</p></div>

</body>


</html>