package net.blessingpetroleum.entities;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
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
public class Client {

	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String nom;
	private String prenom;
	@Column(unique = true,nullable = true)
	private String telephone;
	private String email;
	private String numero_cni;
	@OneToOne(mappedBy = "client",cascade = CascadeType.ALL,fetch = FetchType.LAZY)
	private Compte compte;
	@OneToMany(mappedBy = "client",cascade = CascadeType.ALL,fetch = FetchType.LAZY)
	private List<Consommation> consommation;
	
	public Client(int id) {
		super();
		this.id = id;
	}

	public Client(String nom, String prenom, String telephone, String email, String numero_cni, Compte compte) {
		super();
		this.nom = nom;
		this.prenom = prenom;
		this.telephone = telephone;
		this.email = email;
		this.numero_cni = numero_cni;
		this.compte=compte;
	}

	public Client(String nom, String prenom, String telephone, String email, String numero_cni) {
		super();
		this.nom = nom;
		this.prenom = prenom;
		this.telephone = telephone;
		this.email = email;
		this.numero_cni = numero_cni;
	}
	
	
	
	
}
