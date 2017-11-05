<%-- 
    Document   : download2
    Created on : Oct 19, 2016, 9:21:22 AM
    Author     : Stephen
--%>

<%@page import="java.io.DataInputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
         if(request.getParameter("file")!=null)
        {
             String context = request.getContextPath();
             
            int BUFSIZE = 4096;
               String filePath;
            filePath = request.getParameter("file");
            File file = new File(getServletContext().getRealPath("/") + context);
            file = new File(file.getParent()+"/documents/"+filePath);       
            int length   = 0;
            ServletOutputStream outStream = response.getOutputStream();
            //response.setContentType("text/html");
            response.setContentLength((int)file.length());
            String fileName = (new File(filePath)).getName();
            response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");

            byte[] byteBuffer = new byte[BUFSIZE];
            DataInputStream in = new DataInputStream(new FileInputStream(file));

            while ((in != null) && ((length = in.read(byteBuffer)) != -1))
            {
            outStream.write(byteBuffer,0,length);
            }

            in.close();
            outStream.close();
        }
        else
        {
        }
    %>
  