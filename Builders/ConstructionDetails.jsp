<%-- 
    Document   : ConstructionDetails
    Created on : 12 Mar, 2018, 11:39:39 AM
    Author     : Swetlana Xavier
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="mydb.dbconnection" id="obj"></jsp:useBean>
    
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Construction Details</title>
                 <script src="jquery.js" type="text/javascript"></script>
                 <script>
function C(cdetId)
	  {
     	
    
     $.ajax({url: "AjaxCdetails.jsp?cdetID="+cdetId, success: function(result){
        $("#details").html(result);
    }});

	  }       
        
      </script> 
    </head>
    <body>
        
                <%  
          
 
            String detailsId="";
            String description="";
             String amount="";
             String rentamount="";
             String leaseamount="";
            String Construction="", cid="";
             if(request.getParameter("btnsubmit")!=null)
          {
            description=request.getParameter("txtdesc");
              Construction=request.getParameter("Cimage");
              amount=request.getParameter("txtamt");
               rentamount=request.getParameter("txtrentamt");
                leaseamount=request.getParameter("txtleaseamt");

               String insQry="insert into tbl_constructiondetails(construction_id,Description,construction_amount,rent_amount,lease_amount)"
                       + "values('"+Construction+"','"+description+"','"+amount+"','"+rentamount+"','"+leaseamount+"')";
                out.println(insQry);
                 boolean b1=obj.ExecuteCommand(insQry);
                  if(b1)
                  {
                    response.sendRedirect("ConstructionDetails.jsp");
                  }
                  else
                  {
                      out.println(insQry);
                  }
                 
               
          }
            
        %>

        
        <form name="frmCDetails" >
            <table  align="center">
                  <tr>
                    <td>Construction Name</td><td>
                         <select name="Cimage" id="details">
                    <option value="selcimage">--Select--</option>
                    <%
                        String selcimage="select *from tbl_construction where builders_id='"+session.getAttribute("buildersid")+"'";
                         ResultSet rs2=obj.selectData(selcimage);
                        while(rs2.next())
                        {
                            String id=rs2.getString("construction_id");
                    %>
                  
                      
                      <option <% if(cid.equals(id)){%> selected=""<%}%> value="<%=rs2.getString("construction_id")%>"><%=rs2.getString("construction_caption")%></option>

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
 