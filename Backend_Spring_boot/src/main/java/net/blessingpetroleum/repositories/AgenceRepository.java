package net.blessingpetroleum.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.web.bind.annotation.CrossOrigin;

import net.blessingpetroleum.entities.Agence;

@RepositoryRestResource(path = "agences")
@CrossOrigin(origins ="http://localhost:4200")
public interface AgenceRepository extends JpaRepository<Agence, Integer> {

}
