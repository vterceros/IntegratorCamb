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
        string mtdVerificarConectividad(string Usuarios, string usuariosContrasena, string contraseniaConexion);

        [OperationContract]
        string mtdObtenerConceptoPago(int codigoConvenio, string Gestion, string Usuario, string Sesion);

        [OperationContract]
        string mtdObtenerListaNiveles(int codigoConvenio, string Gestion, string usuario, string Sesion);

        [OperationContract]
        string mtdObtenerListaSubNiveles(int codigoConvenio, string Gestion, string usuario, string Sesion);

        [OperationContract]
        string mtdObtenerListaClientes(int codigoConvenio, string Gestion, string TipoConsulta, string usuario, string Sesion);

        [OperationContract]
        string mtdObtenerServiciosRelacionados(int codigoConvenio, string Gestion, string CodigoTipoBusqueda, string CodigoCliente, string usuario, string Sesion);

        [OperationContract]
        string mtdObtenerDeuda(int codigoConvenio, string Gestion, string CodigoTipoBusqueda, string CodigoCliente, string usuario, string Sesion);

        [OperationContract]
        string mtdRegistrarPago(int codigoConvenio, DateTime FechaTransaccion, string CodigoTipoBusqueda, string CodigoCliente, string FacturaNITCI, string FacturaNombre, string NroTransaccion, string usuario, string sesion);

        [OperationContract]
        string mtdRevertirPago(int codigoConvenio, DateTime FechaTransaccion, string NroTransaccion, string usuario, string sesion);

        [OperationContract]
        string mtdExtornarFactura(int codigoConvenio, DateTime FechaTransaccion, string NroTransaccion, int NumeroFactura, string usuario, string sesion);

        [OperationContract]
        string mtdConsultarTransaccion(int codigoConvenio, DateTime FechaTransaccion, string NroTransaccion, string usuario, string sesion);

        [OperationContract]
        string mtdObtenerDetallePagos(int codigoConvenio, string CodigoTipoBusqueda, string CodigoCliente, DateTime FechaInicio, DateTime FechaFin, string usuario, string sesion);

        [OperationContract]
        string mtdObtenerDatosDeFactura(int codigoConvenio, DateTime FechaTransaccion, string NroTransaccion, string usuario, string sesion);

        [OperationContract]
        string mtdObtenerPlandePagos(int codigoConvenio, string Gestion, string CodigoTipoBusqueda, string CodigoCliente, string usuario, string sesion);

        [OperationContract]
        string mtdConciliarPagos(int codigoConvenio, DateTime FechaInicio, DateTime FechaFin, string UsuarioPago, string usuario, string sesion);
    }
}
