package com.sittingducks.files;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author stephen
 */
public class ValidateLogin extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String user=request.getParameter("username").trim();
        String pass=request.getParameter("password").trim();
        
        try
             {
                 Connection con=new DBConnect().connect(getServletContext().getRealPath("/WEB-INF/config.properties"));
                    if(con!=null && !con.isClosed())
                               {
                                   HttpSession session=request.getSession();
                                   ResultSet rs=null;
                                   
                                   //NEW CODE
                                   PreparedStatement pst = con.prepareStatement("select * from users where name=? and password=?");
                                   pst.setString(1, user);
                                   pst.setString(2, pass);
                                   rs= pst.executeQuery();
                                   
                                   session.setAttribute("user", user);
                                   Cookie privilege=new Cookie("privilege","user");
                                   response.addCookie(privilege);
                                   if(rs != null && rs.next()){
                                       response.sendRedirect("members.jsp");
                                   }
                                   else{
                                       response.sendRedirect("login.jsp?err=something went wrong");
                                   }
                                    
                               }
                }
               catch(Exception ex)
                {
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
