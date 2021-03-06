<%@page contentType="text/html" pageEncoding="windows-1252"%>
<%@page import="java.sql.*"%>   
<!DOCTYPE html>
<!--[if IE 7 ]>   <html lang="en" class="ie7 lte8"> <![endif]--> 
<!--[if IE 8 ]>   <html lang="en" class="ie8 lte8"> <![endif]--> 
<!--[if IE 9 ]>   <html lang="en" class="ie9"> <![endif]--> 
<!--[if gt IE 9]> <html lang="en"> <![endif]-->
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!--[if lt IE 9 ]><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><![endif]-->

<!-- iPad Settings -->
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" /> 
<meta name="viewport" content="user-scalable=no, initial-scale=1.0">
<!-- iPad End -->

<title>Fleet Admin</title>

<!-- iOS ICONS -->
<link rel="apple-touch-icon" href="touch-icon-iphone.html" />
<link rel="apple-touch-icon" sizes="72x72" href="touch-icon-ipad.html" />
<link rel="apple-touch-icon" sizes="114x114" href="touch-icon-iphone4.html" />
<link rel="apple-touch-startup-image" href="touch-startup-image.html">
<!-- iOS ICONS END -->

<!-- STYLESHEETS -->

<link rel="stylesheet" media="screen" href="css/reset.css" />
<link rel="stylesheet" media="screen" href="css/grids.css" />
<link rel="stylesheet" media="screen" href="css/style.css" />
<link rel="stylesheet" media="screen" href="css/jquery.uniform.css" />
<link rel="stylesheet" media="screen" href="css/themes/lightblue/style.css" />

<!-- DATATABLES CSS -->
<link rel="stylesheet" media="screen" href="lib/datatables/css/cleanslate.css" />
<!-- DATATABLES CSS END -->

<!--[if lt IE 9]>
<link rel="stylesheet" media="screen" href="css/ie.css" />
<![endif]-->

<style type = "text/css">
    #loading-container {position: absolute; top:50%; left:50%;}
    #loading-content {width:800px; text-align:center; margin-left: -400px; height:50px; margin-top:-25px; line-height: 50px;}
    #loading-content {font-family: "Helvetica", "Arial", sans-serif; font-size: 18px; color: black; text-shadow: 0px 1px 0px white; }
    #loading-graphic {margin-right: 0.2em; margin-bottom:-2px;}
    #loading {background-color: #eeeeee; height:100%; width:100%; overflow:hidden; position: absolute; left: 0; top: 0; z-index: 99999;}
</style>

<!-- STYLESHEETS END -->

<!--[if lt IE 9]>
<script src="js/html5.js"></script>
<script type="text/javascript" src="js/selectivizr.js"></script>
<![endif]-->

</head>
<body style="overflow: hidden;">
    <div id="loading"> 

        <script type = "text/javascript"> 
            document.write("<div id='loading-container'><p id='loading-content'>" +
                           "<img id='loading-graphic' width='16' height='16' src='images/ajax-loader-eeeeee.gif' /> " +
                           "Loading...</p></div>");
        </script> 

    </div> 
    <br><br>
                             <section class="container_12 clearfix">
                    <div class="grid_12">
                        <div id="demo" class="clearfix"> 
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
                            <table class="display" id="example"> 
                                <thead> 
                                    <tr> 
                                        <th>Latitude</th> 
                                        <th>Longitude</th> 
                                        <th>Altitude</th> 
                                        <th>Date And Time</th> 
                                        <th>Speed</th> 
                                    </tr> 
                                </thead> 
                                <tbody> 
                  <%
                            while (rs2.next()) {
                                out.println("<tr class=\"gradeX\">");
                                out.println("<td>" + rs2.getString(1) + "</td>");
                                out.println("<td>" + rs2.getString(2) + "</td>");
                                out.println("<td>" + rs2.getString("alt") + "</td>");
                                out.println("<td>" + rs2.getString("dt") + "</td>");
                                out.println("<td>" + rs2.getString("spd") + "</td>");
                                out.println("</tr>");
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
  </tbody> 
                            </table> 
                        </div> 
                            
                   <!--     <h1>Initialisation code</h1> 
<pre class="code">$(document).ready(function() {
    $('#example').dataTable( {
        "sPaginationType": "full_numbers"
    } );
} );</pre> -->
                    </div>
                </section>

            <!-- Main Section End -->
    
    <!-- MAIN JAVASCRIPTS -->
    <script src="../../ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.js"></script>
    <script>window.jQuery || document.write("<script src='js/jquery.min.js'>\x3C/script>")</script>
    <script type="text/javascript" src="js/jquery.tools.min.js"></script>
    <script type="text/javascript" src="js/jquery.uniform.min.js"></script>
    <!--[if lt IE 9]>
    <script type="text/javascript" src="js/PIE.js"></script>
    <script type="text/javascript" src="js/ie.js"></script>
    <![endif]-->

    <script type="text/javascript" src="js/global.js"></script>
    <!-- MAIN JAVASCRIPTS END -->

    <!-- LOADING SCRIPT -->
    <script>
    $(window).load(function(){
        $("#loading").fadeOut(function(){
            $(this).remove();
            $('body').removeAttr('style');
        });
    });
    </script>
    <!-- LOADING SCRIPT -->

    <!-- DATATABLES -->
    <script type="text/javascript" src="lib/datatables/js/jquery.dataTables.js"></script> 
    <script type="text/javascript"> 
        $(document).ready(function() {
            $('#example').dataTable( {
                "sPaginationType": "full_numbers"
            } );
        } );
    </script> 
    <!-- DATATABLES END -->
    
</body>

</html>
