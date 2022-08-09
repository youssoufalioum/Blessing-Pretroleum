import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { FormBuilder, FormGroup, NgForm } from '@angular/forms';
import { DataTableFrenchTranlate } from '../dataTableFrenchLanguage';
import { Router } from '@angular/router';

@Component({
  selector: 'app-liste-clients',
  templateUrl: './liste-clients.component.html',
  styleUrls: ['./liste-clients.component.css']
})
export class ListeClientsComponent implements OnInit {

  dtOptions: DataTables.Settings = {};
  public clients:any;
  formModifier!: FormGroup;

  constructor(private httpClient: HttpClient,private route:Router,private formBuilder:FormBuilder) { }

  ngOnInit(): void {
    this.formModifier= this.formBuilder.group({
      id:'',
      nom:'',
      prenom: '',
      telephone: '',
      email: '',
      numero_cni: ''
    });
    this.dtOptions = {
      pagingType: 'full_numbers',
      pageLength: 7,
      responsive:true,
      language: DataTableFrenchTranlate.french_dataTable
    };
    this.onGetClients();
  }

  onGetClients(){
    this.httpClient.get("http://localhost:8080/blessingpetroleum/api/clients")
    .subscribe(
      data => {
        this.clients=data;
      },err=>{
        console.log(err);
      }
      
    );
  }

  onSubmit(form:NgForm){
    console.log(form.value.nom);

    const body = {
       nom: form.value.nom,
       prenom: form.value.prenom,
       telephone: form.value.telephone,
       email: form.value.email,
       numero_cni: form.value.numero_cni
     };

    this.httpClient.post("http://localhost:8080/blessingpetroleum/api/creerCompte",body)
    .subscribe(
      data => {
        //this.clients=data;
        this.clients=null;
        this.onGetClients();
        form.reset();
        alert('Créer avec success');
      },err=>{
        console.log(err);
      }
      
    );
    
  }

  onDeleteClient(idClient:any){
    this.httpClient.delete("http://localhost:8080/blessingpetroleum/api/clients/"+idClient)
    .subscribe(
      data => {
        //this.clients=data;
        this.clients=null;
        this.onGetClients();
      },err=>{
        console.log(err);
      }
      
    );
  }

  onViewMore(idClient:number){
    //console.log(idClient);
    this.route.navigate(['detailsClient',idClient]);
  }

  modifierClient(client:any){
    this.formModifier.setValue({
      id: client.id,
      nom: client.nom,
      prenom: client.prenom,
      telephone: client.telephone,
      email: client.email,
      numero_cni: client.numero_cni
    });
  }

  onModifier(){
    const body = {
      id: this.formModifier.value.id,
      nom: this.formModifier.value.nom,
      prenom: this.formModifier.value.prenom,
      telephone: this.formModifier.value.telephone,
      email: this.formModifier.value.email,
      numero_cni: this.formModifier.value.numero_cni
    };

   this.httpClient.post("http://localhost:8080/blessingpetroleum/api/clients",body)
   .subscribe(
     data => {
      // this.clients=data;
       alert('Modifier avec success');
       let ref = document.getElementById('fermer');
       ref?.click();
       this.formModifier.reset();
       this.onGetClients();
     },err=>{
       console.log(err);
     }
     
   );
  }

}
