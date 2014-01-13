<%-- 
    Document   : SeeAll
    Created on : Apr 16, 2012, 3:44:38 AM
    Author     : Kapil_LPT
--%>

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
<link rel="stylesheet" media="screen" href="css/forms.css" />
<link rel="stylesheet" media="screen" href="css/jquery.uniform.css" />
<link rel="stylesheet" media="screen" href="css/themes/lightblue/style.css" />

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
   <script type="text/javascript">
function sea()
{
    var str=document.getElementById('s1').value;
    var ifrm=document.getElementById('frm1');
    ifrm.src="/fleet/Search.jsp?tid="+str
    var ifrm2=document.getElementById('frm2');
    ifrm2.src="/fleet/SearchTable.jsp?tid="+str
}    
       </script>

    <style type="text/css">
         #map_canvas { height: 100% }
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

    <div id="wrapper">
      <header>
            <h1><a href="/fleet/SeeAll.jsp">Fleet Admin</a></h1>
            <nav>
				<ul id="main-navigation" class="clearfix"> 	
                    <li class="fr dropdown"> 
                        <a href="#" class="with-profile-image"><span><img src="images/profile-image.png" /></span>Administrator</a> 
                        <ul> 
                            <li><a href="#">Settings</a></li> 
                            <li><a href="#">Users</a></li> 
                            <li><a href="#">Groups</a></li> 
                            <li><a href="#">Signout</a></li> 
                        </ul>
                    </li> 
				</ul> 
            </nav>
        </header>
        
        <section>
            <!-- Sidebar -->

            <aside>
                <nav>
                    <ul>
                        <li class="current"><a href="/fleet/SeeAll.jsp">Dashboard</a></li>
                        <li><a href="/fleet/add.html">Add Track</a></li>
                        <li><a href="/fleet/delete.html">Delete Track</a></li>
                        <li><a href="/fleet/search.html">Search Track</a></li>
                        <li><a href="/fleet/Report.jsp">Report</a></li>
                    </ul>
                </nav>
                <nav>
            </aside>

            <!-- Sidebar End -->
 <%
                    try {
                        response.setIntHeader("Refresh",60);
                    String tid = request.getParameter("tid");
String dbUrl = "jdbc:mysql://mysql1000.mochahost.com/meenteco_test";
                    String dbClass ="com.mysql.jdbc.Driver";
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection(dbUrl,"meenteco_root", "pa77word");
                    PreparedStatement ps1 = con.prepareStatement("Select * from tracks");
                    ResultSet rs=ps1.executeQuery();
                    while(rs.next()){
                    String s=rs.getString(1);
                    String query="select * from "+s;
                    PreparedStatement ps=con.prepareStatement(query);
                    ResultSet rst=ps.executeQuery();
                    
                    while(rst.next())
                    {
                        String al=rst.getString(6);
                        if(al.equalsIgnoreCase("yes"))
                        {
                           String s1=rs.getString("mno")+" went out on date and time:"+rst.getString("dt")+" Track id:"+rs.getString(1);
                           out.println("<script type = \"text/javascript\">");
                           out.println("alert('"+s1+"')");
                           out.println("</script> ");
                        }
                    }
                    PreparedStatement ps3=con.prepareStatement("update "+s+" set alert='no'");
                    ps3.executeUpdate();
                                       }
                                       }
                    catch(Exception e)
                    {
                        out.println(e);
                    }
            %>
            <section>
                <header class="container_12 clearfix">
              
                </header>
                <section class="container_12 clearfix">
                    <div class="portlet grid_12">
                        <header>
                            <h2>Watch A Track</h2>
                        </header>
                        <section>
                            <h3>Enter the track you want to search for:
                       <%
        try
    {
             response.setContentType("text/html;charset=UTF-8");
String dbUrl = "jdbc:mysql://mysql1000.mochahost.com/meenteco_test";
            String dbClass = "com.mysql.jdbc.Driver";
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection(dbUrl,"meenteco_root","pa77word");
            PreparedStatement ps=con.prepareStatement("Select * from tracks");
            ResultSet rs=ps.executeQuery();%>
            <select name=s1 id=s1><%
            rs.first();
            do
            {               out.println("<option value="+rs.getString(1)+">");
                out.println(""+rs.getString(1));
                out.println("</option>");
            } while(rs.next());%>
            </select></h3><h3>
            <input type="button" value="Search" onclick=sea()></h3><hr>
                   <%    }
        catch(Exception e)
       {
           out.print(e);
       }
         %><br>
                           <iframe src="" height="70%" width="100%" ID="frm1"></iframe><br>
                           <iframe src="" height="60%" width="100%" ID="frm2"></iframe><br>
                        </section>
                        </div>
                        <section>

            <!-- Main Section End -->
        </section>
    </div>
    
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

</body>

</html>