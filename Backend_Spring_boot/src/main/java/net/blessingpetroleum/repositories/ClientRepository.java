package net.blessingpetroleum.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.web.bind.annotation.CrossOrigin;

import net.blessingpetroleum.entities.Client;

@RepositoryRestResource(path = "clients")
@CrossOrigin(origins ="http://localhost:4200") 
public interface ClientRepository extends JpaRepository<Client, Integer> {
		//boolean existBy
}
