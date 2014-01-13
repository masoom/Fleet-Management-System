<%-- 
    Document   : Search
    Created on : Apr 16, 2012, 6:07:00 PM
    Author     : 
--%>

<%@page contentType="text/html" pageEncoding="windows-1252"%>
<%@page import="java.sql.*"%>   
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Fleet Admin</title>
        <style type="text/css">
            html { height: 100% }body { height: 100%; margin: 0; padding: 0 }#map_canvas { height: 100% }
        </style>
        <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyDmtkD3LpqV3CMjXtMEoDaWRceGOkycLaY&sensor=true">
        </script>
        <script type="text/javascript">
            var map;
            function initialize() {
                var myOptions = {center: new google.maps.LatLng(19.04,72.86),zoom: 10,mapTypeId: google.maps.MapTypeId.ROADMAP};
                map = new google.maps.Map(document.getElementById("map_canvas"),myOptions);
                var bounds = new google.maps.LatLngBounds(
                new google.maps.LatLng(19.041460206545,72.863416734069),
                new google.maps.LatLng(72.863416734069,72.863416734069)
            );
            }
            function place(a,b,c)
            {
                var myLatLng = new google.maps.LatLng(parseFloat(a),parseFloat(b));
                var marker = new google.maps.Marker({
                    position: myLatLng,map: map,title:c});
            }     
        </script>
    </head>
    <body>
        <div id="map_canvas" style="width:100%; height:100%"></div>
        <div id="abc"><script type="text/javascript">initialize();</script>
            <%
                try {
                    String tid = request.getParameter("tid");
String dbUrl = "jdbc:mysql://mysql1000.mochahost.com/meenteco_test";
                    String dbClass = "com.mysql.jdbc.Driver";
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection(dbUrl, "meenteco_root", "pa77word");
                    PreparedStatement ps1 = con.prepareStatement("Select count(*) from tracks where tid=?");
                    ps1.setString(1, tid);
                    ResultSet rs = ps1.executeQuery();
                    rs.first();
                    if (rs.getInt(1) == 1) {
                        PreparedStatement ps2 = con.prepareStatement("Select * from " + tid);
                      ResultSet rs2 = ps2.executeQuery();%>
                <%
                            while (rs2.next()) {
                                String s = "LATITUDE:" + rs2.getString(1) + "LONGITUDE:" + rs2.getString(2) + "ALTITUDE:" + rs2.getString(3) + "DATE:" + rs2.getString(4) + "SPEED:" + rs2.getString(5);
                                out.println("<script type=\"text/javascript\">place('" + rs2.getString(1) + "','" + rs2.getString(2) + "','" + s + "');</script>");
                            }
                        } else {
                            out.println("Invalid Track id");
                        }
                    } catch (Exception e) {
                        out.println(e);
                        e.printStackTrace();
                        out.println("Invalid Track id");
                    }
                %>
        </div>
    </body>
</html>

