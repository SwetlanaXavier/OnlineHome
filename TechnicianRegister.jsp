<%-- 
    Document   : TechnicianRegister
    Created on : Feb 8, 2018, 10:41:11 AM
    Author     : ckc
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="mydb.dbconnection" id="obj"></jsp:useBean>
    
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TECHNICIAN REGISTRATION</title>
    </head>
    <body>
        <form name="frm_tech" action="TechnicianUpload.jsp" method="post" enctype="multipart/form-data">
          
            <table align="center">
                
                
                <tr>
                    <td>Technician Name</td><td>
                        <input type="text" name="txt_tname" required="" placeholder="Enter Name"  >
                    </td>
                </tr>
                <tr>
                    <td>Address</td><td>
                        <Textarea name="txt_adds" required="" placeholder="Enter address"></Textarea>
                    </td>
                </tr>
                <tr>
                    <td>Contact Number</td><td>
                        <input type="text" name="txt_cno" required="" placeholder="Enter address"  >
                    </td>
                </tr>
                <tr>
                    <td>Email</td><td>
                    <input type="text" name="txt_email" required="" placeholder="Enter Email" >
                     </td>
                </tr>
                <tr>
                    <td>Upload Photo</td><td>
                    <input type="file" name="txt_photo" >
                     </td>
                </tr>
                 <tr>
                    <td>Type of work</td><td>
                         <select name="seltechtype">
                    <option value="sel1">--Select--</option>
                    <%
                        String sel1="select *from tbl_techniciantype";
                         ResultSet rs2=obj.selectData(sel1);
                        while(rs2.next())
                        {
                    %>
                    <option value="<%=rs2.getString("techniciantype_id")%>" >
                        
                      <%=rs2.getString("techniciantype_type")%>      
                           
                    </option>
                    <%
                       }
                    %>
                </select>
              
                    </td>
                </tr>
               
                <tr>
                    <td>Experience</td><td>
                        <input type="text" name="txt_exp" required=""   >
                          </td>
                </tr>
                <tr>
                    <td>Proof</td>
                        <td><input type="file" name="txt_proof" >
                          </td>
                </tr>
               
                <tr>
                    <td>District</td><td>
                         <select name="seldistrict">
                    <option value="sel">--Select--</option>
                    <%
                        String sel="select *from tbl_district";
                         ResultSet rs1=obj.selectData(sel);
                        while(rs1.next())
                        {
                    %>
                    <option value="<%=rs1.getString("district_id")%>" >
                        
                      <%=rs1.getString("district_name")%>      
                           
                    </option>
                    <%
                       }
                    %>
                </select>
              
                    </td>
                </tr>
               
                 <tr>
                    <td>UserName</td><td>
                    <input type="text" name="txt_uname" required="" placeholder="Enter Username" >
                        
                   
                    </td>
                </tr>
                <tr>
                    <td>Password</td><td>
                    <input type="password" name="txt_pass" required="" placeholder="Enter Password" >
                    </td>
                </tr>

                
                <tr><td></td></tr>
                <tr><td colspan="2" align="center">
                        <input type="submit" name="btnsubmit" value="SUBMIT">
                          <input type="reset" name="btnreset" value="CANCEL">
                    </td></tr>
            </table>
        </form>
      
    </body>
</html>
