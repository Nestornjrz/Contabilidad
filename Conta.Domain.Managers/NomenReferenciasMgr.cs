using Conta.App.Contabilidad.Dto;
using Conta.Domain.Db;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;

namespace Conta.Domain.Contabilidad.Managers
{
    public class NomenReferenciasMgr
    {
        public static async Task<List<NomenReferenciaDto>> GetAllList()
        {
            using (var context = new CowContabilidadEntities())
            {
                var listado = await context.NomenReferencias.Select(s => new NomenReferenciaDto()
                {
                    Nro = s.Nro,
                    Descripcion = s.Descripcion,
                    TipoContabilidadID = s.TipoContabilidadID
                }).ToListAsync();
                return listado;
            }
        }
    }
}
