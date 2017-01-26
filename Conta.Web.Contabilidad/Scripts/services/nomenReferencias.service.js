"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
var core_1 = require('@angular/core');
var http_1 = require('@angular/http');
var Observable_1 = require('rxjs/Observable');
require('rxjs/add/operator/catch');
require('rxjs/add/operator/do');
require('rxjs/add/operator/map');
var NomenReferenciasService = (function () {
    function NomenReferenciasService(_http) {
        this._http = _http;
        this._nomenReferenciasUrl = 'http://localhost:8001/api/contabilidad/NomenReferencias';
    }
    NomenReferenciasService.prototype.getNomenReferencias = function () {
        return this._http.get(this._nomenReferenciasUrl)
            .map(function (response) { return response.json(); })
            .do(function (data) { return console.log('TODOS:' + JSON.stringify(data)); })
            .catch(this.handleError);
    };
    NomenReferenciasService.prototype.handleError = function (error) {
        console.error(error);
        return Observable_1.Observable.throw(error.json().error || 'Server error');
    };
    NomenReferenciasService = __decorate([
        core_1.Injectable(), 
        __metadata('design:paramtypes', [http_1.Http])
    ], NomenReferenciasService);
    return NomenReferenciasService;
}());
exports.NomenReferenciasService = NomenReferenciasService;
//# sourceMappingURL=nomenReferencias.service.js.map