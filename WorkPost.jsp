<%-- 
    Document   : WorkPost
    Created on : 12 Mar, 2018, 3:51:49 PM
    Author     : Swetlana Xavier
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="mydb.dbconnection" id="obj"></jsp:useBean>
  
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Work post</title>
    </head>
    <body>
       
        
        <form name="frm_workpost" action="WorkUpload.jsp" method="post" enctype="multipart/form-data">
            <table>
                <tr>
                    <td>Work post Date: </td>
                    <td><input type="text"  name="txtdate"></td>
                </tr>
                <tr>
                    <td>Work Details</td>
                    <td><input type="text"  name="txtworkdet"></td>
                </tr>
                 
                <tr>
                    <td>Work Budget</td>
                    <td><input type="text"  name="txtworkbudget"></td>
                </tr>
                <tr>
                    <td>Image Upload</td>
                    <td><input type="file"  name="txtimage"></td>
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
