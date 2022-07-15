package com.marcelodiaz.controllers;

import com.marcelodiaz.models.domain.Estudiante;
import java.io.IOException;
import java.util.List;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.annotation.WebServlet;
import javax.servlet.ServletException;
import com.marcelodiaz.models.dao.EstudianteDaoImpl;


@WebServlet("/ServletEstudianteController")
public class ServletEstudianteController extends HttpServlet {
    
    private static final String JSP_LISTAR="estudiante/estudiante.jsp";
    private static final String JSP_EDITAR="estudiante/editar-estudiante.jsp";

 
    
   @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
    request.setCharacterEncoding("UTF-8"); 

        String accion = request.getParameter("accion"); 
        
        System.out.println("doGet");
        System.out.println("accion" +accion);
        if(accion != null){
            switch(accion){
                case "listar":
                    listarEstudiantes(request, response);
                    break;
                case "editar":
                    editarEstudiantes(request,response);
                    break;
                case "eliminar":
                    eliminarEstudiantes(request, response);
                    break;
                case "insertar":
                    break;
                    
            }
        }
    
    }
    
    private void editarEstudiantes(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        
        //Recuperar el id del estudiante
        
        int idEstudiante = Integer.parseInt(request.getParameter("idEstudiante"));
        
        Estudiante estudiante = new EstudianteDaoImpl().encontrar(new Estudiante(idEstudiante));    
        
        request.setAttribute("estudiante", estudiante);
        
        System.out.println(estudiante);
        
        request.getRequestDispatcher(JSP_EDITAR).forward(request,response);
    }
            
            
            
            
    private void listarEstudiantes(HttpServletRequest request, HttpServletResponse response) throws IOException{
        List<Estudiante> listaEstudiante = new EstudianteDaoImpl().listar();
        double saldo=0;
        
        for(Estudiante estudiante : listaEstudiante){
            saldo = saldo +estudiante.getSaldo();
        }
        HttpSession sesion = request.getSession();
        sesion.setAttribute("listadoEstudiante", listaEstudiante);
        sesion.setAttribute("totalEstudiantes", listaEstudiante.size());
        sesion.setAttribute("saldoTotal", saldo);
        response.sendRedirect(JSP_LISTAR);
        
    }
    
    private void eliminarEstudiantes(HttpServletRequest request, HttpServletResponse response) throws IOException{
        int idEstudiante = Integer.parseInt(request.getParameter("idEstudiante"));
        
        Estudiante estudiante = new Estudiante(idEstudiante);
        
        int registrosEliminados = new EstudianteDaoImpl().eliminar(estudiante);
        
        System.out.println("Cantidad de registros eliminar: "+registrosEliminados);
        
        listarEstudiantes(request, response);
    }
    
    private void insertarEstudiante(HttpServletRequest request, HttpServletResponse response) throws IOException{
        System.out.println("insertarEstudiante");
        
        //Recuperar los valores de los formularios de agregar estudiante
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String email = request.getParameter("email");
        String telefono = request.getParameter("telefono");
        String saldoStr = request.getParameter("saldo");
         
        double saldo=0;
        
        if((saldoStr !=null) && (!saldoStr.equals(""))){
            saldo = Double.parseDouble(request.getParameter("saldo"));
        }
        
        //crear el objeto tipo estudiante (bean)
        Estudiante estudiante = new Estudiante(nombre, apellido, email, telefono, saldo);
        System.out.println(estudiante);
        
        //Insertar el nuevo objeto de estudiante en la base de datos
        int registrosInsertados = new EstudianteDaoImpl().insertar(estudiante);
        
        System.out.println("Registros insertados" + registrosInsertados);
        
        listarEstudiantes(request, response);
        
    }
    
    private void actualizarEstudiante(HttpServletRequest request,HttpServletResponse response) throws IOException{
        //Recuperar los valores de los formularios de agregar estudiante
        int idEstudiante = Integer.parseInt(request.getParameter("idEstudiante"));
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String email = request.getParameter("email");
        String telefono = request.getParameter("telefono");
        String saldoStr = request.getParameter("saldo");
        double saldo=0;
        if((saldoStr !=null) && (!saldoStr.equals(""))){
            saldo = Double.parseDouble(request.getParameter("saldo"));
        }
        
        
        
        //crear el objeto tipo estudiante (bean)
        Estudiante estudiante = new Estudiante(idEstudiante, nombre, apellido, email, telefono, saldo);
        System.out.println(estudiante);
        
        //Modificamos el objeto en la base de datos
        int registrosModificados = new EstudianteDaoImpl().actualizar(estudiante);
        
        listarEstudiantes(request, response);
        
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException{
    request.setCharacterEncoding("UTF-8");
        
    System.out.println("Estoy en el metodo post");
    
    String accion = request.getParameter("accion");
    
    if(accion !=null){
        switch(accion){
            case "insertar":
                insertarEstudiante(request, response);
                break;
            case "actualizar":
                actualizarEstudiante(request,response);
                break;
        }
    }
    }

}
