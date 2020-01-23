using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;
using clsServicio.Negocio;

namespace WcfService
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "Service1" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select Service1.svc or Service1.svc.cs at the Solution Explorer and start debugging.
    public class ServiceIntegrador : IServiceIntegrador
    {

        public string mtdVerificarConectividad(string usuario, string usuariosContrasena, string contraseniaConexion)
        {
            try
            {
                string result = clsIntegrador.mtdVerificarConectividad(usuario, usuariosContrasena, contraseniaConexion);
                return result;
            }
            catch (Exception ex)
            {
                return ex.Message.ToString();
            }
        }

        public string mtdObtenerConceptoPago(int codigoConvenio, string Gestion, string Usuario, string Sesion)
        {           
            try
            {
                string result = clsIntegrador.mtdObtenerConceptoPago(codigoConvenio, Gestion, Usuario,Sesion);
                return result;
            }
            catch(Exception ex) {
                return ex.Message.ToString();
            }
        }

        public string mtdObtenerListaNiveles(int codigoConvenio, string Gestion, string usuario, string Sesion)
        {
            try
            {
                string result = clsIntegrador.mtdObtenerListasNiveles(codigoConvenio, Gestion, usuario, Sesion);
                return result;
            }
            catch (Exception ex)
            {
                return ex.Message.ToString();
            }
        }


        public string mtdObtenerListaSubNiveles(int codigoConvenio, string Gestion, string usuario, string Sesion)
        {
            try
            {
                string result = clsIntegrador.mtdObtenerListaSubNiveles(codigoConvenio, Gestion, usuario, Sesion);
                return result;
            }
            catch (Exception ex)
            {
                return ex.Message.ToString();
            }
        }


        public string mtdObtenerListaClientes(int codigoConvenio, string Gestion, string TipoConsulta, string usuario, string Sesion)
        {
            try
            {
                string result = clsIntegrador.mtdObtenerListaClientes(codigoConvenio, Gestion, TipoConsulta, usuario, Sesion);
                return result;
            }
            catch (Exception ex)
            {
                return ex.Message.ToString();
            }
        }

        public string mtdObtenerServiciosRelacionados(int codigoConvenio, string Gestion, string CodigoTipoBusqueda, string CodigoCliente, string usuario, string Sesion)
        {
            try
            {
                string result = clsIntegrador.mtdObtenerServiciosRelacionados(codigoConvenio, Gestion, CodigoTipoBusqueda, CodigoCliente,  usuario, Sesion);
                return result;
            }
            catch (Exception ex)
            {
                return ex.Message.ToString();
            }
        }
        public string mtdObtenerDeuda(int codigoConvenio, string Gestion, string CodigoTipoBusqueda, string CodigoCliente, string usuario, string Sesion)
        {
            try
            {
                string result = clsIntegrador.mtdObtenerDeuda(codigoConvenio, Gestion, CodigoTipoBusqueda, CodigoCliente, usuario, Sesion);
                return result;
            }
            catch (Exception ex)
            {
                return ex.Message.ToString();
            }
        }


        public string mtdRegistrarPago(int codigoConvenio, DateTime FechaTransaccion, string CodigoTipoBusqueda,
                                              string CodigoCliente, string FacturaNITCI, string FacturaNombre, string NroTransaccion,
                                              string usuario, string sesion)
        {
            try
            {
                string result = clsIntegrador.mtdRegistrarPago(codigoConvenio, FechaTransaccion, CodigoTipoBusqueda, CodigoCliente, FacturaNITCI, FacturaNombre, NroTransaccion, usuario, sesion);
                return result;
            }
            catch (Exception ex)
            {
                return ex.Message.ToString();
            }
        }


        public string mtdRevertirPago(int codigoConvenio, DateTime FechaTransaccion, string NroTransaccion,string usuario, string sesion)
        {
            try
            {
                string result = clsIntegrador.mtdRevertirPago(codigoConvenio, FechaTransaccion, NroTransaccion, usuario, sesion);
                return result;
            }
            catch (Exception ex)
            {
                return ex.Message.ToString();
            }
        }


        public string mtdExtornarFactura(int codigoConvenio, DateTime FechaTransaccion, string NroTransaccion, int NumeroFactura,string usuario, string sesion)
        {
            try
            {
                string result = clsIntegrador.mtdExtornarFactura(codigoConvenio,FechaTransaccion,NroTransaccion,NumeroFactura,usuario,sesion);
                return result;
            }
            catch (Exception ex)
            {
                return ex.Message.ToString();
            }
        }


        public string mtdConsultarTransaccion(int codigoConvenio, DateTime FechaTransaccion, string NroTransaccion,string usuario, string sesion)
        {
            try
            {
                string result = clsIntegrador.mtdConsultarTransaccion(codigoConvenio, FechaTransaccion, NroTransaccion, usuario,sesion);
                return result;
            }
            catch (Exception ex)
            {
                return ex.Message.ToString();
            }
        }


        public string mtdObtenerDetallePagos(int codigoConvenio, string CodigoTipoBusqueda, string CodigoCliente, DateTime FechaInicio, DateTime FechaFin,string usuario, string sesion)
        {
            try
            {
                string result = clsIntegrador.mtdObtenerDetallePagos(codigoConvenio, CodigoTipoBusqueda, CodigoCliente, FechaInicio,FechaFin,usuario, sesion);
                return result;
            }
            catch (Exception ex)
            {
                return ex.Message.ToString();
            }
        }

        public string mtdObtenerDatosDeFactura(int codigoConvenio, DateTime FechaTransaccion, string NroTransaccion, string usuario, string sesion)
        {
            try
            {
                string result = clsIntegrador.mtdObtenerDatosDeFactura(codigoConvenio, FechaTransaccion, NroTransaccion, usuario, sesion);
                return result;
            }
            catch (Exception ex)
            {
                return ex.Message.ToString();
            }
        }


        public string mtdObtenerPlandePagos(int codigoConvenio, string Gestion, string CodigoTipoBusqueda, string CodigoCliente, string usuario, string sesion)
        {
            try
            {
                string result = clsIntegrador.mtdObtenerPlandePagos(codigoConvenio, Gestion, CodigoTipoBusqueda, CodigoCliente, usuario, sesion);
                return result;
            }
            catch (Exception ex)
            {
                return ex.Message.ToString();
            }
        }


        public string mtdConciliarPagos(int codigoConvenio, DateTime FechaInicio, DateTime FechaFin, string UsuarioPago, string usuario, string sesion)
        {
            try
            {
                string result = clsIntegrador.mtdConciliarPagos(codigoConvenio, FechaInicio, FechaFin, UsuarioPago, usuario,sesion);
                return result;
            }
            catch (Exception ex)
            {
                return ex.Message.ToString();
            }
        }
    }
}
