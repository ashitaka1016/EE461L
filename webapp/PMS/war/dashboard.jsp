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


<form action ="dashboard.jsp" method="post">
	<div>
		<input height="38" name="Image1" src="HomButton.png" type="image" width="57">
	</div>
</form>

<p class="auto-style1">
Welcome back... !</p>
	<div class="auto-style4" style="width: 222px; height: 360px;">
		<p class="auto-style6" style="width: 216px">Menu</p>
		<hr class="auto-style3" style="width: 214px" />
		
		<div id="layer1" style="position: absolute; width: 644px; height: 170px; z-index: 1; left: 241px; top: 136px" class="auto-style3">
			<p>Name: </p>
			<p>ID: </p>
			<p>Last Paid On: </p>
			<p>Upcoming Payment Date: </p>
		</div>
				
		<form action="demo_form.asp" method="post">
			<button name="CreateEmployeeBtn" style="height:20px;width:200px">Create Employee</button>
		</form>
		
		<form action="demo_form.asp" method="post">
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
		<form method="post">
			<input name="EmployeeSearch" style="width: 194px" type="text" value="Enter Employee Name" /></form>
	</div>

</body>


</html>