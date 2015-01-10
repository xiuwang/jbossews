<%-- 
    Document   : profile
    Created on : Jul 14, 2012, 10:02:15 PM
    Author     : SuperUser
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="true" import="javax.servlet.http.*"%>
<!DOCTYPE html>
<html>
    <head>
          <script type="text/javascript">
             function showpresc()
            {   
                var n=document.getElementById("pid").value;
               
         
                xmlHttp=GetXmlHttpObject()
                if (xmlHttp==null)
                {
                    alert ("Browser does not support HTTP Request")
                    return
                }
                var url="getpresc.jsp"
                url=url+"?pid="+n

                xmlHttp.onreadystatechange=stateChanged
                xmlHttp.open("GET",url,true)
                xmlHttp.send(null)



            }
            
            function showapoint()
            {   
                var n=document.getElementById("pid").value;
               

         
                xmlHttp=GetXmlHttpObject()
                if (xmlHttp==null)
                {
                    alert ("Browser does not support HTTP Request")
                    return
                }
                var url="getapoint.jsp"
                url=url+"?pid="+n

                xmlHttp.onreadystatechange=stateChanged
                xmlHttp.open("GET",url,true)
                xmlHttp.send(null)



            }

            function stateChanged()
            {
	
                if (xmlHttp.readyState==4 || xmlHttp.readyState==200)
                {

                    document.getElementById("showdata").innerHTML = xmlHttp.responseText;
           
                }
            }

            function GetXmlHttpObject()
            {
                var xmlHttp=null;
                try
                {
                    // Firefox, Opera 8.0+, Safari
                    xmlHttp=new XMLHttpRequest();
                }
                catch (e)
                {
                    //Internet Explorer
                    try
                    {
                        xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
                    }
                    catch (e)
                    {
                        xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
                    }
                }
                return xmlHttp;
            }
        </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile Page</title>
        <link rel="stylesheet" type="text/css" href="style.css" />
    </head>
    <body><%if(session.getAttribute("n1")==null)response.sendRedirect("index.jsp");%>
<div id="outer">
    <%@include file="header.jsp" %> 
             <%@include file="menu.jsp" %> 
            
            
    <div id="content">
        <div id="primaryContentContainer">
            <div id="primaryContent">
                <div class="box">
                    <div class="boxContent">
                        <h1>Welcome Patient
                            <font color="blue">
                            <%=session.getAttribute("n1")%>
                            </font>
                        </h1>
                            <br>
                            <input type="hidden" id="pid" value="<%=session.getAttribute("n1")%>"/>
                             <input type="button" onclick="showpresc()" value="See Prescription Details"/>
                            <input type="button" onclick="showapoint()" value="See Appointment Details"/>
                    </div>
                    <br><br>
                    <div id="showdata">Your Appointment/Prescription</div>
                    
                    </div>
                    
                </div>
            </div>
            <div id="secondaryContent"></div>
        </div>
            
        <div id="footer">
        
    </div>
        
    </div>
    </body>
</html>
