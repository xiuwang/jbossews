<%-- 
    Document   : register
    Created on : Jul 14, 2012, 9:54:12 PM
    Author     : SuperUser
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title> 
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
<form method="post" action="insert">
            <table>
                <tr><td>Email :</td>
                    <td><input type="text" name="email" placeholder="Email Id" required></td>

                </tr>
                <tr>
                    <td>Password :</td>
                    <td><input type="password" name="passwd" placeholder="Password" required></td>
                <tr>
                    <td>First name :</td>
                    <td><input type="text" name="fname" placeholder="first name" required></td>
                </tr>
                <tr>
                    <td>Last name :</td>
                    <td><input type="text" name="lname" placeholder="last name" required></td>
                </tr>
                <tr>
                    <td>Gender :</td>
                    <td>Male :<input type="radio" name="gender" value="male"><br/>Female :<input type="radio" name="gender" value="female"></td>
                </tr>
                <tr>
                    <td>Qualification :</td>
                    <td><input type="text" name="qual" placeholder="qualification" required></td>
                </tr>
                <tr>
                    <td>Address :</td>
                    <td><textarea name="add" rows="5" cols="30"></textarea></td>
                </tr>
                <tr>
                    <td>Phone :</td>
                    <td><input type="text" name="phone" placeholder="phone mob" required></td>
                </tr>
                <tr>
                    <td>Security Question :</td>
                    <td><input type="text" name="sq" placeholder="Security Question" required></td>
                </tr>
                <tr>
                    <td>Security Answer :</td>
                    <td><input type="text" name="sa" placeholder="Security Answer" required></td>
                </tr>
                <tr>
                    <td>Register</td>
                    <td><input type="submit" value="Register"></td>
                </tr>

            </table>
        </form>
</div>
</div>
</div>
                <div id="secondaryContent">
                    
                </div>
        </div>
        <div id="footer">
            
       </div>
</div>
</div>
    </body>
</html>
