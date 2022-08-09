package net.blessingpetroleum.repositories;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.web.bind.annotation.CrossOrigin;

import net.blessingpetroleum.entities.Compte;

@RepositoryRestResource
@CrossOrigin(origins ="http://localhost:4200") 
public interface CompteRepository extends JpaRepository<Compte, Integer> {

	public Compte findByClientId(int idClient);
	public Compte findByNumeroCompte(String numeroCompte);
}
