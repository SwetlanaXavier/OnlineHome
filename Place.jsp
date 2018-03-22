<%-- 
    Document   : Place
    Created on : Feb 7, 2018, 3:21:10 PM
    Author     : ckc
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="mydb.dbconnection" id="obj"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PLACE</title>
    </head>
    <body>
        <%  
          String PlaId="";
     
          
          String PlacaId="";
          String PlacaName="";
          String District="";
          
 
              
           if(request.getParameter("editplaceid")!=null)
            {
                String sel="select * from tbl_place where place_id='"+request.getParameter("editplaceid")+"'";
                ResultSet rs=obj.selectData(sel);
                if(rs.next())
                {
                   PlacaId=rs.getString("place_id");
                   PlacaName=rs.getString("place_name");
                   District=rs.getString("district_id");
        
                }
            }
           if(request.getParameter("PlaId")!=null)
            {
                String del="delete from tbl_place where place_id='"+request.getParameter("PlaId")+"'";
                obj.ExecuteCommand(del);
            }
           
            if(request.getParameter("btnsubmit")!=null)
            {
                PlacaName=request.getParameter("txtplacename");
                District=request.getParameter("seldistrict");
                
                if(request.getParameter("hid")!="")
                {
                   String up="update tbl_place set place_name='"+PlacaName+"',district_id='"+District+"'  where place_id='"+request.getParameter("hid")+"'";
                   boolean b=obj.ExecuteCommand(up);
                  if(b)
                  {
                    response.sendRedirect("Place.jsp");
                  }
                  else
                  {
                      out.println(up);
                  }
                    
                    
                }else{
                String insQry="insert into tbl_place(place_name,district_id)values('"+PlacaName+"','"+District+"')";
                out.println(insQry);
                 boolean b1=obj.ExecuteCommand(insQry);
                  if(b1)
                  {
                    response.sendRedirect("Place.jsp");
                  }
                  else
                  {
                      out.println(insQry);
                  }
                 }
            }
            
        %>

        
      
        <form name="frm_place">
             <input type="hidden" value="<%=PlacaId%>" name="hid"  >
            <table border="2" align="center">
                <tr>
                    <td>Place Name</td>
                    <td><input type="text"  value="<%=PlacaName%>"name="txtplacename" placeholder="Enter place name..."></td>
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
                <th>slno</th>
                <th>place name</th>
                <th>dis id</th>
                

            </tr>
    
        <%
            
            
            int i=1;
            String selQry="select * from tbl_place";
            ResultSet rs=obj.selectData(selQry);
            while(rs.next())
            {
               PlacaId=rs.getString("place_id");
               
                
        %>
               <tr>
                   <td><%=i%></td>
                   <td><%=rs.getString("place_name")%></td>
                    <td><%=rs.getString("district_id")%></td>
                
                   
                    <td><a href="Place.jsp?PlaId=<%=PlacaId%>">Delete</a>
                       <a href="Place.jsp?editplaceid=<%=PlacaId%>">Edit</a></td>
               </tr>
               <%
               
               i++;
                
            }
        %>
        </table>
    
    </body>
</html>
