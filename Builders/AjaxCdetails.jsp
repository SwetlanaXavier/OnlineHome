<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="mydb.dbconnection" id="obj"></jsp:useBean>
      <%
          String cdetId=request.getParameter("cdetID");
      %>
     
                    <%
                        String sell="select *from tbl_construction where construction_id='"+cdetId+"'";
                         ResultSet rss=obj.selectData(sell);
                        while(rss.next())
                        {
                    %>
                    <option value="<%=rss.getString("construction_id")%>"> 
                            
                    
                      <%=rss.getString("construction_number")%>      
                           
                    </option>
                    <%
                       }
                    %>
               
 

