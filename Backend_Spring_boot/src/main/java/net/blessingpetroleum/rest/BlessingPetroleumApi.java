package net.blessingpetroleum.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import net.blessingpetroleum.dto.ClientDto;
import net.blessingpetroleum.dto.CompteDto;
import net.blessingpetroleum.dto.ConsommationDto;
import net.blessingpetroleum.entities.Client;
import net.blessingpetroleum.entities.Compte;
import net.blessingpetroleum.entities.Consommation;
import net.blessingpetroleum.services.ClientServiceImpl;

@RestController
@RequestMapping("/blessingpetroleum/api")
@CrossOrigin(origins ="http://localhost:4200") 
public class BlessingPetroleumApi {

	@Autowired
	ClientServiceImpl clientServiceImpl;

	@PostMapping(value = "/creerCompte", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<ClientDto> creerCompte(@RequestBody ClientDto clientDto) {
		try {
			Client client = clientServiceImpl.convertirDtoEnClient(clientDto);
			Client clientCreer = clientServiceImpl.creerCompte(client);
			return new ResponseEntity<ClientDto>(clientServiceImpl.convertirClientEnDto(clientCreer),
					HttpStatus.CREATED);
		} catch (Exception e) {
			return new ResponseEntity<ClientDto>(HttpStatus.NOT_ACCEPTABLE);
		}
	}

	@PostMapping(value = "/approvisionnerCompte", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<CompteDto> approvisionnerCompte(
			@RequestParam(name = "idClient", defaultValue = "") int idClient,
			@RequestParam(name = "montant", defaultValue = "") int montant) {
		try {
			CompteDto compteDto = clientServiceImpl
					.convertirCompteEnDto(clientServiceImpl.approvisionnerCompte(idClient, montant));
			return ResponseEntity.ok(compteDto);
		} catch (Exception e) {
			return new ResponseEntity<CompteDto>(HttpStatus.NOT_ACCEPTABLE);
		}
	}

	@PostMapping(value = "/consommerCarburant", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<ConsommationDto> consommerCarburant(
			@RequestParam(name = "typeCarburant", defaultValue = "") String typeCarburant,
			@RequestParam(name = "montant", defaultValue = "") int montant,
			@RequestParam(name = "modePaiement", defaultValue = "") String modePaiement,
			@RequestParam(name = "idAgence", defaultValue = "") int idAgence,
			@RequestParam(name = "idClient", defaultValue = "") int idClient) {
		
		try {
			Consommation consommation = clientServiceImpl.consommerCarburant(typeCarburant, montant, modePaiement, idAgence, idClient);
			ConsommationDto consommationDto = clientServiceImpl.convertirConsommationEnDto(consommation);
			return ResponseEntity.ok(consommationDto);
		} catch (Exception e) {
			return new ResponseEntity<ConsommationDto>(HttpStatus.NOT_ACCEPTABLE);
		}

	}

}
