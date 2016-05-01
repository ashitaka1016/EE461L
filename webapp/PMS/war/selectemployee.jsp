<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.googlecode.objectify.*" %>
<%@ page import="com.googlecode.objectify.ObjectifyService" %>

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
</style>

</head>

<body style="height: 451px">

<form action ="dashboard.jsp">
	<div>
		<input height="38" name="Image1" src="images/HomeButton.png" type="image" width="57">
	</div>
</form>

<p class="auto-style1"><strong>Select Employee</strong></p>




<table style="width: 100%">
	<tr>
		<td>Name:</td>
		<td>ID:</td>
		<td>Action:</td>
	</tr>
	<tr>
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
			<td><% if(employees.get(i) instanceof HourlyEmployee) {
				%> <form action="edithourlyemployee.jsp"><input type="button" value="Select"></form> <%
			} else if(employees.get(i) instanceof SalaryEmployee) {
				%> <form action="editsalaryemployee.jsp"><input type="button" value="Select"></form> <%
			} else {
				%> <form action="editcommissionemployee.jsp"><input type="button" value="Select"></form> <%
			} %>
			</td>
		</tr> <%
	}
	%>
	
</table>

</body>

</html>