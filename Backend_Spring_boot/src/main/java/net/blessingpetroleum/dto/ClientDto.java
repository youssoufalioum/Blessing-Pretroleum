package net.blessingpetroleum.dto;

import lombok.Data;

@Data
public class ClientDto {

	private int id;
	private String nom;
	private String prenom;
	private String telephone;
	private String email;
	private String numero_cni;
	
}
