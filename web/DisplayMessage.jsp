
<%@page import="java.net.URLEncoder"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="com.sittingducks.files.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

                <h1>Message</h1>
                <%    String msgid = request.getParameter("msgid");
                    try {
                        Connection con = new DBConnect().connect(getServletContext().getRealPath("/WEB-INF/config.properties"));
                        if (msgid != null && !msgid.equals("")) {
                            //NEW CODE 05 NOVEMBER 
                            ResultSet rs = null;
                            PreparedStatement pst = con.prepareStatement("select * from UserMessages where msgid=?");
                            pst.setString(1, request.getParameter("msgid"));
                            rs = pst.executeQuery();

                            if (rs.next()) {
                                out.print("<b>Sender:</b> " + rs.getString("sender"));
                                out.print("<br/><b>Subject:</b>" + rs.getString("subject"));
                                out.print("<br/><b>Message:</b> <br/>" + rs.getString("msg"));

                                out.print("<br/><br/><a href='Messages.jsp'>Return to Messages &gt;&gt;</a>");
                            } else {

                                // NEW CODE 05 NOVEMBER 
                                String message = "No Message Found";
                                response.sendRedirect("errorpage.jsp?message=" + URLEncoder.encode(message, "UTF-8"));
                            }
                        } else {

                            String message = "Message Id Parameter is missing";
                            response.sendRedirect("errorpage.jsp?message=" + URLEncoder.encode(message, "UTF-8"));

                        }

                    } catch (Exception e) {
                        // chenge to e for debuging 
                        out.print("unknown error");
                    }

                %>
            </div>
            <div id="footer">

                <hr />
                Copyright © 2016 | Sitting Ducks

            </div>



        </div>

    </body>

</html>

