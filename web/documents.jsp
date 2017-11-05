<%-- 
    Document   : documents
    Created on : Oct 17, 2016, 9:49:45 PM
    Author     : Stephen
--%>

<%-- 
    Document   : home
    Created on : Oct 17, 2016, 8:46:14 PM
    Author     : Stephen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Sitting Ducks</title>
<link href="style.css" rel="stylesheet" type="text/css" />
</head>

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

    <h1>Document Download</h1>
    <ul>
        <li><a href="download1.jsp?id=1"> ICB.pdf </a>  </li>
        <li><a href="download2.jsp?file=06171162.pdf"> ExampleDoc.pdf </a></li>
    </ul>
</div>
<div id="footer">

    <hr />
        Copyright © 2005 | All Rights Reserved

</div>



</div>

</body>

</html>

