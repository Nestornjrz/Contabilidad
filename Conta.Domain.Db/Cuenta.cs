//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Conta.Domain.Db
{
    using System;
    using System.Collections.Generic;
    
    public partial class Cuenta
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Cuenta()
        {
            this.Asientos = new HashSet<Asiento>();
        }
    
        public int CuentaID { get; set; }
        public string Codigo { get; set; }
        public string Nombre { get; set; }
        public bool Imputable { get; set; }
        public int EmpresaID { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Asiento> Asientos { get; set; }
        public virtual Empresa Empresa { get; set; }
    }
}
