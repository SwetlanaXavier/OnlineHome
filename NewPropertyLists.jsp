<%-- 
    Document   : NewPropertyLists
    Created on : 1 Mar, 2018, 2:08:08 PM
    Author     : Swetlana Xavier
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="mydb.dbconnection" id="obj"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>NewPropertyLists</title>
    </head>
    <body>
          <%
         if(request.getParameter("BId")!=null)
        {
          String updateApproval="update tbl_property set property_status=1 where property_id='"+request.getParameter("BId")+"'";
          boolean b=obj.ExecuteCommand(updateApproval);
          if(b)
          {
              response.sendRedirect("NewPropertyLists.jsp");
          }
          else
          {
              out.print(updateApproval);
          }
        }
         if(request.getParameter("Did")!=null)
        {
          String updateReject="update tbl_property set property_status=2 where property_id='"+request.getParameter("Did")+"'";
          boolean b2=obj.ExecuteCommand(updateReject);
          if(b2)
          {
              response.sendRedirect("NewPropertyLists.jsp");
          }
          else
          {
              out.print(updateReject);
          }
        }        
    %>

    <br>
    <br>
    
    <form name="frm_propertypending">
            
                   <table  align="center" border="1">
                       <tr>
                <th>sl.no</th>
                <th>Property Image</th>
                <th>Type of Property</th>
                <th>District</th>
                <th>Place</th>
                <th>Rate</th>
                <th>Square Feet</th>
                <th>Proof</th>
                <th>Description</th>
               
                       </tr>
                   
                     <% 
                    int i=1;
                    String strQry="select * from tbl_property p inner join tbl_district d on p.district_id = d.district_id inner join tbl_constructiontype t on p.constructiontype_id = t.constructiontype_id where property_status=0";
                    ResultSet rs1=obj.selectData(strQry);
                    while(rs1.next())
                     {
                         
                     %>
                     <tr>
                    <td><%=i%></td>
                    <td><img src="../Users/PropertyImages/<%=rs1.getString("property_image")%>" height="100" width="50"></td>
                   
                   <td><%=rs1.getString("constructiontype_type")%></td>
                   <td><%=rs1.getString("district_name")%></td>
                   <td><%=rs1.getString("property_placedetails")%></td>
                   <td><%=rs1.getString("property_rate")%></td>
                   <td><%=rs1.getString("property_sqft")%></td>
                    <td><a href="PropertyProofDownload.jsp?filename=<%=rs1.getString("property_proof")%>"><%=rs1.getString("property_proof")%></a></td>
                   <td><%=rs1.getString("property_description")%></td>
                     <td><a href="NewPropertyLists.jsp?BId=<%=rs1.getString("property_id")%>">APPROVE</a></td>
                     <td><a href="NewPropertyLists.jsp?Did=<%=rs1.getString("property_id")%>">REJECT</a></td></tr>

                  <%
                               i++;
                                  }
                  %>
      </table>
        </form>
       
    </body>
</html>
