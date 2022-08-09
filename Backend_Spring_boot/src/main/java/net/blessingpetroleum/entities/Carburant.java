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
public class Carburant {

	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String typeCarburant;
	private double prixUnitaire;
	@OneToMany(mappedBy = "carburant")
	private List<Consommation> consommation;
	
	public Carburant(int id) {
		super();
		this.id = id;
	}

	public Carburant(String typeCarburant, double prixUnitaire) {
		super();
		this.typeCarburant = typeCarburant;
		this.prixUnitaire = prixUnitaire;
	}

	public Carburant(int id, String typeCarburant, double prixUnitaire) {
		super();
		this.id = id;
		this.typeCarburant = typeCarburant;
		this.prixUnitaire = prixUnitaire;
	}
	
}
