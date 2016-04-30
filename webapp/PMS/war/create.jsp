<!DOCTYPE html>
<html>

<head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<title>CreateEmployee</title>
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


<p class="auto-style1"><strong>Create New Employee</strong></p>

<form action="/create" method="post">

	<table style="width: 100%">
		<tr>
			<td style="width: 394px">Name:</td>
			<td><input name="name" style="width:100%" type="text" /></td>
		</tr>
		<tr>
			<td style="width: 394px">ID:</td>
			<td><input name="id" style="width:100%" type="text" /></td>
		</tr>
		<tr>
			<td style="width: 394px">Employee Type:</td>
			<td><select name="type" style="width:100%">
					<option value="Salary">Salary</option>
					<option value="Hourly">Hourly</option>
					<option value="Commission">Commission</option>
				</select></td>
		</tr>	
	</table>

	<div class="wrapper">
		<button name="Create">Create</button>
	</div>

</form>

</body>

</html>