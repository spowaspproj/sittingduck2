<%@page import="com.sittingducks.files.ValidateLogin"%>
<%@page import="java.net.URLEncoder"%>
<%    
    //NEW CODE 06 NOVEMBER
    
    if (ValidateLogin.redirect == true) {

        System.out.println("i suposse to redirect");
        
        String message = "SESSION TIMEOUT PLEASE LOGIN AGAIN  ";
        ValidateLogin.redirect = false;
        
        /// response is httpservet code THIS IS NOT JAVA CODE check with <% 
        response.sendRedirect("errorpage.jsp?message=" + URLEncoder.encode(message, "UTF-8"));
        return;
        //% >
        
    }
    
%>