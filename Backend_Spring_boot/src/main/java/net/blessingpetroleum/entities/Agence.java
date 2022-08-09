package net.blessingpetroleum.entities;

import java.util.List;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Data
@ToString
public class Agence {
	
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String nom;
	private String ville;
	private String adresse;
	private String telephone;
	@OneToMany(mappedBy = "agence")
	private List<Consommation> consommation;
	
	public Agence(int id) {
		super();
		this.id = id;
	}

	public Agence(String nom, String ville, String adresse, String telephone) {
		super();
		this.nom = nom;
		this.ville = ville;
		this.adresse = adresse;
		this.telephone = telephone;
	}
	
	
	
}
