<!DOCTYPE html>
<html>

<head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<title>CreateSalary</title>
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

<p class="auto-style1"><strong>Salary Employee</strong></p>

<form method="post">

	<table style="width: 100%">
		<tr>
			<td style="width: 432px">Salary: </td>
			<td><input name="salary" style="width:100%" type="text" /></td>
		</tr>
		<tr>
			<td style="width: 432px">Overtime: </td>
			<td><input name="overtime" style="width:100%" type="text" /></td>
		</tr>
		<tr>
			<td style="width: 432px">Overtime Rate (per hour): </td>
			<td><input name="overtimeRate" style="width:100%" type="text" /></td>
		</tr>
		<tr>
			<td style="width: 432px">Years Worked: </td>
			<td><input name="yearsWorked" style="width:100%" type="text" /></td>
		</tr>
		<tr>
			<td style="width: 432px">Sick Days: </td>
			<td><input name="sickDays" style="width:100%" type="text" /></td>
		</tr>
		<tr>
			<td style="width: 432px">Sick Days Taken: </td>
			<td><input name="sickDaysTaken" style="width:100%" type="text" /></td>
		</tr>
		<tr>
			<td style="width: 432px">Vacation Days: </td>
			<td><input name="vacationDays" style="width:100%" type="text" /></td>
		</tr>
		<tr>
			<td style="width: 432px">Bonus: </td>
			<td><input name="bonus" style="width:100%" type="text" /></td>
		</tr>
	</table>

	<div class="wrapper">
		<button name="Create">Create</button>
	</div>

</form>

</body>

</html>
