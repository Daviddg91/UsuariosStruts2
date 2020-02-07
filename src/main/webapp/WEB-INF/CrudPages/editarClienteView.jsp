<%-- 
    Document   : editarClienteView
    Created on : Feb 28, 2019, 1:40:43 PM
    Author     : adminUser
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                      <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" >
               
                           <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <title>Editar Usuario</title>
    </head>
    <body>
        
        <h1>Nuevo Cliente2!</h1>
        
       <ol class="breadcrumb">
             <li><a href="<s:url action="listarClientes"/>">Lista de Clientes</li></a> &nbsp;&nbsp; >> &nbsp;&nbsp;
            <li class="active">Insertar Cliente</li>
            
        </ol>
        
           
         <s:form  name="editarForm" action="guardarEditar"  method="post"> 
                         <s:hidden name="cliente.id" value="%{Cliente.id}"/>
                    <s:textfield name="cliente.nombre" label="Nombre:" value="%{Cliente.nombre}" />
                    <s:textfield name="cliente.apellidos" label="Apellidos:" value="%{Cliente.apellidos}"/>
                   <s:textfield name="cliente.dni" label="DNI:" value="%{Cliente.dni}"/>
                   <s:textfield name="cliente.correo" label="Email:" value="%{Cliente.correo}"/>
                    <s:textfield type="number" name="cliente.telefono" label="Telefono:" value="%{cliente.telefono}" />    
                    <s:textfield  name="cliente.direccion" label="Direccion:" value="%{Cliente.direccion}" />
                    <s:textfield type="number" name="cliente.cp" label="CP:" value="%{Cliente.cp}" />  
                   <s:select label="Edad:" 
		headerKey="-1" headerValue="Seleccione su edad"
		list="edades" 
		name="cliente.edad" 
                value="%{Cliente.edad}"
		 /> 

         
     
   
          <s:submit  name="guardarButon" value="Guardar Cliente" class="btn btn-success"></s:submit>
        </s:form>
         
     
    </body>
</html>
