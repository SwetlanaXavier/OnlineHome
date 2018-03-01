<%-- 
    Document   : userhomepage
    Created on : Feb 9, 2018, 2:27:02 PM
    Author     : ckc
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="mydb.dbconnection" id="obj"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String sel="select user_name from tb_user where user_id='"+session.getAttribute("userid") +"'";
            ResultSet rs=obj.selectData(sel);
            if(rs.next())
            {
                %>
                <h1 align="center">Welcome <%=rs.getString("user_name")%></h1>
                <%
            }
        %>
        
        <h3 align="center"><a href="AddProperty.jsp">Add Property</a></h3>
        <h3 align="center"><a href="ViewBuilders.jsp">View Builders</a></h3>
        
        <h3 align="center"><a href="ViewTechnicians.jsp">View Technicians</a></h3>
        <h3 align="center"><a href="ViewOwmProposal.jsp">View Owm Proposal</a></h3>
        
    </body>
</html>
