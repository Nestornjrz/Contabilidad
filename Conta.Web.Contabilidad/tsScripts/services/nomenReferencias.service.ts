import { Injectable } from '@angular/core';
import { Http, Response } from '@angular/http';
import { Observable } from 'rxjs/Observable';
import 'rxjs/add/operator/catch';
import 'rxjs/add/operator/do';
import 'rxjs/add/operator/map';

import { INomenReferenciaDto } from '../dtos/nomenReferenciaDto';

@Injectable()
export class NomenReferenciasService {
    constructor(private _http: Http) { }
    private _nomenReferenciasUrl = 'http://localhost:8001/api/contabilidad/NomenReferencias';

    getNomenReferencias(): Observable<INomenReferenciaDto[]> {
        return this._http.get(this._nomenReferenciasUrl)
            .map((response: Response) => <INomenReferenciaDto[]>response.json())
            .do(data => console.log('TODOS:' + JSON.stringify(data)))
            .catch(this.handleError);
    }

    private handleError(error: Response) {
        console.error(error);
        return Observable.throw(error.json().error || 'Server error');
    }
}