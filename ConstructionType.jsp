<%-- 
    Document   : ConstructionType
    Created on : Feb 7, 2018, 2:31:32 PM
    Author     : ckc
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="mydb.dbconnection" id="obj"></jsp:useBean>
    
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CONSTRUCTION TYPE</title>
    </head>
    <body>
         <%  
          String CTId="";   
          String CTName="";
          
 
            String CTypeId="",CTypeName="";  
                       
                        
            if(request.getParameter("edconstructtypeid")!=null)
            {
                String sel="select * from tbl_constructiontype where constructiontype_id='"+request.getParameter("edconstructtypeid")+"'";
                ResultSet rs=obj.selectData(sel);
                if(rs.next())
                {
                   CTypeId=rs.getString("constructiontype_id");
                   CTypeName=rs.getString("constructiontype_type");
        
                }
            }
            
            
            
            
            if(request.getParameter("CTId")!=null)
            {
                String del="delete from tbl_constructiontype where constructiontype_id='"+request.getParameter("CTId")+"'";
                obj.ExecuteCommand(del);
            }
            
            if(request.getParameter("btnsubmit")!=null)
            {
                
                CTypeName=request.getParameter("txtconsttype");
                
                
                if(request.getParameter("hid")!="")
                {
                    String up="update tbl_constructiontype set constructiontype_type='"+CTypeName+"' where constructiontype_id='"+request.getParameter("hid")+"'";
                   boolean b=obj.ExecuteCommand(up);
                  if(b)
                  {
                    response.sendRedirect("ConstructionType.jsp");
                  }
                  else
                  {
                      out.println(up);
                  }
                    
                    
                }else{
                
                
                String insQry="insert into tbl_constructiontype(constructiontype_type)values('"+CTypeName+"')";
                out.println(insQry);
                 boolean b1=obj.ExecuteCommand(insQry);
                  if(b1)
                  {
                    response.sendRedirect("ConstructionType.jsp");
                  }
                  else
                  {
                      out.println(insQry);
                  }
                 }
            }   

            
        %>

        
      
        <form name="frm_constrttype">
            
             <input type="hidden" value="<%=CTypeId%>" name="hid"  >
             
            <table border="2" align="center">
                <tr>
                    <td>Construction Type</td>
                    <td><input type="text" value="<%=CTypeName%>" name="txtconsttype" placeholder="Enter Construction Type"></td>
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
                <th>Construction Type</th>
                

            </tr>
    
        <%
            
            
            int i=1;
            String selQry="select * from tbl_constructiontype";
            ResultSet rs=obj.selectData(selQry);
            while(rs.next())
            {
               CTypeId=rs.getString("constructiontype_id");
               
                
        %>
               <tr>
                   <td><%=i%></td>
                   <td><%=rs.getString("constructiontype_type")%></td>
                   
                
                   <td><a href="ConstructionType.jsp?CTId=<%=CTypeId%>">Delete</a>
                       <a href="ConstructionType.jsp?edconstructtypeid=<%=CTypeId%>">Edit</a></td>
           
                   
               </tr>
               <%
               
               i++;
                
            }
        %>
        </table>
    </body>
</html>
