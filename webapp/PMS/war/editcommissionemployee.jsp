<%@ page import="com.googlecode.objectify.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.example.pms.Employer" %>
<%@ page import="com.example.pms.Employee" %>
<%@ page import="com.example.pms.CommissionEmployee" %>

<!DOCTYPE html>
<html>

<head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<title>Edit Commission Employee</title>
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

<p class="auto-style1"><strong>Edit Commission Employee</strong></p>

<form action="/editcommission" method="post">

<table style="width: 100%">
	<tr>
		<td style="width: 432px">Sales (in dollars): </td>
		<td><input name="sales" style="width:100%" type="text"/></td>
	</tr>
	<tr>
		<td style="width: 432px">Commission Rate (as percent): </td>
		<td><input name="commissionRate" style="width:100%" type="text"/></td>
	</tr>
	<tr>
		<td style="width: 432px">Previous Years Sales: </td>
		<td><input name="previousYearSales" style="width:100%" type="text"/></td>
	</tr>
	<tr>
		<td style="width: 432px">Max Sales: </td>
		<td><input name="maxSales" style="width:100%" type="text"/></td>
	</tr>
	<tr>
		<td style="width: 432px">Years Worked: </td>
		<td><input name="yearsWorked" style="width:100%" type="text"/></td>
	</tr>
	<tr>
		<td style="width: 432px">Sick Days: </td>
		<td><input name="sickDays" style="width:100%" type="text"/></td>
	</tr>
	<tr>
		<td style="width: 432px">Bonus: </td>
		<td><input name="bonus" style="width:100%" type="text"/></td>
	</tr>
</table>

<div class="wrapper">
	<button name="Create">Save</button>
</div>

</form>

</body>

</html>
