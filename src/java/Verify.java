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
public class Verify extends HttpServlet {

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
    PrintWriter out;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
response.setContentType("text/html;charset=UTF-8");
        out= response.getWriter();
        try {
            /*
             * TODO output your page here. You may use following sample code.
             */
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Verify</title>");            
            out.println("</head>");
            out.println("<body>");
            String login=request.getParameter("username");
            String pass=request.getParameter("password");
            String as=request.getParameter("as");
String dbUrl = "jdbc:mysql://mysql1000.mochahost.com/meenteco_test";
            String dbClass = "com.mysql.jdbc.Driver";
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection(dbUrl,"meenteco_root","pa77word");
            PreparedStatement plo=con.prepareStatement("select count(*) from users where id=? and pass=? and pos=?");
            plo.setString(1,login);
            plo.setString(2,pass);
            plo.setString(3,as);
            ResultSet rs1=plo.executeQuery();
            rs1.first();
            int dnum=rs1.getInt(1);
	    PreparedStatement ps=con.prepareStatement("select * from users where id=? and pass=? and pos=?");
            ps.setString(1,login);
            ps.setString(2,pass);
            ps.setString(3, as);
            out.println(ps.toString());
            ResultSet rs=ps.executeQuery();
            out.println(rs.getRow());
            if(dnum==1)
            {
                if(as.equalsIgnoreCase("Manager"))
                {
                response.sendRedirect("/fleet/SeeAll.jsp");
                }
                else
                {
                    response.sendRedirect("/fleet/emplog.jsp");
                }
            }
            else
            {
                out.println("User name Password Invalid...");
            }
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
