
 <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
 <%@ page import="com.sittingducks.files.DBConnect"%>
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

    <h1>Send Message</h1>
    <br/><br/>
<form action="${pageContext.request.contextPath}/SendMessage.do" method="POST">
<table> 
<tr><td>Recipient: </td><td><input type="text" name="recipient" value="<% if(request.getParameter("recipient")!=null){ out.print(request.getParameter("recipient")); } %>"/></td></tr>
<tr><td>Subject :</td><td><input type="text" name="subject"/></td></tr>
<tr><td>Message :</td><td><textarea name="msg"></textarea></td></tr>
<tr> <td><input type="hidden" name="sender" value="<%=session.getAttribute("user")%>"/></td></tr>
<tr><td><input type="submit" name="send" value="send"/></td></tr>
</table>  
</form>
</div>
<div id="footer">

    <hr />
        Copyright © 2016 | Sitting Ducks

</div>



</div>

</body>

</html>

