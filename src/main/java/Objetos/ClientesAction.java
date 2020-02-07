/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Objetos;


import Modelos.Clientes;

import java.util.ArrayList;
import java.util.List;





import Modelos.ClientesModel;

import com.opensymphony.xwork2.ActionSupport;
import javax.validation.Valid;




public class ClientesAction  extends ActionSupport  {

	    public ClientesAction() {
	    }

	  
	
	
	
	private static final long serialVersionUID = 1L;

	  private int id;

ClientesModel cmodel=new ClientesModel();

     
     
List<Clientes> list2 = null;

Clientes cliente;
String cadenaBusqueda="";
ArrayList edades=null;




	public String listar() throws Exception {
            
	list2=cmodel.getListaClientes();
            
		return SUCCESS;
	}
        
        public String buscarClientes() throws Exception {
	list2=cmodel.getClienteBusca2(cadenaBusqueda);
        setList2(list2);
        
		return SUCCESS;
	}

    public void setList2(List<Clientes> list2) {
        this.list2 = list2;
    }

    public void setCadenaBusqueda(String cadenaBusqueda) {
        this.cadenaBusqueda = cadenaBusqueda;
    }
	
	public List<Clientes> getList2() {
		return list2;
	}

public String insertar() throws Exception {
     cliente = new Clientes();
     generareEdades();
return SUCCESS;
	}

    public ArrayList getEdades() {
        return edades;
    }

    public void setId(int id) {
        this.id = id;
    }
	
    
  
     
    public String editar() throws Exception {
       generareEdades();
        if(id>0){
            cliente=cmodel.getCliente(id);
        }else{
            System.out.println("no llega id ");
        }
        System.out.println("hola");

         return SUCCESS;
}

    public Clientes getCliente() {
        return cliente;
    }
    
    
    public String guardarNew() throws Exception {
       
        System.out.println(Integer.parseInt("0"));
        cliente.setId(0);
               cmodel.insertar(cliente);
		return SUCCESS;
	}
     public String guardarEdit() throws Exception {
               cmodel.editar(cliente);
		return SUCCESS;
	}
    public void generareEdades(){
               int i=0;
    edades=new ArrayList<String>();
    for(i=12;i<=100;i++){
        edades.add(String.valueOf(i));  
          }
    }

    public void setCliente(Clientes cliente) {
        this.cliente = cliente;
    }
    
    
    
        public String eliminarClient() throws Exception {
            cliente=cmodel.getCliente(id);
               cmodel.borrar(cliente);
		return SUCCESS;
	} 
 
}

