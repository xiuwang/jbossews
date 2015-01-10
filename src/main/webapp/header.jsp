<%-- 
    Document   : header
    Created on : Jul 14, 2012, 9:54:52 PM
    Author     : SuperUser
--%>

<div id="header">
		<h1><a href="index.jsp">Patient Information Portal</a></h1>
		<h2>Curing through Care</h2>
                
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                Welcome<font color="blue">
                
                <%
if(session.getAttribute("n1")==null)
out.print("Guest");
else
    out.print(session.getAttribute("n1"));

%>
                </font>
	</div>