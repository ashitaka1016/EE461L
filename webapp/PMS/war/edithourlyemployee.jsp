<%@ page import="com.googlecode.objectify.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.example.pms.Employer" %>
<%@ page import="com.example.pms.Employee" %>

<!DOCTYPE html>
<html>

<head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<title>Edit Hourly Employee</title>
<style type="text/css">
.auto-style1 {
	text-align: center;
	font-size: x-large;
}

.wrapper {
    text-align: center;
}

.Create {
    position: absolute;
    top: 50%;
}
</style>

</head>

<body style="height: 451px">

<form action ="dashboard.jsp">
	<div>
		<input height="38" name="Image1" src="images/HomeButton.png" type="image" width="57">
	</div>
</form>

<p class="auto-style1"><strong>Edit Hourly Employee</strong></p>

<%	
	Employee e = (Employee)request.getSession().getAttribute("currentEmployee");
%>

<form action="/edithourly" method="post">

<table style="width: 100%">
	<tr>
		<td style="width: 432px">Expected Hours: </td>
		<td><input name="expectedHours" style="width:100%" type="text" value="<% out.print(e.getExpectedHours()); %>"/></td>
	</tr>
	<tr>
		<td style="width: 432px">Hours Worked: </td>
		<td><input name="hours" style="width:100%" type="text" value="<% out.print(e.getHours()); %>"/></td>
	</tr>
	<tr>
		<td style="width: 432px">Pay Rate (per hour): </td>
		<td><input name="payRate" style="width:100%" type="text" value="<% out.print(e.getPayRate()); %>"/></td>
	</tr>
	<tr>
		<td style="width: 432px">Years Worked: </td>
		<td><input name="yearsWorked" style="width:100%" type="text" value="<% out.print(e.getYearsWorked()); %>"/></td>
	</tr>
	<tr>
		<td style="width: 432px">Sick Days: </td>
		<td><input name="sickDays" style="width:100%" type="text" value="<% out.print(e.getSickedDays()); %>"/></td>
	</tr>
	<tr>
		<td style="width: 432px">Bonus: </td>
		<td><input name="bonus" style="width:100%" type="text" value="<% out.print(e.getBonus()); %>"/></td>
	</tr>
</table>

<div class="wrapper">
	<button name="Create">Save</button>
</div>

</form>

</body>

</html>
