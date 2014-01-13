
<%@page contentType="text/html" pageEncoding="windows-1252"%>
<%@page import="java.sql.*"%>   
<!DOCTYPE html>
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
    window.location="/fleet/Report.jsp?tid="+str;
}    
       </script>
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
                        <li><a href="/fleet/SeeAll.jsp">Dashboard</a></li>
                        <li><a href="/fleet/add.html">Add Track</a></li>
                        <li><a href="/fleet/delete.html">Delete Track</a></li>
                        <li><a href="/fleet/search.html">Search Track</a></li>
                        <li class="current"><a href="/fleet/Report.jsp">Report</a></li>
                    </ul>
                </nav>
                <nav>
            </aside>

            <!-- Sidebar End -->

            <section>
                <header class="container_12 clearfix">
              
                </header>
                <section class="container_12 clearfix">
                    <div class="portlet grid_6">
                        <header>
                            <h2>Report</h2>
                        </header>
                        <section>
                   <h3>Enter the track you want Report for:
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
                            <%
                    try {
                    String tid = request.getParameter("tid");
                    if(tid!=null){
String dbUrl = "jdbc:mysql://mysql1000.mochahost.com/meenteco_test";
                    String dbClass = "com.mysql.jdbc.Driver";
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection(dbUrl, "meenteco_root", "pa77word");
                    PreparedStatement ps1 = con.prepareStatement("Select count(*) from tracks where tid=?");
                    ps1.setString(1, tid);
                    ResultSet rs = ps1.executeQuery();
                    rs.first();
                    if (rs.getInt(1) == 1) {
                PreparedStatement ps2 = con.prepareStatement("Select * from tracks where tid=?");
                ps2.setString(1, tid);
                ResultSet rs1=ps2.executeQuery();
                rs1.first();
                PreparedStatement ps3=con.prepareStatement("select * from "+tid);
                ResultSet rs2=ps3.executeQuery();
                double avgspd=0,avgalt=0;
                int count=0;
                Date Start=null,End=null;
                String sd="",endd="";
                while(rs2.next())
           {
                    endd=rs2.getString("dt");
                    avgspd +=Double.parseDouble(rs2.getString("spd"));
                    avgalt +=Double.parseDouble(rs2.getString("alt"));
                    count++;
           }
                avgalt=avgalt/count;
                avgspd=avgspd/count;
            rs2.first();
            sd=rs2.getString("dt");
            rs1.first(); 
int ind=sd.indexOf("-");
int ind1=sd.indexOf("-",ind+1);
int ind2=sd.indexOf(" ",ind1+1);
int ind3=sd.indexOf(":",ind2+1);
int ind4=sd.indexOf(":",ind3+1);
int yyyy=Integer.parseInt(sd.substring(0,ind));
int mm= Integer.parseInt(sd.substring(ind+1,ind1));
int dd=Integer.parseInt(sd.substring(ind1+1,ind2));
int hh=Integer.parseInt(sd.substring(ind2+1,ind3));
int min=Integer.parseInt(sd.substring(ind3+1,ind4));
int sec=Integer.parseInt(sd.substring(ind4+1));
java.util.Calendar c=new java.util.GregorianCalendar();
c.set(yyyy,mm-1,dd,hh,min,sec);
ind=sd.indexOf("-");
ind1=sd.indexOf("-",ind+1);
ind2=sd.indexOf(" ",ind1+1);
ind3=sd.indexOf(":",ind2+1);
ind4=sd.indexOf(":",ind3+1);
int yyyy1=Integer.parseInt(endd.substring(0,4));
int mm1= Integer.parseInt(endd.substring(ind+1,ind1));
int dd1=Integer.parseInt(endd.substring(ind1+1,ind2));
int hh1=Integer.parseInt(endd.substring(ind2+1,ind3));
int min1=Integer.parseInt(endd.substring(ind3+1,ind4));
int sec1=Integer.parseInt(endd.substring(ind4+1));
java.util.Calendar c1=new java.util.GregorianCalendar();
c1.set(yyyy1,mm1-1,dd1,hh1,min1,sec1);
long s=c1.getTimeInMillis();
long s2=c.getTimeInMillis();
long diff=s-s2;
diff=diff;
%>                    
<script type = "text/javascript">
    function exp()
    {
        window.location='/fleet/pdfdata.jsp?mno=<%=rs1.getString("mno")%>&tid=<%=rs1.getString(1)%>&sd=<%=sd%>&st=<%=endd%>&tt=<%=diff%>&aa=<%=avgalt%>&as=<%=avgspd%>';
    }
    </script>
  
                            <table class="full"> 
 
                                <tbody> 
                                    <tr> 
                                        <td>Mobile Number:</td> 
                                        <td class="ar"><%=rs1.getString("mno") %></td> 
                                    </tr> 
                                    
                                    <tr>
                                        <td>Track Id:</td>
                                        <td class="ar"><%=rs1.getString(1) %></td>
                                    </tr>
                                    
                                    <tr>
                                        <td>Start time:</td>
                                        <td class="ar"><%=sd%></td>
                                        
                                    </tr>
                                    
                                    <tr>
                                        <td>End time:</td>
                                        <td class="ar"><%=endd%></td> 
                                    </tr> 
                                    
                                    <tr> 
                                        <td>Total Time Of Track:</td> 
                                        <td class="ar"><%=diff%> Seconds</td> 
                                    </tr> 
 
                                    <tr> 
                                        <td>Average Speed</td> 
                                        <td class="ar"><%=avgspd %></td> 
                                    </tr> 
                                    
                                    <tr> 
                                        <td>Average Altitude</td> 
                                        <td class="ar"><%=avgalt %></td> 
                                    </tr> 
                                </tbody> 
 
                            </table>
                                   
                        </section>
                                  
  <%             } else {
                            out.println("Invalid Track id");
                        }}
                    } catch (Exception e) {
                        out.println(e);
                        e.printStackTrace();
                        out.println("Invalid Track id");
                    }
                                     
%>                      
                        
                    </div>
                </section>
            </section>

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