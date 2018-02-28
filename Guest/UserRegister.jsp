<%-- 
    Document   : UserRegister
    Created on : Feb 8, 2018, 10:40:40 AM
    Author     : ckc
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="mydb.dbconnection" id="obj"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>USER REGISTRATION</title>
    </head>
    <body>
        

        <form name="frm_user" action="UserUpload.jsp" method="post" enctype="multipart/form-data">
            <table  align="center">
                  <tr>
                    <td>User Name</td><td>
                        <input type="text" name="txt_uname" required="" placeholder="Enter Name"  >
                    </td>
                </tr>
                <tr>
                    <td>Address</td><td>
                        <Textarea name="txt_uadds" required="" placeholder="Enter address"  >     </textarea>             </td>
                </tr>
                <tr>
                    <td>Contact Number</td><td>
                    <input type="text" name="txt_ucno" required="" placeholder="Enter Number"  >
                     </td>
                </tr>
                <tr>
                    <td>Gender</td><td>
                      <input type="text" name="txt_gender" required=""   >
                     </td>
                </tr>
                <tr>
                    <td>Date of birth</td>
                    <td>
                    <input type="text" name="txt_udob" required="" placeholder="Enter Number"  >
                     </td>
                </tr>
                <tr>
                    <td>Email</td><td>
                    <input type="email" name="txt_email" required="" placeholder="Enter Email" >
                     </td>
                </tr>
                <tr>
                    <td>Upload Photo</td><td>
                    <input type="file" name="txt_photo" >
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
                 
                    </td>
                </tr>
                
                <tr>
                    <td>UserName</td><td>
                    <input type="text" name="txt_uname" required=""  >
                        
                   
                    </td>
                </tr>
                <tr>
                    <td>Password</td><td>
                    <input type="password" name="txt_pass" required=""  >
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
