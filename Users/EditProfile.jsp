<%-- 
    Document   : EditProfile
    Created on : 15 Mar, 2018, 11:48:58 AM
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
    
            String UserId="" , Uid=""; 
            String UserName="" , UName="";
          //  String District="", Dis="";
            String Contact="" , Cno="";
            String Email="" ,ema="";
            //String Photo="", pho="";
            String Address="", addr="";
           //String Proof="", pro=""; 
            //String Exper="", exp="";
   
if (request.getParameter("btn_submit") != null) {
                
                UserName=request.getParameter("txt_tname");
                Contact=request.getParameter("txt_cno");
                Email=request.getParameter("txt_email");
                Address=request.getParameter("txt_adds");
               // District=request.getParameter("seldistrict"); 
                //Exper=request.getParameter("txt_exp");
                 
   
    if(request.getParameter("hid")!=null)
    {
        String up="update tb_user set user_name='"+UserName+"',user_address='"+Address+"',user_contact='"+Contact+"',user_emailid='"+Email+"' where user_id='" +session.getAttribute("userid") + "' ";
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
                  String selQry = "select * from tb_user where user_id='" +session.getAttribute("userid") + "'";
                ResultSet rs = obj.selectData(selQry);
                while(rs.next())
{
                  UName=rs.getString("user_name");
                  addr=rs.getString("user_address");
                   Cno=rs.getString("user_contact");
                  ema=rs.getString("user_emailid");
                  // Dis=rs.getString("district_id");
                 // exp=rs.getString("technician_experience");
                  
}
%>
        
       <h1><font color="blue"><center>Edit Profile</center></font></h1>
        
         <form name="frm_edit">
              <input type="hidden" name="hid" value="<%=Uid%>">
            
            <table class="table table-hover" align="center">
                
               
               
                <tr>
                    <td>Name</td>
                    <td>
                        <input type="text" name="txt_tname" value="<%=UName%>" >
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
                <tr><td colspan="2" align="center">
                        <input type="submit" name="btn_submit" value="SAVE">
                          <input type="submit"  formaction="HomePage.jsp" name="btn_reset" value="CANCEL">
                    </td></tr>
               
                        </table>
                     <a href="HomePage.jsp">back to homepage...</a>
        </form>
       
    </body>
</html>
