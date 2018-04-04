<%-- 
    Document   : NewBuyerPropertyApplication
    Created on : 25 Mar, 2018, 7:44:05 PM
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
         if(request.getParameter("BId")!=null&&request.getParameter("proid")!=null)
        {
          String updateApproval="update tbl_propertybooking set pbooking_status=1 where pbooking_id='"+request.getParameter("BId")+"'";
          boolean b=obj.ExecuteCommand(updateApproval);
          String update="update tbl_property set property_status=1 where property_id="+request.getParameter("proid");
          obj.ExecuteCommand(update);
          if(b)
          {
//              response.sendRedirect("NewUserBookingList.jsp");
          }
          else
          {
              out.print(updateApproval);
          }
        }
         if(request.getParameter("Did")!=null)
        {
          String updateReject="update tbl_propertybooking set pbooking_status=2 where pbooking_id='"+request.getParameter("Did")+"'";
          boolean b2=obj.ExecuteCommand(updateReject);
          if(b2)
          {
              response.sendRedirect("NewBuyerPropertyApplication.jsp");
          }
          else
          {
              out.print(updateReject);
          }
        }        
    %>

    <br>
    <br>
    
    <form name="frm_bookingpending">
            
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
                    String str="select * from tbl_propertybooking pb inner join tb_user us on pb.user_id = us.user_id inner join tbl_propertydetails pd on pd.propertydetails_id= pb.propertydetails_id inner join tbl_property p on p.property_id =pd.property_id inner join tbl_constructiontype ctype on ctype.constructiontype_id = p.constructiontype_id where pbooking_status=0";
                    ResultSet rs=obj.selectData(str);
                    while(rs.next())
                     {
                     %>
                     <tr>
                    <td><%=i%></td>
                   <td><%=rs.getString("pbooking_date")%></td>
                    <td><img style="width:100px; height:100px" src="../Users/PropertyImages/<%=rs.getString("property_image")%>"></td>
                   <td><%=rs.getString("property_caption")%></td>
                     <td><%=rs.getString("constructiontype_type")%></td>
                   <td><%=rs.getString("property_address")%></td>
                   <td><%=rs.getString("propertydetails_description")%></td>
                   <td><%=rs.getString("property_amount")%></td>
                   <td><img style="width:100px; height:100px" src="../Users/Photo/<%=rs.getString("user_photo")%>"></td>
                    <td><%=rs.getString("user_name")%></td>
                    <td><%=rs.getString("user_contact")%></td>
                   <td><%=rs.getString("user_emailid")%></td>

                     <td><a href="NewBuyerPropertyApplication.jsp?BId=<%=rs.getString("pbooking_id")%>&&proid=<%=rs.getString("property_id")%>">APPROVE</a></td>
                     <td><a href="NewBuyerPropertyApplication.jsp?Did=<%=rs.getString("pbooking_id")%>">REJECT</a></td></tr>

                  <%
                               i++;
                                  }
                  %>
      </table>
        </form>
       
    </body>
</html>
