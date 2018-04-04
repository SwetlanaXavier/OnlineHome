<%-- 
    Document   : district
    Created on : Feb 7, 2018, 1:30:41 PM
    Author     : ckc
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="mydb.dbconnection" id="obj"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DISTRICT</title>
    </head>
    <body>
           
      <%  
          String DisId="";   
          String DisName="";
          
 
            String DistrictId="",DistrictName="";  
                       
                       
            if(request.getParameter("editdistrictid")!=null)
            {
                String sel="select * from tbl_district where district_id='"+request.getParameter("editdistrictid")+"'";
                ResultSet rs=obj.selectData(sel);
                if(rs.next())
                {
                   DistrictId=rs.getString("district_id");
                   DistrictName=rs.getString("district_name");
        
                }
            }
            
            
            
            
            if(request.getParameter("DisId")!=null)
            {
                String del="delete from tbl_district where district_id='"+request.getParameter("DisId")+"'";
                obj.ExecuteCommand(del);
            }
            
            if(request.getParameter("btnsubmit")!=null)
            {
                
                DistrictName=request.getParameter("txtdistrictname");
                
                
                if(request.getParameter("hid")!="")
                {
                    String up="update tbl_district set district_name='"+DistrictName+"' where district_id='"+request.getParameter("hid")+"'";
                   boolean b=obj.ExecuteCommand(up);
                  if(b)
                  {
                    response.sendRedirect("district.jsp");
                  }
                  else
                  {
                      out.println(up);
                  }
                    
                    
                }else{
                
                
                String insQry="insert into tbl_district(district_name)values('"+DistrictName+"')";
                out.println(insQry);
                 boolean b1=obj.ExecuteCommand(insQry);
                  if(b1)
                  {
                    response.sendRedirect("district.jsp");
                  }
                  else
                  {
                      out.println(insQry);
                  }
                 }
            }   

            
        %>

        
      
        <form name="frm_district">
            
             <input type="hidden" value="<%=DistrictId%>" name="hid"  >
             
            <table border="2" align="center">
                <tr>
                    <td>District Name </td>
                    <td><input type="text" value="<%=DistrictName%>" name="txtdistrictname" placeholder="Enter District"></td>
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
                <th>District Name</th>
               
            </tr>
    
        <%
            
            
            int i=1;
            String selQry="select * from tbl_district";
            ResultSet rs=obj.selectData(selQry);
            while(rs.next())
            {
               DistrictId=rs.getString("district_id");
               
                
        %>
               <tr>
                   <td><%=i%></td>
                   <td><%=rs.getString("district_name")%></td>
                   
                
                   <td><a href="district.jsp?DisId=<%=DistrictId%>">Delete</a>
                       <a href="district.jsp?editdistrictid=<%=DistrictId%>">Edit</a></td>
           
                   
               </tr>
               <%
               
               i++;
                
            }
        %>
        </table>
    
    </body>
</html>
