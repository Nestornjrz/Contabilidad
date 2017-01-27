import { Component } from '@angular/core';
@Component({
    selector: 'my-app',
    template: `
    <div>
        <nav class='navbar navbar-default'>
            <div class='container-fluid'>
                <a class='navbar-brand'>{{pageTitle}}</a>
                <ul class='nav navbar-nav'>
                    <li><a [routerLink]="['/welcome']">Inicio</a></li>
                    <li><a [routerLink]="['/ganadera']">Ganadera</a></li>
                    <li><a [routerLink]="['/personal']">Personal</a></li>
                </ul>
            </div>
        </nav>
        <div class='container'>
            <router-outlet></router-outlet>
        </div>
     </div>
  `
})
export class AppComponent {
    pageTitle: string = `Modulo de contabilidad`;
}