import { Component, OnInit } from '@angular/core';

//Servicios
import { NomenReferenciasService } from '../../services/nomenReferencias.service';

//Dto
import { INomenReferenciaDto } from '../../dtos/nomenReferenciaDto';

@Component({
    templateUrl: 'tsScripts/components/home/welcome.component.html'
})
export class WelcomeComponent implements OnInit{
    public pageTitle: string = 'Bienvenido';
    errorMessage: string;

    nomenReferencias: INomenReferenciaDto[];

    constructor(private _nomenReferenciasService: NomenReferenciasService) {
    }

    ngOnInit(): void {
        this._nomenReferenciasService.getNomenReferencias()
            .subscribe(nomenReferencias => this.nomenReferencias = nomenReferencias,
            error => this.errorMessage = <any>error);
    }
}