<%@page import=" java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="com.lowagie.text.Document"%>
<%@page import="com.lowagie.text.Paragraph"%>
<%@page import="com.lowagie.text.pdf.PdfWriter"%>
<html>
    <head>
        <%
        String tid=request.getParameter("tid");
        %>
        <script type = "text/javascript">
 function sea()
 {
     window.location='/fleet/Report.jsp?tid=<%=tid%>';   
     alert("successfully wrriten pdf file in D:/");
 }
        </script>
    </head>
    <body onload="">
<%
out.println("Data is exported successfully.");
try {
OutputStream file = new FileOutputStream(new File("text.pdf"),true);
out.println("Data is exported successfully.");
Document document = new Document();
PdfWriter.getInstance(document, file);
document.open();
out.println("Data is exported successfully.");
String mno=request.getParameter("mno");
String sd=request.getParameter("sd");
String st=request.getParameter("st");
String tt=request.getParameter("tt");
String aa=request.getParameter("aa");
String as=request.getParameter("as");
document.add(new Paragraph(" "));
document.add(new Paragraph("Mobile Number : "+mno));
document.add(new Paragraph("Track Id : "+tid));
document.add(new Paragraph("Start Time :"+sd));
document.add(new Paragraph("Stop Time :"+st));
document.add(new Paragraph("Total Time Of Track:"+tt));
document.add(new Paragraph("Average Speed :"+as));
document.add(new Paragraph("Average Altitude :"+aa));
document.close();
file.close();
out.println("Data is exported successfully.");
} catch (Exception e) {
e.printStackTrace();
out.println(e);
} finally {
out.close();
}
%>
</body>
</html>
