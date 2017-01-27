# API (Application Programming Interface)

Esta es la parte que se "expone" los servicios Web atraves de APIs REST. Aqui una [explicacion](http://asiermarques.com/2013/conceptos-sobre-apis-rest/).

* Utilizo  [WEB API 2 ](https://msdn.microsoft.com/es-es/library/dn448365(v=vs.118).aspx)
* Para analizar las APIs utilizo [swagger](http://swagger.io/) 

# CORS (Cross-Origin Requests)

Para poder realizar peticiones a la **WEB API** desde la **aplicacion Web** se tiene que habilitar CORS 
es decir permitir que el navegador pueda hacer peticiones XMLHttpRequest a diferentes dominios que el dominio 
actual desde donde "salio" la aplicacion ANGULAR

Para mas informacion ver
* [StackOverflow](http://stackoverflow.com/questions/27504256/mvc-web-api-no-access-control-allow-origin-header-is-present-on-the-requested)
* [Habilitar CORS en asp.net Web API 2](https://www.asp.net/web-api/overview/security/enabling-cross-origin-requests-in-web-api)

Una forma basica es poner la siguiente configuracion en el Web.config
``` xml
<system.webServer>
  <httpProtocol>
    <customHeaders>
      <add name="Access-Control-Allow-Origin" value="*" />
      <add name="Access-Control-Allow-Headers" value="Content-Type" />
      <add name="Access-Control-Allow-Methods" value="GET, POST, PUT, DELETE, OPTIONS" />
    </customHeaders>
  </httpProtocol>
</system.webServer>
```


