<%@ page import="com.googlecode.objectify.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.example.pms.Employer" %>
<%@ page import="com.example.pms.Employee" %>

<!DOCTYPE html>
<html>

<head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<title>View Timeline</title>
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

<p class="auto-style1"><strong>View Timeline</strong></p>

<%	ObjectifyService.register(Employee.class);
	Employee e = ObjectifyService.ofy().load().type(Employee.class).id((String)request.getSession().getAttribute("employee")).get();
%>

<br> <br>
<div class="wrapper">
	<br>
	<table style="width: 100%; height: 168px">
		<tr>
			<td>&nbsp;</td>
			<td>Past Payday2: <% out.print(e.get()); %></td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>Future Payday2:</td>
		</tr>
		<tr>
			<td>Past Payday1:</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>Future Payday1:</td>
			<td>&nbsp;</td>
		</tr>
	</table>
	<br>
</div>

<div class="wrapper">
	<input height="154" name="Image2" src="timeline.png" type="image" width="925">
</div>

<div class="wrapper">
	<button name="Create">View All</button>
</div>


</body>

</html>
