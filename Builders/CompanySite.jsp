<%-- 
    Document   : CompanySite
    Created on : 1 Mar, 2018, 11:56:23 AM
    Author     : Swetlana Xavier
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="mydb.dbconnection" id="obj"></jsp:useBean>
   
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Company Site</title>
    </head>
    <body>
        
    <%  
          String SId="";
          String SiteId="";
          String SiteName="";
          String SiteAddress="";
          String District="";
          String Builder="";
          String Totalarea="";
          
        if(request.getParameter("btnsubmit")!=null)
          {         
              SiteName=request.getParameter("txtsitename");
              District=request.getParameter("district");
              SiteAddress=request.getParameter("txtsiteadd");
              Builder=request.getParameter("builders_id");
              Totalarea=request.getParameter("txtsitearea");
             
              String ins="insert into tbl_companysite(site_name,site_address,district_id,builders_id,totalarea)"
                                 + "values('"+SiteName+"','"+SiteAddress+"','"+District+"','" +session.getAttribute("buildersid") + "','"+Totalarea+"')";
              boolean b1=obj.ExecuteCommand(ins);
              if(b1)
              {
                         
              }
              else
              {
                   out.println(ins);                        
              }
          }
                     
 
    %>
   
        
        <form name="frm_site">
            <table>
                <tr>
                    <td>Site Name </td>
                    <td><input type="text"  name="txtsitename"></td>
                </tr>
                <tr>
                    <td>Site Address </td>
                    <td><input type="text"  name="txtsiteadd"></td>
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
                    <td>Total Area</td>
                    <td><input type="text"  name="txtsitearea"></td>
                </tr>
                
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btnsubmit" value="Submit">
                        <input type="reset" name="btnreset" value="Cancel">
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
