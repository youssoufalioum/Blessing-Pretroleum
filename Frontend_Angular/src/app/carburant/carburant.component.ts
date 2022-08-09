import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, NgForm } from '@angular/forms';
import { DataTableFrenchTranlate } from '../dataTableFrenchLanguage';

@Component({
  selector: 'app-carburant',
  templateUrl: './carburant.component.html',
  styleUrls: ['./carburant.component.css']
})
export class CarburantComponent implements OnInit {

  dtOptions: DataTables.Settings = {};
  public carburants:any;
  formModifier!: FormGroup;

  constructor(private httpClient:HttpClient,private formBuilder:FormBuilder) { }

  ngOnInit(): void {
    this.formModifier= this.formBuilder.group({
      id:'',
      typeCarburant:'',
      prixUnitaire: ''
    });
    this.dtOptions = {
      pagingType: 'full_numbers',
      pageLength: 7,
      language: DataTableFrenchTranlate.french_dataTable
    };
    this.onGetCarburants();
  }

  onGetCarburants(){
    this.httpClient.get("http://localhost:8080/blessingpetroleum/api/carburants")
    .subscribe(
      data => {
        this.carburants=data;
      },err=>{
        console.log(err);
      }
      
    );
  }

  onSubmit(form:NgForm){
    const body = {
       typeCarburant: form.value.typeCarburant,
       prixUnitaire: form.value.prixUnitaire
     };

    this.httpClient.post("http://localhost:8080/blessingpetroleum/api/carburants",body)
    .subscribe(
      data => {
        this.carburants=data;
        this.carburants=null;
        this.onGetCarburants();
        form.reset();
      },err=>{
        console.log(err);
      }
      
    );
    
  }

  onDeleteCarburant(idCarburant:any){
    this.httpClient.delete("http://localhost:8080/blessingpetroleum/api/carburants/"+idCarburant)
    .subscribe(
      data => {
        this.carburants=data;
        this.onGetCarburants();
      },err=>{
        console.log(err);
      }
      
    );
  }

  modifierCarburant(carburant:any){
    this.formModifier.setValue({
      id: carburant.id,
      typeCarburant: carburant.typeCarburant,
      prixUnitaire: carburant.prixUnitaire
    });
  }

  onModifier(){
    const body = {
      id: this.formModifier.value.id,
      typeCarburant: this.formModifier.value.typeCarburant,
      prixUnitaire: this.formModifier.value.prixUnitaire
    };

   this.httpClient.post("http://localhost:8080/blessingpetroleum/api/carburants",body)
   .subscribe(
     data => {
      // this.clients=data;
       alert('Modifier avec success');
       let ref = document.getElementById('fermer');
       ref?.click();
       this.formModifier.reset();
       this.onGetCarburants();
     },err=>{
       console.log(err);
     }
     
   );
  }


}
