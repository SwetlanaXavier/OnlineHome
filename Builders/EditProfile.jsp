<%-- 
    Document   : EditProfile
    Created on : 22 Feb, 2018, 10:23:14 AM
    Author     : Swetlana Xavier
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="mydb.dbconnection" id="obj"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Builders:EditProfile</title>
    </head>
    <body>
                 <%
    
             String BuildersId="" , Bid=""; 
            String BuildersName="" , BName="";
            String District="", Dis="";
            String Contact="" , Cno="";
            String Email="" ,ema="";
            String Logo="", logo="";
            String Address="", addr="";
            String Proof="", pro=""; 
   
   

if (request.getParameter("btn_submit") != null) {
                
                BuildersName=request.getParameter("txt_bname");
                Contact=request.getParameter("txt_cno");
                Email=request.getParameter("txt_email");
                Address=request.getParameter("txt_adds");
                District=request.getParameter("seldistrict"); 
                 
   
    if(request.getParameter("hid")!=null)
    {
        String up="update tbl_builders set builders_name='"+BuildersName+"',builders_address='"+Address+"',builders_contact='"+Contact+"',builders_emailid='"+Email+"',district_id='"+District+"' where builders_id='" +session.getAttribute("buildersid") + "' ";
        boolean b = obj.ExecuteCommand(up);
        if (b) {
            %>
         
            <script>
                alert("Profile Updated..");
            setTimeout(function() {
                window.location.href = 'EditProfile.jsp'
            }, 100);
                </script>
        
        
        
        <%
                       
                    } else {
                        out.println(up);
                    }

                } 
    
}
 String selQry = "select * from tbl_builders where builders_id='" +session.getAttribute("buildersid") + "'";
                ResultSet rs = obj.selectData(selQry);
                while(rs.next())
{
  
  
                    //Bid=rs.getString("builders_id");
                  BName=rs.getString("builders_name");
                  addr=rs.getString("builders_address");
                 
                   Cno=rs.getString("builders_contact");
                  ema=rs.getString("builders_emailid");
                   Dis=rs.getString("district_id");
                  //logo=rs.getString("builders_logo");
                  
                  //pro=rs.getString("builders_proof"); 
 
}


   %>
        
        <h1><font color="blue"><center>Edit Profile</center></font></h1>
        
         <form name="frm_edit">
              <input type="hidden" name="hid" value="<%=Bid%>">
            
            <table class="table table-hover" align="center">
                
               
               
                <tr>
                    <td>Builder Name</td>
                    <td>
                        <input type="text" name="txt_bname" value="<%=BName%>" >
                    </td>
                </tr>
                <tr>
                    <td>Address</td><td>
                        <input type="text" name="txt_adds" value="<%=addr%>" > 
                    </td>
                </tr>
               <tr>
                    <td>Contact Number</td>
                    <td>
                        <input type="text" name="txt_cno" value="<%=Cno%>" >
                    </td>
                </tr>
                <tr>
                    <td>Email:</td><td>
                    <input type="text" name="txt_email" value="<%=ema%>"  >
                     </td>
                </tr>
                <tr>
                    <td>District</td><td>
                         <select name="seldistrict">
                    <option value="Dis">--Select--</option>
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
              
                
                <tr><td colspan="2" align="center">
                        <input type="submit" name="btn_submit" value="SAVE">
                          <input type="submit"  formaction="HomePage.jsp" name="btn_reset" value="CANCEL">
                    </td></tr>
               
                        </table>
        </form>
                    
    </body>
</html>
