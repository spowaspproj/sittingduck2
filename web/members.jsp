<%-- 
    Document   : members
    Created on : 16-Oct-2016, 11:46:42
    Author     : stephen
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Sitting Ducks</title>
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
<%
    String username = "";
    String password = "";


%>
<body>
<div id="main">
<div id="top-nav">
        If<b> Carlsberg</b> did Websites... It <b>definitely</b> wouldn't be this!
</div>


<div id="header">
        <img src="images/Banner.jpg" alt="" width="720" height="160" />
</div>
<div id="navigation">

        Menu

        <hr />
        <a href="index.jsp" class="navigation">Home</a>
        <a href='login.jsp' class="navigation">Login</a>
        <a href="index.jsp" class="navigation">Logout</a>
        <a href="search.jsp" class="navigation">Search</a>
        <a href="documents.jsp" class="navigation">Documents</a>
        <a href="Messages.jsp" class="navigation">Messages</a>
        <a href="SendMessage.jsp" class="navigation">Send Message</a>
</div>
<br></br>
<div id="content">

    <h1>Members</h1>
    <p>This is the <strong>Members</strong> section. You can't really do anything special here, <br/>
        but if you are reading this, at least you know the login worked :D</p>
</div>
<div id="footer">

    <hr />
        Copyright © 2016 | Sitting Ducks

</div>



</div>

</body>

</html>