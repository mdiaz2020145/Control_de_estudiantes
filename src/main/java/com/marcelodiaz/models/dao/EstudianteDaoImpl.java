package com.marcelodiaz.models.dao;

import com.marcelodiaz.db.Conexion;
import com.marcelodiaz.models.domain.Estudiante;
import com.marcelodiaz.models.idao.IEstudianteDao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class EstudianteDaoImpl implements IEstudianteDao {

   private static final String SQL_SELECT ="SELECT id_estudiante, nombre, apellido, email, telefono, saldo FROM estudiante";
    private static final String SQL_DELETE="DELETE FROM estudiante where id_estudiante = ?";
    private static final String SQL_INSERT="INSERT INTO estudiante (nombre,apellido,email,telefono,saldo) VALUES(?,?,?,?,?)";
    private static final String SQL_SELECT_BY_ID="SELECT id_estudiante, nombre, apellido, email, telefono, saldo FROM estudiante WHERE id_estudiante = ?";
    private static final String SQL_UPDATE = "UPDATE estudiante SET nombre = ?, apellido = ?,email=?, telefono = ?, saldo=? WHERE id_estudiante = ?";
   
    private Connection conn = null;
    private PreparedStatement pstmt = null;
    private ResultSet rs = null;
    private Estudiante estudiante= null;
    List<Estudiante> estudiantes = new ArrayList<>();
    
    @Override
    public List<Estudiante> listar() {
        try{
            conn = Conexion.getConnection();
            pstmt = conn.prepareStatement(SQL_SELECT);
            rs = pstmt.executeQuery();
            while(rs.next()){
                int idEstudiante = rs.getInt("id_estudiante");
                String nombre = rs.getString("nombre");
                String apellido = rs.getString("apellido");
                String email = rs.getString("email");
                String telefono = rs.getString("telefono");
                double saldo = rs.getInt("saldo");
                
                estudiante = new Estudiante(idEstudiante,nombre,apellido,email,telefono,saldo);
                estudiantes.add(estudiante);
            }
        }catch(SQLException e){
            e.printStackTrace();
        }catch(Exception ex){
            ex.printStackTrace();
        }finally{
            Conexion.close(rs);
            Conexion.close(pstmt);
            Conexion.close(conn);
        }
        return estudiantes;
    }

    @Override
    public Estudiante encontrar(Estudiante estudiante) {
        try {
            conn = Conexion.getConnection();
            pstmt = conn.prepareStatement(SQL_SELECT_BY_ID);
            pstmt.setInt(1,estudiante.getIdEstudiante());
            rs = pstmt.executeQuery();
            while (rs.next()) {
                String nombre = rs.getString("nombre");
                String apellido = rs.getString("apellido");
                String email = rs.getString("email");
                String telefono = rs.getString("telefono");
                double saldo = rs.getInt("saldo");
                
                estudiante.setNombre(nombre);
                estudiante.setApellido(apellido);
                estudiante.setEmail(email);
                estudiante.setTelefono(telefono);
                estudiante.setSaldo(saldo);
                
 
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            Conexion.close(rs);
            Conexion.close(pstmt);
            Conexion.close(conn);
        }
        return estudiante;
    }

    @Override
    public int insertar(Estudiante estudiante) {
        int rows = 0;
        try{
            conn = Conexion.getConnection(); 
            pstmt = conn.prepareStatement(SQL_INSERT);
            pstmt.setString(1,estudiante.getNombre());
            pstmt.setString(2,estudiante.getApellido());
            pstmt.setString(3,estudiante.getEmail());
            pstmt.setString(4,estudiante.getTelefono());
            pstmt.setDouble(5,estudiante.getSaldo());
            
            rows = pstmt.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace(System.out);
            
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            Conexion.close(pstmt);
            Conexion.close(conn);
        }
        return rows;
    }

    @Override
    public int actualizar(Estudiante estudiante) {
        int rows = 0;
        try {
            conn = Conexion.getConnection();
            pstmt = conn.prepareStatement(SQL_UPDATE);
            pstmt.setString(1, estudiante.getNombre());
            pstmt.setString(2, estudiante.getApellido());
            pstmt.setString(3, estudiante.getEmail());
            pstmt.setString(4, estudiante.getTelefono());
            pstmt.setDouble(5, estudiante.getSaldo());
            pstmt.setDouble(6,estudiante.getIdEstudiante());

            rows = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            Conexion.close(pstmt);
            Conexion.close(conn);
        }
        return rows;
    }

    @Override
    public int eliminar(Estudiante estudiante) {
      int rows = 0;
      try{
          conn = Conexion.getConnection();
          pstmt = conn.prepareStatement(SQL_DELETE);
          pstmt.setInt(1, estudiante.getIdEstudiante());
          System.out.println(pstmt.toString());
          rows = pstmt.executeUpdate();
      }catch(SQLException ex){
          ex.printStackTrace();
      }finally{
          Conexion.close(pstmt);
          Conexion.close(conn);
      }
      return rows;
    }

}
