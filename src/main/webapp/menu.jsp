<%-- 
    Document   : menu
    Created on : Jul 14, 2012, 9:54:43 PM
    Author     : SuperUser
--%>



<div id="menu">
		<ul>
                    <li class="first"><a href="index.jsp">Home</a></li>
                    
                    <%if(session.getAttribute("n1")==null) {%>
                    
                    <li><a href="login.jsp">Doctor and Admin Login</a></li>
                    <li><a href="patientlogin.jsp">Patient Login</a></li>
                    
                    
                    <% }
                    else if(session.getAttribute("n1").toString().equalsIgnoreCase("admin@newhms.com"))
                    {
                    %>
                    <li><a href="pat_reg.jsp">Patient Registration</a></li>
                    <li><a href="papoint.jsp">Patient's Appointment</a></li>
                    <li><a href="ppresc.jsp">Patient's Prescription</a></li>
                    <li><a href="profile.jsp">Profile</a></li>
                    <li><a href="account.jsp">My Account</a></li>
                    <li><a href="logout.jsp">Logout</a></li>
                    <% } else if(session.getAttribute("type").equals("doctor"))  { %>
			<li><a href="profile.jsp">Profile</a></li>
                        <li><a href="account.jsp">My Account</a></li>
			<li><a href="appointment.jsp">My Appointments</a></li>
			<li><a href="mypatients.jsp">My Patients</a></li>
                        <li><a href="showprescription.jsp">Prescription</a></li>
                        <li><a href="logout.jsp">Logout</a></li>
		<%}else{%>
                <li><a href="patientprofile.jsp">Profile</a></li>
                 <li><a href="patientaccount.jsp">My Account</a></li>
                 <li><a href="billing.jsp">Billing</a></li>
                  <li><a href="logout.jsp">Logout</a></li>
                        <%}%>
                </ul>
	</div>













