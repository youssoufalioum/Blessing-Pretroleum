import { HttpClient, HttpParams } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, NgForm } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { Constants } from 'src/app/contants';
import { DataTableFrenchTranlate } from 'src/app/dataTableFrenchLanguage';
import { Compte } from 'src/app/models/compte.model';
import { Consommations } from 'src/app/models/consommations.model';

@Component({
  selector: 'app-client',
  templateUrl: './client.component.html',
  styleUrls: ['./client.component.css']
})
export class ClientComponent implements OnInit {

  dtOptions: DataTables.Settings = {};
  idClient:any;
  consommations: any;
  compte:any;
  carburants:any
  agences:any;
  carburantConsommer:any;
  agenceConsommation:any;

  constructor(private route:ActivatedRoute,private httpClient:HttpClient) { }

  ngOnInit(): void {
    this.dtOptions = {
      pagingType: 'full_numbers',
      pageLength: 7,
      responsive:true,
      language: DataTableFrenchTranlate.french_dataTable
    };
    //this.consommations=new Consommations(0,0,0,'','');
    //this.compte=new Compte(0,'',0);
    this.idClient=this.route.snapshot.params['idClient'];
    this.onGetConsommation(this.idClient);
    this.onGetCompte(this.idClient);
    this.onGetCarburants();
    this.onGetAgences();
  }

  onGetConsommation(idClient:number){
    this.httpClient.get(Constants.urlBase+"/blessingpetroleum/api/clients/"+idClient+"/consommation")
    .subscribe(
      (data) => {
        this.consommations=data;
      },err=>{
        console.log(err);
      }
      
    );
  }

  onGetCompte(idClient:number){
    this.httpClient.get(Constants.urlBase+"/blessingpetroleum/api/clients/"+idClient+"/compte")
    .subscribe(
      data => {
        this.compte=data;
      },err=>{
        console.log(err);
      }
      
    );
  }

  onGetCarburants(){
    this.httpClient.get(Constants.urlBase+"/blessingpetroleum/api/carburants")
    .subscribe(
      data => {
        this.carburants=data;
      },err=>{
        console.log(err);
      }
      
    );
  }

  onGetAgences(){
    this.httpClient.get(Constants.urlBase+"/blessingpetroleum/api/agences")
    .subscribe(
      data => {
        this.agences=data;
      },err=>{
        console.log(err);
      }
      
    );
  }

  onSubmit(form:NgForm){

  const params = new HttpParams()
  .set('typeCarburant', form.value.typeCarburant)
  .set('montant', form.value.montant)
  .set('modePaiement', form.value.modePaiement)
  .set('idAgence', form.value.idAgence)
  .set('idClient', this.idClient);
   
    this.httpClient.post(Constants.urlBase+"/blessingpetroleum/api/consommerCarburant",null,{ params: params })
    .subscribe(
      data => {
        this.carburants=data;
        this.compte=null;
        this.consommations=null;
        //const id = this.route.snapshot.params['idClient'];
        this.onGetConsommation(this.idClient);
        this.onGetCompte(this.idClient);
        form.reset();
      },err=>{
        console.log(err);
      }
      
    );
    
  }

  onSubmitApprov(form:NgForm){

    const params = new HttpParams()
    .set('idClient', this.idClient)
    .set('montant', form.value.montant)
     
      this.httpClient.post(Constants.urlBase+"/blessingpetroleum/api/approvisionnerCompte",null,{ params: params })
      .subscribe(
        data => {
          this.compte=data;
          form.reset();
        },err=>{
          console.log(err);
        }
        
      );
      
    }

    onDeleteConsommation(idConso:number){
      this.httpClient.delete(Constants.urlBase+"/blessingpetroleum/api/consommations/"+idConso)
      .subscribe(
        data => {
          this.consommations=null;
          this.onGetConsommation(this.idClient);
        },err=>{
          console.log(err);
        }
        
      );
    }

    voirPlus(idConsommation:number){

      this.httpClient.get(Constants.urlBase+"/blessingpetroleum/api/consommations/"+idConsommation+"/carburant")
    .subscribe(
      data => {
        this.carburantConsommer=data;
        console.log(this.carburantConsommer.typeCarburant);
      },err=>{
        console.log(err);
      }
    );

    this.httpClient.get(Constants.urlBase+"/blessingpetroleum/api/consommations/"+idConsommation+"/agence")
    .subscribe(
      data => {
        this.agenceConsommation=data;
        console.log(this.agenceConsommation.nom);
      },err=>{
        console.log(err);
      }
    );

    }

}
