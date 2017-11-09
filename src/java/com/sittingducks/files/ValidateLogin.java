package com.sittingducks.files;

import java.io.IOException;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author
 */
public class ValidateLogin extends HttpServlet {
   
protected static HttpSession session;
public static boolean redirect;
public static boolean isLogin;
public static String userNoValid;

protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    NormalizeValidate input = new NormalizeValidate();
    
        userNoValid = request.getParameter("username").trim();
        String passNoValid = request.getParameter("password").trim();
        
        
        
        String user = input.normalizeValidate(userNoValid);
        String pass = input.normalizeValidate(passNoValid);

        try {
            Connection con = new DBConnect().connect(getServletContext().getRealPath("/WEB-INF/config.properties"));
            if (con != null && !con.isClosed()) {
                 session = request.getSession();

                //NEW CODE 06 NOVEMBER COOKIE LIFETIME SET TO 1 MIN.
                session.setAttribute("user", user);
                
                //NEW CODE 05 NOVEMBER
                ResultSet rs = null;
                PreparedStatement pst = con.prepareStatement("select * from users where name=? and password=?");
                pst.setString(1, user);
                pst.setString(2, pass);
                rs = pst.executeQuery();

                Cookie privilege = new Cookie("privilege", "user");

                //NEW CODE 06 NOVEMBER COOKIE LIFETIME SET TO 1 MIN.
                privilege.setMaxAge(1 * 60);

                response.addCookie(privilege);

                if (rs != null && rs.next()) {
                    
                    session.setMaxInactiveInterval(1*60); //in seconds
                    isLogin = true;
                    redirect = false;
                    response.sendRedirect("members.jsp");

                } else {
                    //NEW CODE 06 NOVEMBER                                        
                    String message = "WRONG CREDENTIALS, TRY AGAIN ";
                    response.sendRedirect("errorpage.jsp?message=" + URLEncoder.encode(message, "UTF-8"));
                }

            }
        } catch (Exception ex) {
            response.sendRedirect("login.jsp?err=something went wrong");
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
