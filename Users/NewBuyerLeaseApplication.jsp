<%-- 
    Document   : NewBuyerLeaseApplication
    Created on : 25 Mar, 2018, 7:42:43 PM
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
         if(request.getParameter("BId")!=null)
        {
          String updateApproval="update tbl_propertylease set propertylease_status=1 where propertylease_id='"+request.getParameter("BId")+"'";
          boolean b=obj.ExecuteCommand(updateApproval);
          if(b)
          {
              response.sendRedirect("NewBuyerLeaseApplication.jsp");
          }
          else
          {
              out.print(updateApproval);
          }
        }
         if(request.getParameter("Did")!=null)
        {
          String updateReject="update tbl_propertylease set propertylease_status=2 where propertylease_id='"+request.getParameter("Did")+"'";
          boolean b2=obj.ExecuteCommand(updateReject);
          if(b2)
          {
              response.sendRedirect("NewBuyerLeaseApplication.jsp");
          }
          else
          {
              out.print(updateReject);
          }
        }        
    %>

    <br>
    <br>
    
    <form name="frm_sellerpropending">
            
                   <table class="table table-hover" align="center" border="1">
                       <tr>
                <th>sl.no</th>
                <th>Date</th>
                <th>Image</th>
                <th>Property Caption</th>
                <th>Property type</th>
                <th>Address</th>
                <th>Description</th>
                 <th>Rate</th>
                  <th>Photo</th>
                 <th>Buyer Name</th>
                 <th>Contact address</th>
                 <th>Email ID</th>
                
                </tr>
                   
                     <% int i=1;
                    String str="select * from tbl_propertylease u inner join tb_user us on u.user_id = us.user_id inner join tbl_constructiondetails cd on cd.constructiondetails_id= u.constructiondetails_id inner join tbl_construction con on con.construction_id =cd.construction_id inner join tbl_constructiontype ctype on ctype.constructiontype_id = con.constructiontype_id where propertylease_status=0";
                    ResultSet rs=obj.selectData(str);
                    while(rs.next())
                     {
                     %>
                     <tr>
                    <td><%=i%></td>
                   <td><%=rs.getString("propertylease_date")%></td>
                    <td><img style="width:100px; height:100px" src="../Users/PropertyImages/<%=rs.getString("property_image")%>"></td>
                   <td><%=rs.getString("property_caption")%></td>
                     <td><%=rs.getString("constructiontype_type")%></td>
                   <td><%=rs.getString("property_address")%></td>
                   <td><%=rs.getString("propertydetails_description")%></td>
                   <td><%=rs.getString("property_leaseamount")%></td>
                    <td><img style="width:100px; height:100px" src="../Users/Photo/<%=rs.getString("user_photo")%>"></td>
                    <td><%=rs.getString("user_name")%></td>
                    <td><%=rs.getString("user_contact")%></td>
                   <td><%=rs.getString("user_emailid")%></td>

                     <td><a href="NewBuyerLeaseApplication.jsp?BId=<%=rs.getString("propertylease_id")%>">APPROVE</a></td>
                     <td><a href="NewBuyerLeaseApplication.jsp?Did=<%=rs.getString("propertylease_id")%>">REJECT</a></td></tr>

                  <%
                               i++;
                                  }
                  %>
      </table>
        </form>
       
    </body>
</html>
