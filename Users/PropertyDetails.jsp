<%-- 
    Document   : PropertyDetails
    Created on : 17 Mar, 2018, 11:42:43 AM
    Author     : Swetlana Xavier
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
          
 
            String detailsId="";
            String pdescription="";
             String pamount="";
             String prentamount="";
             String pleaseamount="";
            String property="", pid="";
             if(request.getParameter("btnsubmit")!=null)
          {
            pdescription=request.getParameter("txtdesc");
              property=request.getParameter("Pimage");
              pamount=request.getParameter("txtamt");
               prentamount=request.getParameter("txtrentamt");
                pleaseamount=request.getParameter("txtleaseamt");

               String insQry="insert into tbl_propertydetails(property_id,propertydetails_description,property_amount,property_rentamount,property_leaseamount)"
                       + "values('"+property+"','"+pdescription+"','"+pamount+"','"+prentamount+"','"+pleaseamount+"')";
                out.println(insQry);
                 boolean b1=obj.ExecuteCommand(insQry);
                  if(b1)
                  {
                    response.sendRedirect("PropertyDetails.jsp");
                  }
                  else
                  {
                      out.println(insQry);
                  }
                 
               
          }
            
        %>

        
        <form name="frmPDetails" >
            <table  align="center">
                  <tr>
                    <td>Construction Name</td><td>
                         <select name="Pimage" id="details">
                    <option value="selpimage">--Select--</option>
                    <%
                        String selpimage="select *from tbl_property where user_id='"+session.getAttribute("userid")+"'";
                         ResultSet rs2=obj.selectData(selpimage);
                        while(rs2.next())
                        {
                            String id=rs2.getString("property_id");
                    %>
                  
                      
                      <option <% if(pid.equals(id)){%> selected=""<%}%> value="<%=rs2.getString("property_id")%>"><%=rs2.getString("property_caption")%></option>

                    <%
                       }
                    %>
                </select>
                    </td>
                 
                </tr>
                  
                <tr>
                    <td>Description</td><td>
                        <Textarea name="txtdesc">     </textarea>   
          </td>
                <tr>
                    <td>Amount</td><td>
                        <input type="text" name="txtamt">       
                     </td>
                </tr>
                <tr>
                    <td>Rent Amount</td><td>
                         <input type="text" name="txtrentamt">         
                     </td>
                </tr>
<tr>
                    <td>lease Amount</td><td>
                         <input type="text" name="txtleaseamt">         
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
