<%-- 
    Document   : Login
    Created on : Feb 8, 2018, 10:41:25 AM
    Author     : ckc
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="mydb.dbconnection" id="obj"></jsp:useBean>
    
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>login</title>
    </head>
    <body>
        
         <%
       String uname="";     
       String upass="";
     if(request.getParameter("btnsubmit")!=null)
     {
         uname=request.getParameter("txtuser");
          upass=request.getParameter("txtpass");
             String sel="select builders_id from tbl_builders b inner join tbl_login l on b.login_id=l.login_id where l.login_username='"+uname+"' and l.login_password='"+upass+"' and l.login_usertype='Builder' and b.builders_status='1'";
             String sel1="select technician_id from tbl_technicians t inner join tbl_login l on t.login_id=l.login_id where l.login_username='"+uname+"' and l.login_password='"+upass+"'and l.login_usertype='Technician' and t.technician_status='1'";
             String sel2="select user_id from tb_user u inner join tbl_login l on u.login_id=l.login_id where l.login_username='"+uname+"' and l.login_password='"+upass+"'and l.login_usertype='User'";
             String sel3="select * from tbl_login where login_username='"+uname+"' and login_password='"+upass+"' and login_usertype='Admin'";
             ResultSet rs=obj.selectData(sel);
             ResultSet rs1=obj.selectData(sel1);
             ResultSet rs2=obj.selectData(sel2);
             ResultSet rs3=obj.selectData(sel3);
              if(rs.next())
   
                       {
                            session.setAttribute("buildersid", rs.getString("builders_id"));
                            response.sendRedirect("../Builders/HomePage.jsp");
                         } 
    
     else if(rs1.next())
     {
           session.setAttribute("technicianid", rs1.getString("technician_id"));
          response.sendRedirect("../Technicians/HomePage.jsp");
       } 
      else if(rs2.next())
      {
           session.setAttribute("userid", rs2.getString("user_id"));
           response.sendRedirect("../Users/HomePage.jsp");        
      } 
       else if(rs3.next())
        {
           session.setAttribute("loginid", rs3.getString("login_id"));
           response.sendRedirect("../Admin/adminhomepage.jsp");
       } 
    else        
       {
                out.println("Login Failed");
                
        }
     }
    %>
       
        <h1><font color="blue"><center>LOGIN</center></font></h1>
         <form name="frmlogin">
            
                   <table class="table table-hover" align="center">
                <tr>
                    <td>User Name
                    <td>
                        <input type="text"  name="txtuser" placeholder="Enter username" autocomplete="off" required="" >

                    </td>
                    </td>
                </tr>
                <tr>
                    <td>Password
                    <td>
                        <input type="password"  name="txtpass" placeholder="Enter password" required="">

                    </td>
                    </td>
               
                <tr><td colspan="2" align="center">
                        <input type="submit" name="btnsubmit" value="LOGIN">
                        <input type="submit" name="btn_reset" formaction="GuestHome.jsp" value="CANCEL">
                    </td>
                </tr>
             
                
            </table>
        </form>
        
    </body>
</html>
