package net.blessingpetroleum.dto;

import lombok.Data;
import net.blessingpetroleum.entities.Client;

@Data
public class CompteDto {

	private int id;
	private String numeroCompte;
	private double solde;
	//private Client client;
}
