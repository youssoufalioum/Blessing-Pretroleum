package net.blessingpetroleum.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Data
@ToString
public class Compte {

	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(unique = true,nullable = false)
	private String numeroCompte;
	private double solde;
	@OneToOne
	private Client client;
	
	public Compte(int id) {
		super();
		this.id = id;
	}

	public Compte(String numeroCompte, double solde) {
		super();
		this.numeroCompte = numeroCompte;
		this.solde = solde;
	}

	public Compte(String numeroCompte, double solde, Client client) {
		super();
		this.numeroCompte = numeroCompte;
		this.solde = solde;
		this.client = client;
	}
	
}
