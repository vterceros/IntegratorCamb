namespace clsServicio.Modelo
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Usuario")]
    public partial class Usuario
    {
        public int UsuarioId { get; set; }

        [Column("Usuario")]
        [StringLength(30)]
        public string Usuario1 { get; set; }

        [StringLength(30)]
        public string Contrasenia { get; set; }

        [StringLength(30)]
        public string Client { get; set; }

        public bool? Activo { get; set; }

        public DateTime? FechaReg { get; set; }
    }
}
