package net.blessingpetroleum.services;

import net.blessingpetroleum.entities.Agence;
import net.blessingpetroleum.entities.Carburant;
import net.blessingpetroleum.entities.Client;
import net.blessingpetroleum.entities.Compte;
import net.blessingpetroleum.entities.Consommation;

public interface IClientService {

	
	public Compte approvisionnerCompte(int idClient,int montant);
	public Consommation consommerCarburant(String typeCarburant,int montant,String modePaiement,int idAgence,int idClient);

	
	public Client creerCompte(Client client);
	public void supprimerCompte(int idClient);
	public void modifierCompte(Client client);
	
	public Carburant ajouterModifierCarburant(Carburant carburant);
	public Agence ajouterModifierAgence(Agence agence);
	
}
