///<reference path="./../typings/globals/core-js/index.d.ts"/>
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HttpModule } from '@angular/http';
import { RouterModule } from '@angular/router'; 
///Componente raiz
import { AppComponent } from './app.component';
////Componentes utilizados
import { WelcomeComponent } from './components/home/welcome.component';
////Servicios
import { NomenReferenciasService } from './services/nomenReferencias.service';

@NgModule({
    imports: [
        BrowserModule,
        HttpModule,
        RouterModule.forRoot([
            { path: 'welcome', component: WelcomeComponent },
            { path: '', redirectTo: 'welcome', pathMatch: 'full' },
            { path: '**', redirectTo: 'welcome', pathMatch: 'full' }
        ])
    ],
    declarations: [
         //Raiz
        AppComponent,
        //Propios
        WelcomeComponent
    ],
    providers: [NomenReferenciasService],
    bootstrap: [AppComponent]
})
export class AppModule { }