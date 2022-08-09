import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { SigninComponent } from './auth/signin/signin.component';
import { ListeClientsComponent } from './liste-clients/liste-clients.component';
import { ClientComponent } from './liste-clients/client/client.component';
import { AuthService } from './services/auth.service';
import { ClientsService } from './services/clients.service';
import { AuthGuardService } from './services/auth-guard.service';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import { RouterModule, Routes } from '@angular/router';
import { HeaderComponent } from './header/header.component';
import { DataTablesModule } from "angular-datatables";
import { AgencesComponent } from './agences/agences.component';
import { AgenceService } from './services/agence.service';
import { CarburantComponent } from './carburant/carburant.component';

const appRoutes: Routes =[
  {path: 'auth/signin', component: SigninComponent},
  {path: 'listeClients', component: ListeClientsComponent},
  {path: 'detailsClient/:idClient', component: ClientComponent},
  {path: 'listeAgences', component: AgencesComponent},
  {path: 'listeCarburant', component: CarburantComponent},
  {path: '', redirectTo: 'listeClients', pathMatch: 'full'},
  {path: '**', redirectTo: 'listeClients'}
]

@NgModule({
  declarations: [
    AppComponent,
    SigninComponent,
    ListeClientsComponent,
    ClientComponent,
    HeaderComponent,
    AgencesComponent,
    CarburantComponent
  ],
  imports: [
    DataTablesModule,
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    ReactiveFormsModule,
    HttpClientModule,
    RouterModule.forRoot(appRoutes),
  ],
  providers: [
    AuthService,
    ClientsService,
    AuthGuardService,
    AgenceService
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
