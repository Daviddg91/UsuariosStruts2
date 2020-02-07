/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelos;

import Modelos.Clientes;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Order;

/**
 *
 * @author adminUser
 */
public class ClientesModel {
    
   public List<Clientes> getListaClientes(){    
     Session s= NewHibernateUtil.getSessionFactory().openSession();
     
    List <Clientes> listaClientes = new ArrayList<Clientes>();
    
    try{
    s.beginTransaction();
         Criteria crit = s.createCriteria(Clientes.class);
    listaClientes = crit.list();
    
       System.out.println(listaClientes);
    }catch(Exception e){
    e.printStackTrace();
    s.getTransaction().rollback();
    }
    return listaClientes;
    }
   
       public List<Clientes> getListaNameClientes(){
    Session s= NewHibernateUtil.getSessionFactory().openSession();
    List <Clientes> listaClientes = new ArrayList<Clientes>();
    
    try{
    s.beginTransaction();
    //listaClientes = s.createCriteria(Clientes.class).list().sort(c);
    
   Criteria crit =s.createCriteria(Clientes.class);
       Order o= Order.asc("nombre");
       crit.addOrder(o);
       listaClientes= crit.list(); 
   }catch(Exception e){
    e.printStackTrace();
    s.getTransaction().rollback();
    }
    return listaClientes;
    }
                public List<Clientes> getListaApellidosClientes(){
    Session s= NewHibernateUtil.getSessionFactory().openSession();
    List <Clientes> listaClientes = new ArrayList<Clientes>();
    
    try{
    s.beginTransaction();
    //listaClientes = s.createCriteria(Clientes.class).list().sort(c);
    
   Criteria crit =s.createCriteria(Clientes.class);
       Order o= Order.asc("apellidos");
       crit.addOrder(o);
       listaClientes= crit.list(); 
   }catch(Exception e){
    e.printStackTrace();
    s.getTransaction().rollback();
    }
    return listaClientes;
    }
                      public List<Clientes> getListaEdadClientes(){
    Session s= NewHibernateUtil.getSessionFactory().openSession();
    List <Clientes> listaClientes = new ArrayList<Clientes>();
    
    try{
    s.beginTransaction();
    //listaClientes = s.createCriteria(Clientes.class).list().sort(c);
    
   Criteria crit =s.createCriteria(Clientes.class);
       Order o= Order.asc("edad");
       crit.addOrder(o);
       listaClientes= crit.list(); 
   }catch(Exception e){
    e.printStackTrace();
    s.getTransaction().rollback();
    }
    return listaClientes;
    }
       public List<Clientes> getListaCorreoClientes(){
    Session s= NewHibernateUtil.getSessionFactory().openSession();
    List <Clientes> listaClientes = new ArrayList<Clientes>();
    
    try{
    s.beginTransaction();
    //listaClientes = s.createCriteria(Clientes.class).list().sort(c);
    
   Criteria crit =s.createCriteria(Clientes.class);
       Order o= Order.asc("correo");
       crit.addOrder(o);
       listaClientes= crit.list(); 
   }catch(Exception e){
    e.printStackTrace();
    s.getTransaction().rollback();
    }
    return listaClientes;
    }
     public void insertar(Clientes j){
    
       Session s= NewHibernateUtil.getSessionFactory().openSession();
    
    try{
    s.beginTransaction();
    s.save(j);
    s.getTransaction().commit();

    }catch(Exception e){
    e.printStackTrace();
    s.getTransaction().rollback();
    }
    
    }
    public void editar(Clientes j){
    
       Session s= NewHibernateUtil.getSessionFactory().openSession();
    
    try{
    s.getTransaction().begin();
    s.update(j);
    s.getTransaction().commit();

    }catch(Exception e){
    e.printStackTrace();
    s.getTransaction().rollback();
    }
    
    }
     public void borrar(Clientes j){
    
       Session s= NewHibernateUtil.getSessionFactory().openSession();
    
    try{
    s.beginTransaction();
    s.delete(j);
    s.getTransaction().commit();

    }catch(Exception e){
    e.printStackTrace();
    s.getTransaction().rollback();
    }
    
    }
     
     public Clientes getCliente(int id){
     
      Session s= NewHibernateUtil.getSessionFactory().openSession();
      Clientes cliente1=null;
    try{
    s.beginTransaction();
    cliente1= (Clientes)s.get(Clientes.class,id);
    s.getTransaction().commit();

    }catch(Exception e){
    e.printStackTrace();
    s.getTransaction().rollback();
    }

     
     
     return cliente1;
     }
     public List<Clientes> getCliente2(int id){
     
      Session s= NewHibernateUtil.getSessionFactory().openSession();
      
       List<Clientes> cliente2=null;
    try{
        
    s.beginTransaction();
   
   cliente2= (List<Clientes>)s.createSQLQuery("SELECT * FROM Clientes where id="+id+";").addEntity(Clientes.class).list();
   /* 
    cliente1= (Clientes)s.get(Clientes.class,id);
   */ s.getTransaction().commit();

    }catch(Exception e){
    e.printStackTrace();
    s.getTransaction().rollback();
    }
       

     
     
     return cliente2;
     }
      public List<Clientes> getClienteBusca2(String cadena){
     
      Session s= NewHibernateUtil.getSessionFactory().openSession();
      
       List<Clientes> cliente2=null;
       String consulta="";
          consulta="SELECT * FROM Clientes where nombre like '%"+cadena+"%' or apellidos like '%"+cadena+"%' or dni like '%"+cadena+"%' ;";
          System.out.println(consulta);
    try{
         System.out.println("yiujuuuuu");
    s.beginTransaction();
        
   cliente2= (List<Clientes>)s.createSQLQuery(consulta).addEntity(Clientes.class).list();
    s.getTransaction().commit();

    
    
    }catch(Exception e){
    e.printStackTrace();
    s.getTransaction().rollback();
    }
       

     
     
     return cliente2;
     }
       public List<String> getListaClientesBuscador(String cadenaBusqueda){
     List<String> listfinal = null ;
      Session s= NewHibernateUtil.getSessionFactory().openSession();
       s.getTransaction().begin();
       Clientes cliente1=new  Clientes();
    try{
       

     Query query1= s.createQuery("select r from Clientes r where nombre like :name or apellidos like :name or dni like :name");
   query1.setString("name","%"+ cadenaBusqueda+"%");
  
   listfinal=query1.list();
  
s.getTransaction().commit();
    }catch(Exception e){
    e.printStackTrace();
    s.getTransaction().rollback();
    }

     
     
     return listfinal;
     }
    public List<Clientes> getListaClientesBuscador2(String cadenaBusqueda){
     List<Clientes> listfinal = null ;
      Session s= NewHibernateUtil.getSessionFactory().openSession();
       s.getTransaction().begin();
       Clientes cliente1=new  Clientes();
    try{
        System.out.println("yiujuuuuu");
   Query query1= s.createQuery("select r from Clientes r where nombre like :name or apellidos like :name or dni like :name");
   query1.setString("name","%"+ cadenaBusqueda+"%");
  
   listfinal=query1.list();
    s.getTransaction().commit();
    }catch(Exception e){
    e.printStackTrace();
    s.getTransaction().rollback();
    }

     
     
     return listfinal;
     }
   
}
