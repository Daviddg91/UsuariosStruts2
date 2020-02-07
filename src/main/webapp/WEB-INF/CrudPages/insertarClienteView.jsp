<%-- 
    Document   : insertarClienteView
    Created on : Feb 28, 2019, 1:51:11 PM
    Author     : adminUser
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                      <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" >
               
                           <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <title>Insertar Cliente</title>
        
        <style>
            #guardarNuevo_guardarButon{
                margin-top:20px;
                margin-right:80px;     
            }
                 
        </style>
    </head>
    <body>
        
        <h1>Nuevo Cliente!</h1>
        
         <ol class="breadcrumb">
             <li><a href="<s:url action="listarClientes"/>">Lista de Clientes</li></a> &nbsp;&nbsp; >> &nbsp;&nbsp;
            <li class="active">Insertar Cliente</li>
            
        </ol>
        
           
        <s:actionerror/>
            <s:form  name="insertaForm" action="guardarNuevo"  method="post"> 
                        
                <s:hidden name="cliente.id" value="%{Cliente.id}"  /><s:fielderror/>
                    <s:textfield name="cliente.nombre" label="Nombre:" required="required" value="%{Cliente.nombre}" /><s:fielderror/>
                    <s:textfield name="cliente.apellidos" type="string" required="required" label="Apellidos:" value="%{Cliente.apellidos}"/><s:fielderror/>
                    <s:textfield name="cliente.dni" pattern="(([X-Z]{1})([-]?)(\d{7})([-]?)([A-Z]{1}))|((\d{8})([-]?)([A-Z]{1}))" required="required" label="DNI:" value="%{Cliente.dni}"/><s:fielderror/>
                   <s:textfield name="cliente.correo" type="email" required="required" label="Email:" value="%{Cliente.correo}"/><s:fielderror/>
                    <s:textfield type="number" min="100000000" max="9999999999" name="cliente.telefono" label="Telefono:" value="%{cliente.telefono}" />    <s:fielderror/>
                    <s:textfield  name="cliente.direccion" required="required" label="Direccion:" value="%{Cliente.direccion}" /><s:fielderror/>
                    <s:textfield type="number" min="1000" max="99999" name="cliente.cp" label="CP:" value="%{Cliente.cp}" />  <s:fielderror/>
                   <s:select label="Edad:"
                        list="edades" 
                        required="required"
                        name="cliente.edad" 
                        min="12"
		 /><s:fielderror/> 
        <br/>
     
   
          <s:submit  name="guardarButon" value="Guardar Cliente" cssClass="btn btn-success"></s:submit>
        </s:form>
    
    </body>
</html>
