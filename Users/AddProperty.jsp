<%-- 
    Document   : Addproperty
    Created on : 15 Feb, 2018, 2:07:31 PM
    Author     : Swetlana Xavier
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="mydb.dbconnection" id="obj"></jsp:useBean>
    
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Property Details</title>
    </head>
    <body>
       
         <form name="frmProperty" action="PropertyUpload.jsp" method="post" enctype="multipart/form-data" >
            <table  align="center">
                
                <tr>
                    <td>Property Type</td><td>
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
                    <td>Property Caption:</td><td>
                    <input type="text" name="txtcap" >
                     </td>
                </tr>
                <tr>
                    <td>Place Details</td><td>
                        <Textarea name="txtaddr" required="" placeholder="Enter place address"  >     </textarea>   
          </td>
                </tr>
                <tr>
                    <td>Property Number</td><td>
                    <input type="text" name="txtnumber" required="" >
                     </td>
                </tr>
                <tr>
                    <td>Property Description</td><td>
                    <Textarea name="txtpdet" ></textarea>
                     </td>
                </tr>  
                <tr>
                    <td>Upload Photo</td><td>
                    <input type="file" name="txtimage" >
                     </td>
                </tr>
               
              <tr><td colspan="2" align="center">
                        <input type="submit" name="btnsubmit" value="SUBMIT">
                          <input type="reset" name="btnreset" value="CANCEL">
                    </td></tr>
            </table>
                <a href="PropertyDetails.jsp">Add more details</a>
        </form>
    </body>
</html>
