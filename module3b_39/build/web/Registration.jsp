<%-- 
    Document   : Registration
    Created on : Jul 15, 2024, 8:04:15 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        //JSP script;ist
        String s1=request.getParameter("uname");
        String s2=request.getParameter("pass");
        String s3=request.getParameter("repass");
        String s4=request.getParameter("email");
        String s5=request.getParameter("country");
        if (s2.equals(s3))
        {
            //database connectivity code
            try
                {
                   Class.forName("com.mysql.jdbc.Driver");
                   Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
                   PreparedStatement pst=conn.prepareStatement("insert into registration_039 values(?,?,?,?)");
                   pst.setString(1,s1);
                   pst.setString(2,s2);
                   pst.setString(3,s4);
                   pst.setString(4,s5);
                   int rows=pst.executeUpdate();
                   if(rows==1)
                   {
                       out.print("Registration successful");
                   }
                   else
                   {
                       out.print("Registration failed, Try again");
                        %>
                        <jsp:include page="Registration.html"></jsp:include>
                        <%
                   }
                }
            catch(Exception e)
                    {
                        out.println("Exception:" +e);
                    }
        }
        else
        {
            out.println("Password does not match, Regiter once again");
            %>
            <jsp:include page="Registration.html"></jsp:include>
            <%
        }
        %>
    </body>
</html>
