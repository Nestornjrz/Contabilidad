﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class CowContabilidadEntities : DbContext
    {
        public CowContabilidadEntities()
            : base("name=CowContabilidadEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Asiento> Asientos { get; set; }
        public virtual DbSet<AsientosManuale> AsientosManuales { get; set; }
        public virtual DbSet<Cuenta> Cuentas { get; set; }
        public virtual DbSet<Empresa> Empresas { get; set; }
        public virtual DbSet<NomenReferencia> NomenReferencias { get; set; }
        public virtual DbSet<TipoContabilidade> TipoContabilidades { get; set; }
    }
}
