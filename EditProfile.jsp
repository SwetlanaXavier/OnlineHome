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
        <title>Edit Profile</title>
    </head>
    <body>
        
            <%
    
            String TechId="" , Tid=""; 
            String TechName="" , TName="";
            String District="", Dis="";
            String Contact="" , Cno="";
            String Email="" ,ema="";
            String Photo="", pho="";
            String Address="", addr="";
            String Proof="", pro=""; 
            String Exper="", exp="";
   
if (request.getParameter("btn_submit") != null) {
                
                TechName=request.getParameter("txt_tname");
                Contact=request.getParameter("txt_cno");
                Email=request.getParameter("txt_email");
                Address=request.getParameter("txt_adds");
                District=request.getParameter("seldistrict"); 
                Exper=request.getParameter("txt_exp");
                 
   
    if(request.getParameter("hid")!=null)
    {
        String up="update tbl_technicians set technician_name='"+TechName+"',technician_address='"+Address+"',technician_contact='"+Contact+"',technician_email='"+Email+"',district_id='"+District+"',technician_experience='"+Exper+"' where technician_id='" +session.getAttribute("technicianid") + "' ";
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
 String selQry = "select * from tbl_technicians where technician_id='" +session.getAttribute("technicianid") + "'";
                ResultSet rs = obj.selectData(selQry);
                while(rs.next())
{
                  TName=rs.getString("technician_name");
                  addr=rs.getString("technician_address");
                   Cno=rs.getString("technician_contact");
                  ema=rs.getString("technician_email");
                   Dis=rs.getString("district_id");
                  exp=rs.getString("technician_experience");
                  
}
%>
        
       <h1><font color="blue"><center>Edit Profile</center></font></h1>
        
         <form name="frm_edit">
              <input type="hidden" name="hid" value="<%=Tid%>">
            
            <table class="table table-hover" align="center">
                
               
               
                <tr>
                    <td>Technician Name</td>
                    <td>
                        <input type="text" name="txt_tname" value="<%=TName%>" >
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
              
                <tr>
                    <td>Experience</td><td>
                    <input type="text" name="txt_exp" value="<%=exp%>"  >
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
