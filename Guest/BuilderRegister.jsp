<%-- 
    Document   : BuilderRegister
    Created on : Feb 8, 2018, 10:40:55 AM
    Author     : ckc
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="mydb.dbconnection" id="obj"></jsp:useBean>
    
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BUILDER'S REGISTRATION</title>
    </head>
    <body>
     <%  
//          String BId="";
//          
//          String BuildersId="";
//          String BuildersName="";
//          String District="";
//          String Contact="";
//          String Email="";
//          String Logo="";
//          String Address="";
//          String Username="";
//          String Password="";
//          String logid="";
//          String Proof="";
//        
//           
//          if (request.getParameter("BId") != null) {
//                String del = "delete from tbl_login l ,tbl_builders b where b.login_id = l.login_id and b.builders_id='" + request.getParameter("BId") + "'";
//                obj.ExecuteCommand(del);
//             }
// 
//            
//        if(request.getParameter("btnsubmit")!=null)
//          {         
//              BuildersName=request.getParameter("txt_bname");
//              Contact=request.getParameter("txt_cno");
//              Email=request.getParameter("txt_email");
//              Address=request.getParameter("txt_adds");
//             
//              Logo=request.getParameter("txt_logo");
//              District=request.getParameter("seldistrict");
//              Username=request.getParameter("txt_uname");
//              Password=request.getParameter("txt_pass");
//          
//                       String insQryLog="insert into tbl_login(username,password,usertype)values('"+Username+"','"+Password+"','Builders')";
//                         boolean b2=obj.ExecuteCommand(insQryLog);
//                         
//                         String sel="select max(login_id) as login from tbl_login";
//                         ResultSet rs1=obj.selectData(sel);
//                         if(rs1.next())
//                         {
//                              logid=rs1.getString("login");
//                         }
//                         String ins="insert into tbl_builders(builders_name,builders_address,builders_contact,builders_emailid,district_id,builders_logo,login_id)"
//                                 + "values('"+BuildersName+"','"+Address+"','"+Contact+"','"+Email+"','"+District+"','"+Logo+"','"+logid+"')";
//                        boolean b1=obj.ExecuteCommand(ins);
//                         if(b1)
//                         {%>
<!--                         <script type="text/javascript">
                                 alert(" Successfully Registered..");
           
                            </script>-->
                          
                     <% // }
                      
//                        else
//                        {
//                             out.println(ins);
//                        }
//                       }
                     
 
    %>

    <form name="frm_builder" action="BuilderUpload.jsp" method="post" enctype="multipart/form-data">
          
            <table  align="center">
                
                
                <tr>
                    <td>Builder Name</td><td>
                        <input type="text" name="txt_bname" required="" placeholder="Enter Name"  >
                    </td>
                </tr>
                <tr>
                    <td>Address</td><td>
                        <Textarea name="txt_adds" required="" placeholder="Enter address"></Textarea> 
                    </td>
                </tr>
               <tr>
                    <td>Contact Number</td><td>
                        <input type="text" name="txt_cno" required="" placeholder="Enter contact no"  >
                    </td>
                </tr>
                <tr>
                    <td>Email:</td><td>
                    <input type="text" name="txt_email" required="" placeholder="Enter Email" >
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
                    <td> Upload Logo</td>
                    <td>
                        <input type="file" name="txt_logo">
                        
                    </td>
                    
                 <tr>
                     <td> Upload Proof</td>
                    <td>
                        <input type="file" name="txt_proof">
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
