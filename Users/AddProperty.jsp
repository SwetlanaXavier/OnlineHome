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
                    <td>Property Name </td><td>
                         <select name="property">
                    <option value="selpro">--Select--</option>
                    <%
                        String selP="select *from tbl_constructiontype";
                         ResultSet rs2=obj.selectData(selP);
                        while(rs2.next())
                        {
                    %>
                    <option value="<%=rs2.getString("constructiontype_id")%>" >
                      <%=rs2.getString("constructiontype_type")%>      
                      </option>
                    <%
                       }
                    %>
                </select>
                    </td>
                    </td>
                </tr>
                <tr>
                    <td>Upload Photo</td><td>
                    <input type="file" name="txtphoto" >
                     </td>
                </tr>
                
                <tr>
                    <td>District</td><td>
                         <select name="district">
                    <option value="sel">--Select--</option>
                    <%
                        String sel="select *from tbl_district";
                         ResultSet rs=obj.selectData(sel);
                        while(rs.next())
                        {
                    %>
                    <option value="<%=rs.getString("district_id")%>" >
                      <%=rs.getString("district_name")%>      
                      </option>
                    <%
                       }
                    %>
                </select>
                    </td></tr>
                <tr>
                    <td>Place Details</td><td>
                        <Textarea name="txtplace" required="" placeholder="Enter place address"  >     </textarea>   
          </td>
                </tr>
                <tr>
                    <td>Rate</td><td>
                    <input type="text" name="txtrate" required="" placeholder="Enter the rate"  >
                     </td>
                </tr>
                
                 <tr>
                    <td>Total area</td>
                    <td>
                    <input type="text" name="txtarea" required="" placeholder="Enter Number"  >
                     </td>
                </tr>
                    </td>
                </tr>
               <tr>
                    <td>Upload Proof</td><td>
                    <input type="file" name="txtproof" >
                     </td>
                </tr>
                
               
                <tr>
                    <td>Property Description</td><td>
                    <Textarea name="txtpdes" required="" placeholder="Enter property details" ></textarea>
                     </td>
                </tr>
                
              <tr><td colspan="2" align="center">
                        <input type="submit" name="btnsubmit" value="SUBMIT">
                          <input type="reset" name="btnreset" value="CANCEL">
                    </td></tr>
            </table>
        </form>
    </body>
</html>
