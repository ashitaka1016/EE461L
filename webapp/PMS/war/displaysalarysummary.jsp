<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.googlecode.objectify.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.example.pms.Employer" %>
<%@ page import="com.example.pms.Employee" %>

<!DOCTYPE html>
<html>

<head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<title>Salary Summary</title>
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

<body style="height: 555px">

<form action ="dashboard.jsp" method="post">
	<div>
		<input height="38" name="Image1" src="HomButton.png" type="image" width="57">
	</div>
</form>

<p class="auto-style1"><strong>Summary for Salary Employee</strong></p>

<%	ObjectifyService.register(Employee.class);
	Employee e = ObjectifyService.ofy().load().type(Employee.class).id((String)request.getSession().getAttribute("employee")).get();
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
		<td style="width: 432px">Salary: </td>
		<td><% out.print(e.getSalary()); %></td>
	</tr>
	<tr>
		<td style="width: 432px">Overtime: </td>
		<td><% out.print(e.getOvertime()); %></td>
	</tr>
	<tr>
		<td style="width: 432px">Overtime Rate (per hour): </td>
		<td><% out.print(e.getOvertimeRate()); %></td>
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
		<td style="width: 432px">Sick Days Taken: </td>
		<td><% out.print(e.getSickDaysTaken()); %></td>
	</tr>
	<tr>
		<td style="width: 432px">Vacation Days: </td>
		<td><% out.print(e.getVacDays()); %></td>
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
		int rating = e.analyzeProductivity(e.calcContribution);
		switch(rating){
			case 2: out.print("D");
			case 3: out.print("C");
			case 4: out.print("B");
			case 5: out.print("A");
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
