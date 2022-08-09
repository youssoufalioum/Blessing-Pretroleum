package net.blessingpetroleum.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.web.bind.annotation.CrossOrigin;

import net.blessingpetroleum.entities.Carburant;

@RepositoryRestResource(path = "carburants")
@CrossOrigin(origins ="http://localhost:4200") 
public interface CarburantRepository extends JpaRepository<Carburant, Integer> {
     public Carburant findByTypeCarburant(String typeCarburant);
}
