<%@ page import="com.googlecode.objectify.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.example.pms.Employer" %>
<%@ page import="com.example.pms.Employee" %>
<%@ page import="com.example.pms.CommissionEmployee" %>

<!DOCTYPE html>
<html>

<head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<title>Commission Summary</title>
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

<p class="auto-style1"><strong>Summary for Commission Employee</strong></p>

<%	
	CommissionEmployee e = (CommissionEmployee)request.getSession().getAttribute("currentEmployee");
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
		<td style="width: 432px">Sales (in dollars): </td>
		<td><% out.print(e.getSales()); %></td>
	</tr>
	<tr>
		<td style="width: 432px">Commission Rate (as percent): </td>
		<td><% out.print(e.getCommRate()); %></td>
	</tr>
	<tr>
		<td style="width: 432px">Previous Years Sales: </td>
		<td><% out.print(e.getPrevYearSales()); %></td>
	</tr>
	<tr>
		<td style="width: 432px">Max Sales: </td>
		<td><% out.print(e.getMaxSales()); %></td>
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
			case 1: out.print("F");
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
