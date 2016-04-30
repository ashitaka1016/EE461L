<!DOCTYPE html>
<html>

<head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<title>CreateHourly</title>

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

<p class="auto-style1"><strong>Hourly Employee</strong></p>


<form method="post">

	<table style="width: 100%">
		<tr>
			<td style="width: 432px">Expected Hours: </td>
			<td><input name="expectedHours" style="width:100%" type="text" /></td>
		</tr>
		<tr>
			<td style="width: 432px">Hours Worked: </td>
			<td><input name="hoursWorked" style="width:100%" type="text" /></td>
		</tr>
		<tr>
			<td style="width: 432px">Pay Rate (per hour): </td>
			<td><input name="payRate" style="width:100%" type="text" /></td>
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
			<td style="width: 432px">Expected Hours: </td>
			<td><input name="expectedHours" style="width:100%" type="text" /></td>
		</tr>
		<tr>
			<td style="width: 432px">Bonus: </td>
			<td><input name="bonus" style="width:100%" type="text" /></td>
		</tr>
	</table>

	<div class="wrapper">
		<button name="create">Create</button>
	</div>

</form>

</body>

</html>
