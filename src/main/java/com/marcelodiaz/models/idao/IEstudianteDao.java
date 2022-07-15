    
package com.marcelodiaz.models.idao;

import com.marcelodiaz.models.domain.Estudiante;
import java.util.List;


public interface IEstudianteDao {
    
    public List<Estudiante> listar();
    public Estudiante encontrar(Estudiante estudiante);
    public int insertar(Estudiante estudiante);
    public int actualizar (Estudiante estudiante);
    public int eliminar (Estudiante estudiante);
}
