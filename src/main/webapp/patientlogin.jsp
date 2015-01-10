<%-- 
    Document   : login
    Created on : Jul 14, 2012, 9:53:57 PM
    Author     : SuperUser
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <link rel="stylesheet" type="text/css" href="style.css" />
    </head>
    <body>
        <div id="outer">
     <%@include file="header.jsp" %> 
             <%@include file="menu.jsp" %> 
            
            
    <div id="content">
        
        <div id="primaryContentContainer">
            <div id="primaryContent">
                 
                 <div class="box">
                    <div class="boxContent">
                       Login For Patients
                    </div>
                    
                </div>
            </div>
            <div id="secondaryContent">
                			<div class="box boxA">
                                           
				<div class="boxContent">
                                    
					<form method="post" action="patientvalidate.jsp">
						<div>
							<span>Username:</span>
							<input type="text" class="text" maxlength="32" name="t1" />
							<span>Password:</span>
							<input type="password" class="text" maxlength="32" name="t2" />
							<input type="submit" class="button" value="Login" />
							
						</div>
					</form>
				</div>
			</div>
            </div>
        </div>
            
        <div id="footer">
        
    </div>
        
    </div>

</div>
    </body>
</html>
