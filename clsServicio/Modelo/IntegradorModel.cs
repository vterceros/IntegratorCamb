namespace clsServicio.Modelo
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class IntegradorModel : DbContext
    {
        public IntegradorModel()
            : base("name=IntegradorModel")
        {
        }

        public virtual DbSet<Usuario> Usuario { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Usuario>()
                .Property(e => e.Usuario1)
                .IsUnicode(false);

            modelBuilder.Entity<Usuario>()
                .Property(e => e.Contrasenia)
                .IsUnicode(false);

            modelBuilder.Entity<Usuario>()
                .Property(e => e.Client)
                .IsUnicode(false);
        }
    }
}
