<%@ page import="com.googlecode.objectify.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.example.pms.Employer" %>
<%@ page import="com.example.pms.Employee" %>
<%@ page import="com.example.pms.SalaryEmployee" %>

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

.column {
    text-align: left;
    color: gray;
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

<p class="auto-style1"><strong>Edit Salary Employee</strong></p>

<form action="/editsalary" method="post">

	<table style="width: 100%">
		<tr>
			<td style="width: 432px">Salary: </td>
			<td class="column"><% out.print(((SalaryEmployee)request.getSession().getAttribute("currentEmployee")).getSalary()); %></td>
			<td><input name="salary" style="width:100%" type="text" placeholder="Enter new value here."/></td>
		</tr>
		<tr>
			<td style="width: 432px">Overtime: </td>
			<td class="column"><% out.print(((SalaryEmployee)request.getSession().getAttribute("currentEmployee")).getOvertime()); %></td>
			<td><input name="overtime" style="width:100%" type="text" placeholder="Enter new value here."/></td>
		</tr>
		<tr>
			<td style="width: 432px">Overtime Rate (per hour): </td>
			<td class="column"><% out.print(((SalaryEmployee)request.getSession().getAttribute("currentEmployee")).getOvertimeRate()); %></td>
			<td><input name="overtimeRate" style="width:100%" type="text" placeholder="Enter new value here."/></td>
		</tr>
		<tr>
			<td style="width: 432px">Years Worked: </td>
			<td class="column"><% out.print(((SalaryEmployee)request.getSession().getAttribute("currentEmployee")).getYearsWorked()); %></td>
			<td><input name="yearsWorked" style="width:100%" type="text" placeholder="Enter new value here."/></td>
		</tr>
		<tr>
			<td style="width: 432px">Sick Days: </td>
			<td class="column"><% out.print(((SalaryEmployee)request.getSession().getAttribute("currentEmployee")).getSickDays()); %></td>
			<td><input name="sickDays" style="width:100%" type="text" placeholder="Enter new value here."/></td>
		</tr>
		<tr>
			<td style="width: 432px">Sick Days Taken: </td>
			<td class="column"><% out.print(((SalaryEmployee)request.getSession().getAttribute("currentEmployee")).getSickDaysTaken()); %></td>
			<td><input name="sickDaysTaken" style="width:100%" type="text" placeholder="Enter new value here."/></td>
		</tr>
		<tr>
			<td style="width: 432px">Vacation Days: </td>
			<td class="column"><% out.print(((SalaryEmployee)request.getSession().getAttribute("currentEmployee")).getVacDays()); %></td>
			<td><input name="vacationDays" style="width:100%" type="text" placeholder="Enter new value here."/></td>
		</tr>

		<tr>
			<td style="width: 432px">Bonus: </td>
			<td class="column"><% out.print(((SalaryEmployee)request.getSession().getAttribute("currentEmployee")).getBonus()); %></td>
			<td><input name="bonus" style="width:100%" type="text" placeholder="Enter new value here."/></td>
		</tr>
	</table>

	<div class="wrapper">
		<input type="submit" value="Save"/>
	</div>

</form>

</body>

</html>
