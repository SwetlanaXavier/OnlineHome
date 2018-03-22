<%-- 
    Document   : TechnicianType
    Created on : Feb 7, 2018, 2:31:17 PM
    Author     : ckc
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="mydb.dbconnection" id="obj"></jsp:useBean>
    
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TECHNICIAN TYPE</title>
    </head>
    <body>
         <%  
          String TechId="";   
          String TechName="";
          
 
            String TechnicianId="",TechicianName="";  
                       
                        
            if(request.getParameter("edtechtypeid")!=null)
            {
                String sel="select * from tbl_techniciantype where techniciantype_id='"+request.getParameter("edtechtypeid")+"'";
                ResultSet rs=obj.selectData(sel);
                if(rs.next())
                {
                   TechnicianId=rs.getString("techniciantype_id");
                   TechicianName=rs.getString("techniciantype_type");
        
                }
            }
            
            
            
            
            if(request.getParameter("TechId")!=null)
            {
                String del="delete from tbl_techniciantype where techniciantype_id='"+request.getParameter("TechId")+"'";
                obj.ExecuteCommand(del);
            }
            
            if(request.getParameter("btnsubmit")!=null)
            {
                
                TechicianName=request.getParameter("txttechtype");
                
                
                if(request.getParameter("hid")!="")
                {
                    String up="update tbl_techniciantype set techniciantype_type='"+TechicianName+"' where techniciantype_id='"+request.getParameter("hid")+"'";
                   boolean b=obj.ExecuteCommand(up);
                  if(b)
                  {
                    response.sendRedirect("TechnicianType.jsp");
                  }
                  else
                  {
                      out.println(up);
                  }
                    
                    
                }else{
                
                
                String insQry="insert into tbl_techniciantype(techniciantype_type)values('"+TechicianName+"')";
                out.println(insQry);
                 boolean b1=obj.ExecuteCommand(insQry);
                  if(b1)
                  {
                    response.sendRedirect("TechnicianType.jsp");
                  }
                  else
                  {
                      out.println(insQry);
                  }
                 }
            }   

            
        %>

        
      
        <form name="frm_techtype">
            
             <input type="hidden" value="<%=TechnicianId%>" name="hid"  >
             
            <table border="2" align="center">
                <tr>
                    <td>Technician Type</td>
                    <td><input type="text" value="<%=TechicianName%>" name="txttechtype" placeholder="Enter Technician Type"></td>
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
                <th>Technician Type</th>
                

            </tr>
    
        <%
            
            
            int i=1;
            String selQry="select * from tbl_techniciantype";
            ResultSet rs=obj.selectData(selQry);
            while(rs.next())
            {
               TechnicianId=rs.getString("techniciantype_id");
               
                
        %>
               <tr>
                   <td><%=i%></td>
                   <td><%=rs.getString("techniciantype_type")%></td>
                   
                
                   <td><a href="TechnicianType.jsp?TechId=<%=TechnicianId%>">Delete</a>
                       <a href="TechnicianType.jsp?edtechtypeid=<%=TechnicianId%>">Edit</a></td>
           
                   
               </tr>
               <%
               
               i++;
                
            }
        %>
        </table>
    </body>
</html>
