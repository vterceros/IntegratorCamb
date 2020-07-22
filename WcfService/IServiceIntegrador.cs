using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace WcfService
{    
    [ServiceContract]
    public interface IServiceIntegrador
    {

        [OperationContract]
        string VerificarConectividad(string Usuario, string UsuarioConexion, string ContraseniaConexion);

        [OperationContract]
        string ObtenerConceptoPago(string CodigoConvenio, string Gestion, string Usuario, string Sesion);

        [OperationContract]
        string ObtenerListaNiveles(string CodigoConvenio, string Gestion, string Usuario, string Sesion);

        [OperationContract]
        string ObtenerListaSubNiveles(string CodigoConvenio, string Gestion, string Usuario, string Sesion);

        [OperationContract]
        string ObtenerListaClientes(string CodigoConvenio, string Gestion, string TipoConsulta, string Usuario, string Sesion);

        [OperationContract]
        string ObtenerServiciosRelacionados(string CodigoConvenio, string Gestion, string CodigoTipoBusqueda, string CodigoCliente, string Usuario, string Sesion);

        [OperationContract]
        string ObtenerDeuda(string CodigoConvenio, string Gestion, string CodigoTipoBusqueda, string CodigoCliente, string Usuario, string Sesion);

        [OperationContract]
        string RegistrarPago(string CodigoConvenio, string FechaTransaccion, string CodigoTipoBusqueda, string CodigoCliente, string FacturaNITCI, string FacturaNombre, string NroTransaccion, string Usuario, string Sesion, string DetallePago, string DatosFactura);

        [OperationContract]
        string RevertirPago(string CodigoConvenio, string FechaTransaccion, string NroTransaccion, string Usuario, string Sesion);

        [OperationContract]
        string ExtornarFactura(string CodigoConvenio, string FechaTransaccion, string NroTransaccion, int NumeroFactura, string Usuario, string Sesion);

        [OperationContract]
        string ConsultarTransaccion(string CodigoConvenio, string FechaTransaccion, string NroTransaccion, string Usuario, string Sesion);

        [OperationContract]
        string ObtenerDetallePagos(string CodigoConvenio, string CodigoTipoBusqueda, string CodigoCliente, string FechaInicio, string FechaFin, string Usuario, string Sesion);

        [OperationContract]
        string ObtenerDatosDeFactura(string CodigoConvenio, string FechaTransaccion, string NroTransaccion, string Usuario, string Sesion);

        [OperationContract]
        string ObtenerPlandePagos(string CodigoConvenio, string Gestion, string CodigoTipoBusqueda, string CodigoCliente, string Usuario, string Sesion);

        [OperationContract]
        string ConciliarPagos(string CodigoConvenio, string FechaInicio, string FechaFin, string UsuarioPago, string Usuario, string Sesion);
    }
}
