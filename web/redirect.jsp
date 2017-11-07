<%@page import="com.sittingducks.files.ValidateLogin"%>
<%@page import="java.net.URLEncoder"%>
<%
    //NEW CODE 06 NOVEMBER ... Shows error page after session is destroyed 

    if (ValidateLogin.redirect == true && session.getAttribute("isLogin") != null && !session.getAttribute("isLogin").equals("")) {

        //        response is httpservet code THIS IS NOT JAVA CODE check with <% 
        //        response.sendRedirect("errorpage.jsp?message=" + URLEncoder.encode(message, "UTF-8"));
        //        return;
       %>

<meta http-equiv="refresh" content="0; url=errorpage.jsp?message=SESSION TIMEOUT PLEASE LOGIN AGAIN" />

<%
        ValidateLogin.redirect = false;
        session.setAttribute("isLogin", false);
    }

%>