import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, NgForm } from '@angular/forms';
import { Constants } from '../contants';
import { DataTableFrenchTranlate } from '../dataTableFrenchLanguage';

@Component({
  selector: 'app-agences',
  templateUrl: './agences.component.html',
  styleUrls: ['./agences.component.css']
})
export class AgencesComponent implements OnInit {

  dtOptions: DataTables.Settings = {};
  public agences:any;
  formModifier!: FormGroup;

  constructor(private httpClient: HttpClient,private formBuilder:FormBuilder) { }

  ngOnInit(): void {
    this.formModifier= this.formBuilder.group({
      id:'',
      nom:'',
      ville: '',
      adresse: '',
      telephone: ''
    });
    this.dtOptions = {
      pagingType: 'full_numbers',
      pageLength: 7,
      language: DataTableFrenchTranlate.french_dataTable
    };
    this.onGetAgences();
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
    console.log(form.value.nom);

    const body = {
       nom: form.value.nom,
       ville: form.value.ville,
       adresse: form.value.adresse,
       telephone: form.value.telephone,
     };

    this.httpClient.post(Constants.urlBase+"/blessingpetroleum/api/agences",body)
    .subscribe(
      data => {
        this.agences=data;
        this.onGetAgences();
        form.reset();
      },err=>{
        console.log(err);
      }
      
    );
    
  }

  onDeleteAgence(idAgence:any){
    this.httpClient.delete(Constants.urlBase+"/blessingpetroleum/api/agences/"+idAgence)
    .subscribe(
      data => {
        this.agences=data;
        this.onGetAgences();
      },err=>{
        console.log(err);
      }
      
    );
  }

  modifierAgence(agence:any){
    this.formModifier.setValue({
      id: agence.id,
      nom: agence.nom,
      ville: agence.ville,
      adresse: agence.adresse,
      telephone: agence.telephone
    });
  }

  onModifier(){
    const body = {
      id: this.formModifier.value.id,
      nom: this.formModifier.value.nom,
      ville: this.formModifier.value.ville,
      adresse: this.formModifier.value.adresse,
      telephone: this.formModifier.value.telephone
    };

   this.httpClient.post(Constants.urlBase+"/blessingpetroleum/api/agences",body)
   .subscribe(
     data => {
      // this.clients=data;
       alert('Modifier avec success');
       let ref = document.getElementById('fermer');
       ref?.click();
       this.formModifier.reset();
       this.onGetAgences();
     },err=>{
       console.log(err);
     }
     
   );
  }


}
