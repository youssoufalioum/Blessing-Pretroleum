package net.blessingpetroleum.dto;

import java.time.LocalDateTime;
import lombok.Data;

@Data
public class ConsommationDto {

	private int id;
	private double quantite;
	private double montant;
	private String modePaiement;
	private LocalDateTime date;
	
}
