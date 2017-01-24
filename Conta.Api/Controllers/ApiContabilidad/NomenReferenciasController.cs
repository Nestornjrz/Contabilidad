using Conta.App.Contabilidad.Dto;
using Conta.Domain.Contabilidad.Managers;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;

namespace Conta.Api.Controllers.ApiContabilidad
{
    [RoutePrefix("api/contabilidad")]
    public class NomenReferenciasController : ApiController
    {
        // GET: api/NomenReferencias
        /// <summary>
        /// Da el listado de las Referencias a las nomenclaturas
        /// </summary>
        /// <returns></returns>
        [Route("NomenReferencias")]
        [ResponseType(typeof(IEnumerable<NomenReferenciaDto>))]
        public async Task<IHttpActionResult> Get()
        {
            var listado = await NomenReferenciasMgr.GetAllList();
            if (listado == null)
            {
                return NotFound();
            }
            return Ok(listado);
        }

        //GET: api/NomenReferencias/5
        public string Get(int id)
        {
            return "value";
        }

        // POST: api/NomenReferencias
        public void Post([FromBody]string value)
        {
        }

        // PUT: api/NomenReferencias/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/NomenReferencias/5
        public void Delete(int id)
        {
        }
    }
}
