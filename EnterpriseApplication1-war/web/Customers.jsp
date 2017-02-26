<%-- 
    Document   : Customers
    Created on : 20-feb-2017, 10:01:37
    Author     : entrar
--%>

<%@page import="database.Customer"%>
<%@page import="java.util.List"%>
<%@page import="javax.ejb.EJB"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="ejb.CustomerFacade"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- <%!@EJB CustomerFacade clientesdb; %> --%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Clientes</title>
    </head>
    <body>
        <h1>Insertar nuevo cliente </h1>
        
        // Formulario para insertar nuevos clientes. El tratamiento de los datos
        // (Comprobar que haya ID, por ejemplo), se hace en el InsertCustomer.java
        <form action="InsertCustomer">
            ID: <input type="text" name="Id" value="" /> <br>
              Nombre: <input type="text" name="Nombre" value="" /> <br>
              email:<input type="text" name="email" value="" /> <br>
              Cod.Postal: <input type="text" name="Zipcode" value="" /> <br>
              Descuento:<input type="text" name="Discount" value="" /> <br>
              <input type="submit" name="" value="Insertar" /> <br>      
        </form>
                
        <h1>Clientes de la base de datos:</h1>
        <table  border = "1"> 
          <thead>
              <tr> <th> Id</th> <th>Nombre</th> <th>email</th> 
               <th> ZipCode</th> <th> Discount</th> <th> City</th> </tr> 
          </thead> 
          <tbody>
        <%
        CustomerFacade clientesdb=(CustomerFacade) InitialContext.doLookup
        ("java:global/EnterpriseApplication1/EnterpriseApplication1-ejb/CustomerFacade");

        // Reckgemos todos los clientes de la base de datos
        List<Customer> clientes=clientesdb.findAll();
        
        // Recorremos la lista de clientes y creamos la tabla
        for(Customer c: clientes) {
        %>
              <tr> 
                  <td><%=c.getCustomerId()%> </td> 
                  <td><%=c.getName()%> </td> 
                  <td><%=c.getEmail()%></td> 
                  <td><%=c.getZip().getZipCode()%></td> 
                  <td><%=c.getDiscountCode().getDiscountCode()%></td>
                  <td><%=c.getCity()%></td>
                  <td> 
                      <!--// Botón para eliminar el campo de la BD-->s
                      <form action="Remove">
                          <input type="hidden" name="id" value="<%=c.getCustomerId()%>">
                          <input type="submit" value="Remove">
                      </form>
                  </td>
              </tr> 
        <%
        }
        %>
          </tbody> 
     </table>
    </body>
</html>
