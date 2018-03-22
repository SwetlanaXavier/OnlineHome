<%-- 
    Document   : Requirements
    Created on : 15 Feb, 2018, 12:25:25 PM
    Author     : Swetlana Xavier
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="mydb.dbconnection" id="obj"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Post Requirements</title>
    </head>
    <body>
        <%  
          String RId="";
          String UserId="";
          String District="";
          String Place="";
          String NoOfBed="";
          String Area="";
          String BudgetMin="";
          String BudgetMax="";
          String Reqtype="";
                
        if(request.getParameter("btnsubmit")!=null)
          {         
              UserId=request.getParameter("txt_bname");
              Place=request.getParameter("txt_cno");
              NoOfBed=request.getParameter("txt_email");
              Area=request.getParameter("txt_adds");
              District=request.getParameter("seldistrict");
              BudgetMin=request.getParameter("txt_uname");
              BudgetMax=request.getParameter("txt_pass");
              BudgetMax=request.getParameter("");
          
             
             String ins="insert into tbl_postrequirements(user_id,district_id,place,no_of_bedrooms,area_of_selection,budget_min,budget_max,req_type)"
                     + "values('"+UserId+"','"+District+"','"+Place+"','"+NoOfBed+"','"+Area+"','"+BudgetMin+"','"+BudgetMax+"','"+BudgetMax+"')";
                    
              boolean b1=obj.ExecuteCommand(ins);
               if(b1)
              {
                  response.sendRedirect("Requirements.jsp");
                }
                        else
                        {
                             out.println(ins);
                        }
                       }
                     
 
    %>

        <form name="frmreq">
          
            <table  align="center">
                
                
                <tr>
                    <td>User Name</td><td>
                        <input type="text" name="txt_bname" required="" placeholder="Enter Name"  >
                    </td>
                </tr>
                <tr>
                    <td>Address</td><td>
                        <input type="text" name="txt_adds" required="" placeholder="Enter address"  >
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
