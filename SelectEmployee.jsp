<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.googlecode.objectify.*" %>
<%@ page import="java.util.*" %>

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

<form action ="dashboard.jsp" method="post">
	<div>
		<input height="38" name="Image1" src="HomButton.png" type="image" width="57">
	</div>
</form>

<p class="auto-style1"><strong>Select Employee</strong></p>




<table style="width: 100%">
	<tr>
		<td>Name:</td>
		<td>ID:</td>
		<td>Action:</td>
	</tr>
	<% Employer e = new Employer();
	e = (Employer) request.getSession().getAttribute();
	ArrayList<Employee> employees = new ArrayList<>();
	employees.addAll(e.getEmployees()); 
	int size = employees.size();
	for(int i = 0; i < size; i++){
		%>
		<tr>
			<td><% employees.get(i).getName(); %></td>
			<td><% employees.get(i).getID(); %></td>
			<td>< edit ></td>
		</tr> <%
	}
	%>
	
</table>




</body>

</html>
