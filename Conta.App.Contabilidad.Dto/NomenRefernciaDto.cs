using System;

namespace Conta.App.Contabilidad.Dto
{
    public class NomenReferenciaDto
    {
        public int Nro { get; set; }
        public string Descripcion { get; set; }
        public Nullable<int> TipoContabilidadID { get; set; }
    }
}
