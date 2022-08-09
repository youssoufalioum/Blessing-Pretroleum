package net.blessingpetroleum.services;

import java.time.LocalDateTime;
import java.util.Optional;
import java.util.Random;

import javax.transaction.Transactional;

import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import net.blessingpetroleum.dto.ClientDto;
import net.blessingpetroleum.dto.CompteDto;
import net.blessingpetroleum.dto.ConsommationDto;
import net.blessingpetroleum.entities.Agence;
import net.blessingpetroleum.entities.Carburant;
import net.blessingpetroleum.entities.Client;
import net.blessingpetroleum.entities.Compte;
import net.blessingpetroleum.entities.Consommation;
import net.blessingpetroleum.repositories.AgenceRepository;
import net.blessingpetroleum.repositories.CarburantRepository;
import net.blessingpetroleum.repositories.ClientRepository;
import net.blessingpetroleum.repositories.CompteRepository;
import net.blessingpetroleum.repositories.ConsommationRepository;

/**
 * @author Youssoufou Alioum
 *
 */
@Service
@Transactional
public class ClientServiceImpl implements IClientService {

	ClientRepository clientRepository;
	CompteRepository compteRepository;
	CarburantRepository carburantRepository;
	ConsommationRepository consommationRepository;
	AgenceRepository agenceRepository;
	ModelMapper modelMapper;

	public ClientServiceImpl(ClientRepository clientRepository, CompteRepository compteRepository,
			CarburantRepository carburantRepository, ConsommationRepository consommationRepository,
			AgenceRepository agenceRepository, ModelMapper modelMapper) {
		super();
		this.clientRepository = clientRepository;
		this.compteRepository = compteRepository;
		this.carburantRepository = carburantRepository;
		this.consommationRepository = consommationRepository;
		this.agenceRepository = agenceRepository;
		this.modelMapper = modelMapper;
	}

	@Override
	public Compte approvisionnerCompte(int idClient, int montant) {
		Compte compte = compteRepository.findByClientId(idClient);
		compte.setSolde(compte.getSolde() + montant);
		return compteRepository.save(compte);
	}

	@Override
	public Consommation consommerCarburant(String typeCarburant, int montant, String modePaiement, int idAgence,
			int idClient) {
		Carburant carburant = carburantRepository.findByTypeCarburant(typeCarburant);
		Compte compte = compteRepository.findByClientId(idClient);
		double puCarburant = carburant.getPrixUnitaire();
		if (montant > compte.getSolde()) {
			throw new RuntimeException("Votre Solde est insuffisant");
		} else {
			double nouveauSolde = compte.getSolde() - montant;
			compte.setSolde(nouveauSolde);
			compteRepository.save(compte);
			double quantite = montant / puCarburant;

			LocalDateTime date = LocalDateTime.now();

			Consommation consommation = new Consommation(quantite, montant, modePaiement, date, new Client(idClient),
					new Agence(idAgence), new Carburant(carburant.getId()));

			return consommationRepository.save(consommation);
		}

	}

	@Override
	public Client creerCompte(Client client) {
		String numeroCompte = genererNumeroCompte(10);
		Compte compte = new Compte(numeroCompte, 0, client);
		client.setCompte(compte);
		return clientRepository.save(client);
	}

	@Override
	public void supprimerCompte(int id) {
		clientRepository.deleteById(id);
	}

	@Override
	public void modifierCompte(Client client) {
		clientRepository.save(client);
	}

	/**
	 * Methode permettant de générer le numero de compte
	 * 
	 * @param len
	 * @return String
	 */
	public String genererNumeroCompte(int len) {
		String chars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
		Random rnd = new Random();
		StringBuilder sb = new StringBuilder(len);
		for (int i = 0; i < len; i++)
			sb.append(chars.charAt(rnd.nextInt(chars.length())));
		return "BP" + sb.toString();
	}

	@Override
	public Carburant ajouterModifierCarburant(Carburant carburant) {
		return carburantRepository.save(carburant);
	}

	@Override
	public Agence ajouterModifierAgence(Agence agence) {
		return agenceRepository.save(agence);
	}

	public ClientDto convertirClientEnDto(Client client) {
		ClientDto clientDto = modelMapper.map(client, ClientDto.class);
		return clientDto;
	}

	public Client convertirDtoEnClient(ClientDto clientDto) {
		Client client = modelMapper.map(clientDto, Client.class);
		return client;
	}

	public CompteDto convertirCompteEnDto(Compte compte) {
		CompteDto compteDto = modelMapper.map(compte, CompteDto.class);
		return compteDto;
	}

	public Compte convertirDtoEnCompte(CompteDto compteDto) {
		Compte compte = modelMapper.map(compteDto, Compte.class);
		return compte;
	}

	public ConsommationDto convertirConsommationEnDto(Consommation consommation) {
		ConsommationDto consommationDto = modelMapper.map(consommation, ConsommationDto.class);
		return consommationDto;
	}

	public Consommation convertirDtoEnConsommation(ConsommationDto consommationDto) {
		Consommation consommation = modelMapper.map(consommationDto, Consommation.class);
		return consommation;
	}

}
