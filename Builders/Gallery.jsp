<%-- 
    Document   : GalaryUpload
    Created on : 16 Feb, 2018, 11:52:50 AM
    Author     : Swetlana Xavier
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="mydb.dbconnection" id="obj"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gallery Upload</title>
    </head>
    <body>
        
        <%  
          
 
            String gallaryId=""; 
            String gallarycaption="";
            String ConstructionImage="";
             if(request.getParameter("btnsubmit")!=null)
          {
            gallarycaption=request.getParameter("txtcaption");
              ConstructionImage=request.getParameter("construction");
               String insQry="insert into tbl_constructgallary(constructgallary_caption,construction_id)"
                       + "values('"+gallarycaption+"','"+ConstructionImage+"')";
                out.println(insQry);
                 boolean b1=obj.ExecuteCommand(insQry);
                  if(b1)
                  {
                    response.sendRedirect("GalaryUpload.jsp");
                  }
                  else
                  {
                      out.println(insQry);
                  }
                 
               
          }
            
        %>

      
        <form name="frm_gallery" action="GalleryUpload.jsp" method="post" enctype="multipart/form-data" >
            <table>
                <tr>
                    <td>Gallery Caption</td>
                    <td><input type="text"  name="txtcaption"></td>
                </tr>
                 <tr>
                    <td>Construction Details</td><td>
                         <select name="construction">
                    <option value="sel">--Select--</option>
                    <%
                        String sel="select *from tbl_construction where builders_id='" +session.getAttribute("buildersid") + "'";
                         ResultSet rs=obj.selectData(sel);
                        while(rs.next())
                        {
                    %>
                    <option value="<%=rs.getString("construction_id")%>" >
                         
                      <%=rs.getString("construction_number")%>      
                      
                      </option>
                    <%
                       }
                    %>
                </select>
                    </td></tr>
                 <tr>
                     <td>
                          <input type="file" name="filegallery">
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
                
        
                
                
    </body>
</html>
