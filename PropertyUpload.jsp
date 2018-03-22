<%-- 
    Document   : PropertyUpload
    Created on : 1 Mar, 2018, 11:29:08 AM
    Author     : Swetlana Xavier
--%>

<jsp:useBean class="mydb.dbconnection" id="obj"></jsp:useBean>

<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%@page import="org.apache.commons.fileupload.*" %>
<%@page import="org.apache.commons.fileupload.servlet.*" %>
<%@page import="org.apache.commons.fileupload.disk.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Property Upload</title>
    </head>
    <body>
        <%
            
            String field_name="";
        FileItem f_item=null;
String file_name="";

File savedFile=null;
String fn="",pf="";

String field[] = new String[20];
String value[]=new String[20];

//checking if request cotains multipart data
boolean isMultipart=ServletFileUpload.isMultipartContent(request);

if(isMultipart)
{
    

    FileItemFactory factory=new DiskFileItemFactory();
    ServletFileUpload upload=new ServletFileUpload(factory);

    //declaring a list of form fields
    List items_list=null;

    //assigning fields to list 'items_list'
    try
    {
    items_list=upload.parseRequest(request);
    }
    catch(FileUploadException ex)
    {
        out.println(ex);
    }

          //declaring iterator
   Iterator itr=items_list.iterator();
    int k=0;
    //iterating through the list 'items_list'
    while(itr.hasNext())
    {
        
        //typecasting next element in items_list as fileitem
        f_item=(FileItem)itr.next();

        //checking if 'f_item' contains a formfield(common controls like textbox,dropdown,radio buttonetc)
       if(f_item.isFormField())
        {
          System.out.println("ifff 2");
            //getting fieldname and value
            field[k]=f_item.getFieldName();
            value[k]=f_item.getString();
                
                k++;
        }
       else
       {
		   
		   
            //f_item=(FileItem)itr.next();
            
           file_name=f_item.getName();
           field_name=f_item.getFieldName();
           if(field_name.equals("txtphoto"))
           {
           String ext=file_name.substring(file_name.lastIndexOf("."));
            //setting path to store image
            File proj_path=new File(config.getServletContext().getRealPath("/"));
            String file_path=proj_path.getParentFile().getParentFile().getPath()+"\\web\\Users\\PropertyImages\\";
            Random r=new Random();
             int r_num=r.nextInt(1111)+999;
             System.out.println("ifff : "+fn);
            fn="property_"+r_num+ext;
            //creating a file object
            savedFile=new File(file_path+fn);
            try
            {
                //writing the file object
                f_item.write(savedFile);               
                
            }
            catch(Exception ex)
            {
                out.println(ex);
            }
            }
           
           if(field_name.equals("txtproof"))
           {
           String ext=file_name.substring(file_name.lastIndexOf("."));
            //setting path to store image
            File proj_path=new File(config.getServletContext().getRealPath("/"));
            String file_path=proj_path.getParentFile().getParentFile().getPath()+"\\web\\Users\\PropertyProof\\";
            Random r=new Random();
             int r_num=r.nextInt(1111)+999;
             
            pf="Proof_"+r_num+ext;
            //creating a file object
            savedFile=new File(file_path+pf);
            try
            {
                //writing the file object
                f_item.write(savedFile);               
                
            }
            catch(Exception ex)
            {
                out.println(ex);
            }
            }
           
           
              
       }
           
           }
    //Strinh str1="insert into tbl_user ()";
    String str1="insert into tbl_property(property_image,property_caption,constructiontype_id,district_id,property_placedetails,property_rate,property_sqft,property_description,property_proof,user_id)"
            + "values('"+fn+"','"+value[0]+"','"+value[1]+"','"+value[2]+"','"+value[3]+"','"+value[4]+"','"+value[5]+"','"+value[6]+"','"+pf+"','"+session.getAttribute("userid") +"')";
  
   out.println(str1);
   
    boolean status=obj.ExecuteCommand(str1);
    
    if(status==true)
    {
      %> 
       <script type="text/javascript">
            alert("Upload Successfully..");
            setTimeout(function(){window.location.href='AddProperty.jsp'},100);
        </script>
     <%
    }
     }


   %>
    </body>
</html>
