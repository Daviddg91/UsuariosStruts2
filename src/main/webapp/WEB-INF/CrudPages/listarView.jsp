<%@ page contentType="text/html; charset=UTF-8" %>

<%@ taglib prefix="s" uri="/struts-tags" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>

                       <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
                     
                                              <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.tablesorter/2.31.1/js/jquery.tablesorter.js"></script>

                       <script src="https://unpkg.com/ionicons@4.4.4/dist/ionicons.js"></script>
                       
                       <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" >
               
                           <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <title>UsuatriosST</title>
        
                     <style>
               /* Styles for wrapping the search box */

.main {
    width: 70%;
    margin: 50px auto;
}

#buscboton{
   min-height:38px;
   height: 0%;
   min-width: 90px;
    margin-left:30.5%;
}






.has-search .form-control-feedback {
    right: initial;
    left: 0;
    color: #ccc;
}

.has-search .form-control {
    padding-right: 12px;
    padding-left: 34px;
}  
        .rot180 {
	-webkit-transform: rotate(180deg);
	-moz-transform: rotate(180deg);
	rotation: 180deg;
        }
           .rot0 {
	-webkit-transform: rotate(0deg);
	-moz-transform: rotate(0deg);
	rotation: 0deg;
        }
#buscresult thead tr th{
            cursor:pointer;
        }
.triangulo  {
-webkit-text-stroke: 0.65px black;
 color:green;
 margin-left: 3.4%;
}
#buscresult{
    text-align: left;
    
}
#spantri {
  display: flex;
  justify-content:space-between;
  align-content: space-around;
  
}
#padrebusc{
     
   display: flex;

   
}
#buscresult a {
    min-width:100px;
    max-width:20%;
    max-height:20%;
}

#buscresult a {
    
    display: flex;
   justify-content: center;
   align-items: center;
    
}
 body a {
    
    display: flex;
   justify-content: center;
   align-items: center;
    
}
.flexcolumn{
     display: flex;
  flex-direction: column;
    
    
}

a:hover{text-decoration:none;
color:white;}
a{color:white;}
li a{
    color:black;
    
}
li a:hover{
    color:blue;
    
    
}
             </style>  
             <script type="application/javascript">
                 
              function AllTrianDown(){
     
          $("[id*=triangulo]").removeClass("rot180");
                    }
      
        
          function llamadaTriangulo(elem){
              
       AllTrianDown();
       $(elem).find(".triangulo").addClass("rot180");

          }    
                 $(document).ready(function() 
    { 
        
          $("#buscresult").tablesorter(); 
       
        
    } 
);
                 
                 </script>
                 
                 
        
    </head>

    <body>
        <h2><s:property value="message"/></h2>

        <h3>Gestion de Usuarios:</h3>
         <ol class="breadcrumb">
             <li><a  href="<s:url action="listarClientes"/>" >Lista de Clientes</li></a> &nbsp;&nbsp; >> &nbsp;&nbsp;
            
            
        </ol>
        <s:actionerror/>
	<s:form action="busquedaClientes">
		<s:textfield label="Buscar" name="cadenaBusqueda" />
                    <s:submit cssClass="btn btn-success" value="Buscar" />
                
	</s:form>
        
        
        <table id="buscresult" class="table table-bordered table-striped table-hover">
            <thead>
          <tr>
            <th>ID</th>
   
            <th onclick="llamadaTriangulo(this)"><div id="spantri"><div>Nombre</div><div class="triangulo"   id="triangulo1">&#x25BC;</div></div></th>

           

            <th onclick="llamadaTriangulo(this)"><div id="spantri"><div>Apellidos</div><div class="triangulo"  id="triangulo2">&#x25BC;</div></div></th>
            <th onclick="llamadaTriangulo(this)"><div id="spantri"><div>DNI</div><div class="triangulo"  id="triangulo3">&#x25BC;</div></div></th>

                        <th onclick="llamadaTriangulo(this)" ><div id="spantri"><div>Correo</div><div class="triangulo"  id="triangulo3">&#x25BC;</div></div></th>

            <th onclick="llamadaTriangulo(this)"><div id="spantri"><div>Telefono</div><div class="triangulo"  id="triangulo5">&#x25BC;</div></div></th>
            <th onclick="llamadaTriangulo(this)"><div id="spantri"><div>Direccion</div><div class="triangulo"  id="triangulo6">&#x25BC;</div></div></th>
            <th onclick="llamadaTriangulo(this)"><div id="spantri"><div>CP</div><div class="triangulo"  id="triangulo7">&#x25BC;</div></div></th>
                        <th  onclick="llamadaTriangulo(this)" ><div id="spantri"><div>Edad</div><div class="triangulo" id="triangulo8">&#x25BC;</div></div></th>
            <th data-sorter="false">Editar</th>
            <th data-sorter="false">Eliminar</th>
            
          </tr>
             
            </thead>
         
       
    <tbody id="tablebody">
         <s:iterator var="list" status="estado" value="List2">

            <tr>
                <td>
                    <s:property value="id"/>
                </td>
                <td><s:property value="nombre"/>
                </td>
                <td><s:property value="apellidos"/>
                </td>
                <td><s:property value="dni"/>
                </td>
                <td><s:property value="correo"/>
                </td>
                <td><s:property value="telefono"/>
                </td>
                <td><s:property value="direccion"/>
                </td>
                <td><s:property value="cp"/>
                </td>
                <td><s:property value="edad"/>
                </td>
                   <td>
                 <div class=" btn btn-success">
                   <s:a action="editarCliente">
                            <s:param name="id" value="id"/>
                     <ion-icon name="sync"></ion-icon>Editar
                   </s:a>
                 </div>
                 </td>
               
                 
                 <td>   
   

                     <s:url var="eliminarUrl" action="eliminarCliente.action" >
                         <s:param name="id" >
                          <s:property value="#list.id" />
                          </s:param>
                      </s:url>
                                          <a  onclick="return confirm('¿ Estas seguro que desesa eliminar <s:property value="nombre"/> ?');" href='<s:property value="eliminarUrl"/>'>       
   
                     <div class=" btn btn-success">
                    <ion-icon name="trash"></ion-icon>Eliminar
              
                     </div>
                                         </a>        
                </td>
                
            </tr>
 
         </s:iterator>
        </tbody>
         </table>
        <div class=" btn btn-success">
        <s:a  action="insertarCliente" > <ion-icon name="add"></ion-icon>Ingresar Clientes</s:a>
        </div>
        </body>
</html>

