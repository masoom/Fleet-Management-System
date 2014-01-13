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
public class Test extends HttpServlet {

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
        Connection con;
         response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        try {
            out.println("Successfulll");
            String tid,lat1,long1,lat2,long2;
            String id=request.getParameter("id");
            String lat=request.getParameter("lat");
            String lng=request.getParameter("lng");
            String alt=request.getParameter("alt");
            String dt=request.getParameter("dt");
            String spd=request.getParameter("spd");
            if(spd.equalsIgnoreCase("Nan"))
            {
                spd="2.0";
            }
            String pass=request.getParameter("pass");
            String alert="";
            out.println(" Id: "+id+" Latitude:"+lat+" Longitude:"+lng+" Altitude:"+alt+"Date and Time:"+dt+"Speed"+spd);
            String dbUrl = "jdbc:mysql://mysql1000.mochahost.com/meenteco_test";
            String dbClass = "com.mysql.jdbc.Driver";
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection(dbUrl,"meenteco_root","pa77word");
            PreparedStatement plo=con.prepareStatement("select count(*) from tracks where id=? and pass=?");
            plo.setString(1,id);
            plo.setString(2,pass); 
            ResultSet rs1=plo.executeQuery();
            rs1.first();
            int dnum=rs1.getInt(1);
	    PreparedStatement ps=con.prepareStatement("select * from tracks where id=? and pass=?");
            ps.setString(1,id);
            ps.setString(2,pass); 
            ResultSet rs=ps.executeQuery();
            if(dnum==1)
            {
                rs.first();
                out.println("Successfull");
                tid=rs.getString(1);
                lat1=rs.getString(5);
                long1=rs.getString(6);
                lat2=rs.getString(7);
                long2=rs.getString(8);
                double l1=Double.parseDouble(lat1);
                double ln1=Double.parseDouble(long1);
                double l2=Double.parseDouble(lat2);
                double ln2=Double.parseDouble(long2);
                double curl1=Double.parseDouble(lat);
                double curl2=Double.parseDouble(lng);
                if(curl1>l2 || curl1<l1)
                {
                    alert="yes";
                }else{
                if(curl2>ln2 || curl2<ln1)
                {
                    alert="yes";
                }
                else
                {alert="no";}
                }
            if(con!=null)
            {
            }
            else
            {
                out.println("con is null");
            }
            PreparedStatement ps1=con.prepareStatement("insert into "+tid+" values(?,?,?,?,?,?)");
            ps1.setString(1,lat);
            ps1.setString(2,lng);
            ps1.setString(3,alt);
            ps1.setString(4,dt);
            ps1.setString(5,spd);
            ps1.setString(6,alert);
            ps1.executeUpdate();
            }
            else
            {
                out.println("Password or Id Incorrect...."+pass+id);
            }            
        }catch(Exception e)
        {
            out.println(e.getMessage());
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
