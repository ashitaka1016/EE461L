<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.googlecode.objectify.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.example.pms.Employer" %>
<%@ page import="com.example.pms.Employee" %>
<%@ page import="com.example.pms.HourlyEmployee" %>

<!DOCTYPE html>
<html>

<head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<title>Hourly Summary</title>
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
.auto-style2 {
	font-size: large;
}
</style>

</head>

<body style="height: 555px">

<form action ="dashboard.jsp" method="post">
	<div>
		<input height="38" name="Image1" src="images/HomeButton.png" type="image" width="57">
	</div>
</form>

<p class="auto-style1"><strong>Summary for Hourly Employee</strong></p>

<%	
	HourlyEmployee e = (HourlyEmployee)request.getSession().getAttribute("currentEmployee");
%>

<table style="width: 100%">
	<tr>
		<td style="width: 432px">Name: </td>
		<td><% out.print(e.getName()); %></td>
	</tr>
	<tr>
		<td style="width: 432px">ID: </td>
		<td><% out.print(e.getID()); %></td>
	</tr>
	<tr>
		<td></td>
	</tr>
	<tr>
		<td></td>
	</tr>

	<tr>
		<td style="width: 432px">Expected Hours: </td>
		<td><% out.print(e.getExpectedHours()); %></td>
	</tr>
	<tr>
		<td style="width: 432px">Hours Worked: </td>
		<td><% out.print(e.getHours()); %></td>
	</tr>
	<tr>
		<td style="width: 432px">Pay Rate (per hour): </td>
		<td><% out.print(e.getPayRate()); %></td>
	</tr>
	<tr>
		<td style="width: 432px">Years Worked: </td>
		<td><% out.print(e.getYearsWorked()); %></td>
	</tr>
	<tr>
		<td style="width: 432px">Sick Days: </td>
		<td><% out.print(e.getSickDays()); %></td>
	</tr>
	<tr>
		<td style="width: 432px">Bonus: </td>
		<td><% out.print(e.getBonus()); %></td>
	</tr>
	<tr>
		<td></td>
	</tr>
	<tr>
		<td></td>
	</tr>
	<tr>
		<td style="width: 432px" class="auto-style2"><strong>Rating: </strong> </td>
		<td class="auto-style2"><strong><% 
		int rating = e.analyzeProductivity(e.calcContribution());
		switch(rating){
			case 1: out.print("F"); break;
			case 2: out.print("D"); break;
			case 3: out.print("C"); break;
			case 4: out.print("B"); break;
			case 5: out.print("A"); break;
		}
		%> </strong></td>
	</tr>


</table>

<br><br>

<div class="wrapper">
	<button name="Create">Return</button>
</div>



</body>

</html>
