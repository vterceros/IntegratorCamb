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
        string mtdObtenerConceptoPago(int codigoConvenio, string Usuarios, string usuariosContrasena, string contraseniaConexion);

        [OperationContract]
        string mtdObtenerListaNiveles(int codigoConvenio, string usuario, string usuarioConexion, string contraseniaConexion);

        [OperationContract]
        string mtdObtenerListaSubNiveles(int codigoConvenio, string usuario, string usuarioConexion, string contraseniaConexion);

        [OperationContract]
        string mtdObtenerListaClientes(int codigoConvenio, string TipoConsulta, string usuarioConexion, string contraseniaConexion);

        [OperationContract]
        string mtdObtenerServiciosRelacionados(int codigoConvenio, string CodigoTipoBusqueda, string CodigoCliente, string usuarioConexion, string contraseniaConexion);

        [OperationContract]
        string mtdObtenerDeuda(int codigoConvenio, string CodigoTipoBusqueda, string CodigoCliente, string usuario, string usuarioConexion, string contraseniaConexion);

        [OperationContract]
        string mtdRegistrarPago(int codigoConvenio, DateTime FechaTransaccion, string CodigoTipoBusqueda, string CodigoCliente, string FacturaNITCI, string FacturaNombre, string NroTransaccion, string usuario, string usuarioConexion, string contraseniaConexion);

        [OperationContract]
        string mtdRevertirPago(int codigoConvenio, DateTime FechaTransaccion, string NroTransaccion, string usuario, string usuarioConexion, string contraseniaConexion);

        [OperationContract]
        string mtdExtornarFactura(int codigoConvenio, DateTime FechaTransaccion, string NroTransaccion, int NumeroFactura, string usuario, string usuarioConexion, string contraseniaConexion);

        [OperationContract]
        string mtdConsultarTransaccion(int codigoConvenio, DateTime FechaTransaccion, string NroTransaccion, string usuario, string usuarioConexion, string contraseniaConexion);

        [OperationContract]
        string mtdObtenerDetallePagos(int codigoConvenio, string CodigoTipoBusqueda, string CodigoCliente, DateTime FechaInicio, DateTime FechaFin, string usuario, string usuarioConexion, string contraseniaConexion);

        [OperationContract]
        string mtdObtenerDatosDeFactura(int codigoConvenio, DateTime FechaTransaccion, string NroTransaccion, string usuario, string usuarioConexion, string contraseniaConexion);

        [OperationContract]
        string mtdObtenerPlandePagos(int codigoConvenio, string CodigoTipoBusqueda, string CodigoCliente, string usuario, string usuarioConexion, string contraseniaConexion);

        [OperationContract]
        string mtdConciliarPagos(int codigoConvenio, DateTime FechaInicio, DateTime FechaFin, string UsuarioPago, string usuarioConsulta, string usuarioConexion, string contraseniaConexion);
    }
}
