<%-- 
    Document   : BookingType
    Created on : Feb 7, 2018, 2:31:48 PM
    Author     : ckc
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="mydb.dbconnection" id="obj"></jsp:useBean>
  
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BOOKING TYPE</title>
    </head>
    <body>
        <%  
          String BId="";   
          
          
 
            String BookingId="",BookingType="";  
                       
                        
            if(request.getParameter("edbooktypeid")!=null)
            {
                String sel="select * from tbl_bookingtype where bookingtype_id='"+request.getParameter("edbooktypeid")+"'";
                ResultSet rs=obj.selectData(sel);
                if(rs.next())
                {
                   BookingId=rs.getString("bookingtype_id");
                   BookingType=rs.getString("bookingtype_type");
        
                }
            }
            
            
            
            
            if(request.getParameter("BId")!=null)
            {
                String del="delete from tbl_bookingtype where bookingtype_id='"+request.getParameter("BId")+"'";
                obj.ExecuteCommand(del);
            }
            
            if(request.getParameter("btnsubmit")!=null)
            {
                
                BookingType=request.getParameter("txtbooktype");
                
                
                if(request.getParameter("hid")!="")
                {
                    String up="update tbl_bookingtype set bookingtype_type='"+BookingType+"' where bookingtype_id='"+request.getParameter("hid")+"'";
                   boolean b=obj.ExecuteCommand(up);
                  if(b)
                  {
                    response.sendRedirect("BookingType.jsp");
                  }
                  else
                  {
                      out.println(up);
                  }
                    
                    
                }else{
                
                
                String insQry="insert into tbl_bookingtype(bookingtype_type)values('"+BookingType+"')";
                out.println(insQry);
                 boolean b1=obj.ExecuteCommand(insQry);
                  if(b1)
                  {
                    response.sendRedirect("BookingType.jsp");
                  }
                  else
                  {
                      out.println(insQry);
                  }
                 }
            }   

            
        %>

        
      
        <form name="frm_booktype">
            
             <input type="hidden" value="<%=BookingId%>" name="hid"  >
             
            <table border="2" align="center">
                <tr>
                    <td>Booking Type </td>
                    <td><input type="text" value="<%=BookingType%>" name="txtbooktype" placeholder="Enter Booking Type"></td>
                </tr>
               
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btnsubmit" value="Submit">
                        <input type="reset" name="btnreset" value="Cancel">
                    </td>
                </tr>
            </table>
        </form>
        
        
        
        <br>
        <table  align="center" border="">
            <tr>
                <th>sl.no</th>
                <th>Booked Type</th>
                

            </tr>
    
        <%
            
            
            int i=1;
            String selQry="select * from tbl_bookingtype";
            ResultSet rs=obj.selectData(selQry);
            while(rs.next())
            {
               BookingId=rs.getString("bookingtype_id");
               
                
        %>
               <tr>
                   <td><%=i%></td>
                   <td><%=rs.getString("bookingtype_type")%></td>
                   
                
                   <td><a href="BookingType.jsp?BId=<%=BookingId%>">Delete</a>
                       <a href="BookingType.jsp?edbooktypeid=<%=BookingId%>">Edit</a></td>
           
                   
               </tr>
               <%
               
               i++;
                
            }
        %>
        </table>
    </body>
</html>
