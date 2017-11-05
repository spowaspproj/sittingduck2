<%-- 
    Document   : search
    Created on : 16-Oct-2016, 14:02:55
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

    <h1>Login</h1>
    <form id="form1" name="form1" method="GET" action="search.jsp">
    <label>Please Enter Keyword:
	<input type="text" name="keyword" value=""/>
    </label>
    <input type="submit" name="action" value="Search"/>
</form>
<br/>

<%  
    String searchedName = request.getParameter("keyword");
    
    
    if (searchedName != null)
    {
  
    %>
    
            Search Results for <c:out value="${searchedName}" escapeXml="true"/>
            <br/>...
            <br/>...
    <%
    //Show result pages

    }
        %>
</div>
<div id="footer">

    <hr />
        Copyright � 2016 | Sitting Ducks

</div>



</div>

</body>

</html>


