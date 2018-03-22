<%-- 
    Document   : Constructions
    Created on : 12 Mar, 2018, 11:25:31 AM
    Author     : Swetlana Xavier
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="mydb.dbconnection" id="obj"></jsp:useBean>
   
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Construction</title>
    </head>
    <body>
        <form name="frm_const" action="ConstructionUpload.jsp" method="post" enctype="multipart/form-data">
            <table>
                 <tr>
                    <td>Construction Type</td><td>
                         <select name="type">
                    <option value="sel1">--Select--</option>
                    <%
                        String sel1="select *from tbl_constructiontype";
                         ResultSet rs=obj.selectData(sel1);
                        while(rs.next())
                        {
                    %>
                    <option value="<%=rs.getString("constructiontype_id")%>" >
                      <%=rs.getString("constructiontype_type")%>      
                      </option>
                    <%
                       }
                    %>
                </select>
                    </td></tr>
                 <tr>
                    <tr>
                    <td>Construction Caption</td>
                    <td><input type="text"  name="txtcap"></td>
                </tr>
                  <tr>
                    <tr>
                    <td>Construction Address</td>
                    <td><input type="text"  name="txtadd"></td>
                </tr>
                   <tr>
                    <td>Construction Number</td>
                    <td><input type="text"  name="txtno"></td>
                </tr>
                <tr>
                    <td>Construction Details</td>
                    <td><input type="text"  name="txtdet"></td>
                </tr>
                 <tr>
                    <td>Construction Image</td>
                    <td><input type="file"  name="txtimage"></td>
                </tr>
                <tr><td colspan="2" align="center">
                        <input type="submit" name="btnsubmit" value="SUBMIT">
                          <input type="reset" name="btnreset" value="CANCEL">
                    </td></tr>
            </table>
               
        </form>
    </body>
</html>
