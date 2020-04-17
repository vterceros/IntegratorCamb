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
        string ObtenerConceptoPago(int CodigoConvenio, string Gestion, string Usuario, string Sesion);

        [OperationContract]
        string ObtenerListaNiveles(int CodigoConvenio, string Gestion, string Usuario, string Sesion);

        [OperationContract]
        string ObtenerListaSubNiveles(int CodigoConvenio, string Gestion, string Usuario, string Sesion);

        [OperationContract]
        string ObtenerListaClientes(int CodigoConvenio, string Gestion, string TipoConsulta, string Usuario, string Sesion);

        [OperationContract]
        string ObtenerServiciosRelacionados(int CodigoConvenio, string Gestion, string CodigoTipoBusqueda, string CodigoCliente, string Usuario, string Sesion);

        [OperationContract]
        string ObtenerDeuda(int CodigoConvenio, string Gestion, string CodigoTipoBusqueda, string CodigoCliente, string Usuario, string Sesion);

        [OperationContract]
        string RegistrarPago(int CodigoConvenio, string FechaTransaccion, string CodigoTipoBusqueda, string CodigoCliente, string FacturaNITCI, string FacturaNombre, string NroTransaccion, string Usuario, string Sesion, string DetallePago, string DatosFactura);

        [OperationContract]
        string RevertirPago(int CodigoConvenio, string FechaTransaccion, string NroTransaccion, string Usuario, string Sesion);

        [OperationContract]
        string ExtornarFactura(int CodigoConvenio, string FechaTransaccion, string NroTransaccion, int NumeroFactura, string Usuario, string Sesion);

        [OperationContract]
        string ConsultarTransaccion(int CodigoConvenio, string FechaTransaccion, string NroTransaccion, string Usuario, string Sesion);

        [OperationContract]
        string ObtenerDetallePagos(int CodigoConvenio, string CodigoTipoBusqueda, string CodigoCliente, string FechaInicio, string FechaFin, string Usuario, string Sesion);

        [OperationContract]
        string ObtenerDatosDeFactura(int CodigoConvenio, string FechaTransaccion, string NroTransaccion, string Usuario, string Sesion);

        [OperationContract]
        string ObtenerPlandePagos(int CodigoConvenio, string Gestion, string CodigoTipoBusqueda, string CodigoCliente, string Usuario, string Sesion);

        [OperationContract]
        string ConciliarPagos(int CodigoConvenio, string FechaInicio, string FechaFin, string UsuarioPago, string Usuario, string Sesion);
    }
}
