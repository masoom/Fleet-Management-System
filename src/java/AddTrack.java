/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
/**
 *
 * @author 
 */
public class AddTrack extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /*
             * TODO output your page here. You may use following sample code.
             */
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddTrack</title>");            
            out.println("</head>");
            out.println("<body>");
            String tid=request.getParameter("tid");
            String id=request.getParameter("username");
            String pass=request.getParameter("password");
            String mno=request.getParameter("m_no");
            String lat1=request.getParameter("lat1");
            String long1=request.getParameter("long1");
            String lat2=request.getParameter("lat2");
            String long2=request.getParameter("long2");
String dbUrl = "jdbc:mysql://mysql1000.mochahost.com/meenteco_test";
            String dbClass = "com.mysql.jdbc.Driver";
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection(dbUrl,"meenteco_root","pa77word");
            PreparedStatement ps=con.prepareStatement("insert into tracks values(?,?,?,?,?,?,?,?)");
            ps.setString(1,tid);
            ps.setString(2,id);
            ps.setString(3,pass);
            ps.setString(4,mno);
            ps.setString(5,lat1);
            ps.setString(6,long1);
            ps.setString(7,lat2);
            ps.setString(8,long2);
            ps.executeUpdate();
            PreparedStatement ps1=con.prepareStatement("create table "+tid+"(lat varchar(15),lng varchar(15),alt varchar(15),dt varchar(20),spd varchar(10) DEFAULT '2.0',alert varchar(4))");
            ps1.executeUpdate();
             out.println("<script type=\"text/javascript\">alert(\"Succesfully deleted\");</script>");
            response.sendRedirect("/fleet/add.html");
            out.println("</body>");
            out.println("</html>");
            out.println("</body>");
            out.println("</html>");
        }
        catch(Exception e)
        {
            out.println(e);
        }
        finally {            
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
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
     * Handles the HTTP
     * <code>POST</code> method.
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
