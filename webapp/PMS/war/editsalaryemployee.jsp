<%@ page import="com.googlecode.objectify.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.example.pms.Employer" %>
<%@ page import="com.example.pms.Employee" %>


<!DOCTYPE html>
<html>

<head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<title>EditSalaryEmployee</title>
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

<form action ="dashboard.jsp" method="post">
	<div>
		<input height="38" name="Image1" src="images/HomeButton.png" type="image" width="57">
	</div>
</form>

<p class="auto-style1"><strong>Edit Salary Employee</strong></p>

<%	ObjectifyService.register(Employee.class);
	Employee e = ObjectifyService.ofy().load().type(Employee.class).id((String)request.getSession().getAttribute("employee")).get();
%>

<form action="/edit" method="post">
<table style="width: 100%">

	<tr>
		<td style="width: 432px">Salary: </td>
		<td><input name="salary" style="width:100%" type="text" value="<% out.print(e.getSalary()); %>" /></td>
	</tr>
	<tr>
		<td style="width: 432px">Overtime: </td>
		<td><input name="overtime" style="width:100%" type="text" value="<% out.print(e.getOvertime()); %>" /></td>
	</tr>
	<tr>
		<td style="width: 432px">Overtime Rate (per hour): </td>
		<td><input name="overtimeRate" style="width:100%" type="text" value="<% out.print(e.getOvertimeRate()); %>"/></td>
	</tr>
	<tr>
		<td style="width: 432px">Years Worked: </td>
		<td><input name="yearsWorked" style="width:100%" type="text" value="<% out.print(e.getYearsWorked()); %>"/></td>
	</tr>
	<tr>
		<td style="width: 432px">Sick Days: </td>
		<td><input name="sickDays" style="width:100%" type="text" value="<% out.print(e.getSickDays()); %>"/></td>
	</tr>
	<tr>
		<td style="width: 432px">Sick Days Taken: </td>
		<td><input name="sickDaysTaken" style="width:100%" type="text" value="<% out.print(e.getSickDaysTaken()); %>"/></td>
	</tr>
	<tr>
		<td style="width: 432px">Vacation Days: </td>
		<td><input name="vacationDays" style="width:100%" type="text" value="<% out.print(e.getVacDays()); %>"/></td>
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
