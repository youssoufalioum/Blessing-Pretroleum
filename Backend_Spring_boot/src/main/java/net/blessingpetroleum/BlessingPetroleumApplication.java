package net.blessingpetroleum;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Lazy;
import org.springframework.data.rest.core.config.RepositoryRestConfiguration;

import net.blessingpetroleum.entities.Agence;
import net.blessingpetroleum.entities.Carburant;
import net.blessingpetroleum.entities.Client;
import net.blessingpetroleum.entities.Compte;
import net.blessingpetroleum.entities.Consommation;
import net.blessingpetroleum.services.ClientServiceImpl;

@SpringBootApplication
public class BlessingPetroleumApplication implements CommandLineRunner{
	
	@Bean 
	  public ModelMapper modelMapper() { 
		  return new ModelMapper();
	  }
	
	@Autowired
	private RepositoryRestConfiguration restConfiguration;
	@Autowired
	ClientServiceImpl clientServiceImpl;

	public static void main(String[] args) {
		SpringApplication.run(BlessingPetroleumApplication.class, args);
	}

	@Override
	public void run(String... args) throws Exception {
		
		//Instructions permettant d'afficher les id dans le format JSON de REST
		restConfiguration.exposeIdsFor(Agence.class,Carburant.class,Client.class,Compte.class,Consommation.class);
		
		Client client1 = new Client("Youssouf","Alioum","+237695415450","youssoufalioum@yahoo.fr","12345678");
		clientServiceImpl.creerCompte(client1);
		
		Client client2 = new Client("Moussa","Ibrahim","+237653415450","youssoufalioum6@gmail.com","123456789");
		clientServiceImpl.creerCompte(client2);
		
		//Compte client3 = clientServiceImpl.consulterCompte(1);
		//System.out.println("Numero Compte: "+client3.getNumeroCompte());
		//System.out.println("Solde: "+client3.getSolde());
		//System.out.println("Client: "+client3.getClient().getId());
		
		//double solde=clientServiceImpl.consulterSolde("GaE9IMd27j");
		//System.out.println("Solde par Matricule: "+solde);
		
		clientServiceImpl.approvisionnerCompte(1, 100000);
		clientServiceImpl.approvisionnerCompte(2, 20000);
		
		//double soldeAjoute=clientServiceImpl.consulterSolde("GaE9IMd27j");
		//System.out.println("Solde Ajouter: "+soldeAjoute);
		
		//double soldeAjoute2=clientServiceImpl.consulterSolde("fii2gKIg5C");
		//System.out.println("Solde Ajouter2: "+soldeAjoute2);
		
		Carburant essence = new Carburant("essence", 500);
		Carburant gazoil = new Carburant("gazoil", 800);
		clientServiceImpl.ajouterModifierCarburant(essence);
		clientServiceImpl.ajouterModifierCarburant(gazoil);
		
		Agence agence = new Agence("Blessing Petroleum", "Douala", "Ndokoti", "+237242351682");
		clientServiceImpl.ajouterModifierAgence(agence);
		
		clientServiceImpl.consommerCarburant("essence", 5000, "CASH", 1, 1);
		clientServiceImpl.consommerCarburant("essence", 5000, "OM", 1, 2);
		
		//double soldeAjoute3=clientServiceImpl.consulterSolde("GaE9IMd27j");
		//System.out.println("Solde Ajouter3: "+soldeAjoute3);
		
		//double soldeAjoute4=clientServiceImpl.consulterSolde("fii2gKIg5C");
		//System.out.println("Solde Ajouter4: "+soldeAjoute4);
		
		//clientServiceImpl.supprimerCompte(2);
	}
	

}
