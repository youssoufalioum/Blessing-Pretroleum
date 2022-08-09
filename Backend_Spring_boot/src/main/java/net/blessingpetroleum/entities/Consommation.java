package net.blessingpetroleum.entities;

import java.sql.Date;
import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Data
@ToString
public class Consommation {
	
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private double quantite;
	private double montant;
	private String modePaiement;
	private LocalDateTime date;
	@ManyToOne
	private Client client;
	@ManyToOne
	private Agence agence;
	@ManyToOne
	private Carburant carburant;
	
	public Consommation(int id) {
		super();
		this.id = id;
	}

	public Consommation(double quantite, double montant, String modePaiement, LocalDateTime date, Client client, Agence agence,
			Carburant carburant) {
		super();
		this.quantite = quantite;
		this.montant = montant;
		this.modePaiement = modePaiement;
		this.date = date;
		this.client = client;
		this.agence = agence;
		this.carburant = carburant;
	}
	
	
	
}
