<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.googlecode.objectify.*" %>

<%@ page import="java.util.*" %>
<%@ page import="com.example.pms.Employer" %>
<%@ page import="com.example.pms.Employee" %>
<%@ page import="com.example.pms.HourlyEmployee" %>
<%@ page import="com.example.pms.SalaryEmployee" %>
<%@ page import="com.example.pms.CommissionEmployee" %>

<!DOCTYPE html>
<html>

<head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<title>EditEmployee</title>
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
.name {
	font-size: large;
	font-weight: bold;
}

</style>

</head>

<body style="height: 451px">

<form action ="dashboard.jsp">
	<div>
		<input height="38" name="Image1" src="images/HomeButton.png" type="image" width="57">
	</div>
</form>

<p class="auto-style1"><strong>Your Employees</strong></p>

<table style="width: 100%">
	<tr>
		<td class="name">Name:</td>
		<td class="name">ID:</td>
	</tr>
	<tr>
		<td></td>
		<td></td>
	</tr>
	<%  
		ObjectifyService.register(Employer.class);
		Employer employer = (Employer)ObjectifyService.ofy().load().type(Employer.class).id((String)request.getSession().getAttribute("employer")).get();
	ArrayList<Employee> employees = employer.getEmployees();
	int size = employees.size();
	for(int i = 0; i < size; i++) {
		%>
		<tr>
			<td><% out.print(employees.get(i).getName()); %></td>
			<td><% out.print(employees.get(i).getID()); %></td>
		</tr> <%
	}
	%>
	
</table>

</body>

</html>