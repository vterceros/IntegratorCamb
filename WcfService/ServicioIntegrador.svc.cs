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

        public string VerificarConectividad(string Usuario, string UsuarioConexion, string ContraseniaConexion)
        {
            try
            {
                string result = clsIntegrador.mtdVerificarConectividad(Usuario, UsuarioConexion, ContraseniaConexion);
                return result;
            }
            catch (Exception ex)
            {
                return ex.Message.ToString();
            }
        }

        public string ObtenerConceptoPago(int CodigoConvenio, string Gestion, string Usuario, string Sesion)
        {           
            try
            {
                string result = clsIntegrador.mtdObtenerConceptoPago(CodigoConvenio, Gestion, Usuario,Sesion);
                return result;
            }
            catch(Exception ex) {
                return ex.Message.ToString();
            }
        }

        public string ObtenerListaNiveles(int CodigoConvenio, string Gestion, string Usuario, string Sesion)
        {
            try
            {
                string result = clsIntegrador.mtdObtenerListasNiveles(CodigoConvenio, Gestion, Usuario, Sesion);
                return result;
            }
            catch (Exception ex)
            {
                return ex.Message.ToString();
            }
        }


        public string ObtenerListaSubNiveles(int CodigoConvenio, string Gestion, string Usuario, string Sesion)
        {
            try
            {
                string result = clsIntegrador.mtdObtenerListaSubNiveles(CodigoConvenio, Gestion, Usuario, Sesion);
                return result;
            }
            catch (Exception ex)
            {
                return ex.Message.ToString();
            }
        }


        public string ObtenerListaClientes(int CodigoConvenio, string Gestion, string TipoConsulta, string Usuario, string Sesion)
        {
            try
            {
                string result = clsIntegrador.mtdObtenerListaClientes(CodigoConvenio, Gestion, TipoConsulta, Usuario, Sesion);
                return result;
            }
            catch (Exception ex)
            {
                return ex.Message.ToString();
            }
        }

        public string ObtenerServiciosRelacionados(int CodigoConvenio, string Gestion, string CodigoTipoBusqueda, string CodigoCliente, string Usuario, string Sesion)
        {
            try
            {
                string result = clsIntegrador.mtdObtenerServiciosRelacionados(CodigoConvenio, Gestion, CodigoTipoBusqueda, CodigoCliente,  Usuario, Sesion);
                return result;
            }
            catch (Exception ex)
            {
                return ex.Message.ToString();
            }
        }
        public string ObtenerDeuda(int CodigoConvenio, string Gestion, string CodigoTipoBusqueda, string CodigoCliente, string Usuario, string Sesion)
        {
            try
            {
                string result = clsIntegrador.mtdObtenerDeuda(CodigoConvenio, Gestion, CodigoTipoBusqueda, CodigoCliente, Usuario, Sesion);
                return result;
            }
            catch (Exception ex)
            {
                return ex.Message.ToString();
            }
        }


        public string RegistrarPago(int CodigoConvenio, DateTime FechaTransaccion, string CodigoTipoBusqueda, string CodigoCliente, string FacturaNITCI, string FacturaNombre, string NroTransaccion, string Usuario, string Sesion, string DetallePago, string DatosFactura)
        {
            try
            {
                string result = clsIntegrador.mtdRegistrarPago(CodigoConvenio, FechaTransaccion, CodigoTipoBusqueda, CodigoCliente, FacturaNITCI, FacturaNombre, NroTransaccion, Usuario, Sesion);
                return result;
            }
            catch (Exception ex)
            {
                return ex.Message.ToString();
            }
        }


        public string RevertirPago(int CodigoConvenio, DateTime FechaTransaccion, string NroTransaccion,string Usuario, string Sesion)
        {
            try
            {
                string result = clsIntegrador.mtdRevertirPago(CodigoConvenio, FechaTransaccion, NroTransaccion, Usuario, Sesion);
                return result;
            }
            catch (Exception ex)
            {
                return ex.Message.ToString();
            }
        }


        public string ExtornarFactura(int CodigoConvenio, DateTime FechaTransaccion, string NroTransaccion, int NumeroFactura,string Usuario, string Sesion)
        {
            try
            {
                string result = clsIntegrador.mtdExtornarFactura(CodigoConvenio,FechaTransaccion,NroTransaccion,NumeroFactura,Usuario,Sesion);
                return result;
            }
            catch (Exception ex)
            {
                return ex.Message.ToString();
            }
        }


        public string ConsultarTransaccion(int CodigoConvenio, DateTime FechaTransaccion, string NroTransaccion,string Usuario, string Sesion)
        {
            try
            {
                string result = clsIntegrador.mtdConsultarTransaccion(CodigoConvenio, FechaTransaccion, NroTransaccion, Usuario,Sesion);
                return result;
            }
            catch (Exception ex)
            {
                return ex.Message.ToString();
            }
        }


        public string ObtenerDetallePagos(int CodigoConvenio, string CodigoTipoBusqueda, string CodigoCliente, DateTime FechaInicio, DateTime FechaFin,string Usuario, string Sesion)
        {
            try
            {
                string result = clsIntegrador.mtdObtenerDetallePagos(CodigoConvenio, CodigoTipoBusqueda, CodigoCliente, FechaInicio,FechaFin,Usuario, Sesion);
                return result;
            }
            catch (Exception ex)
            {
                return ex.Message.ToString();
            }
        }

        public string ObtenerDatosDeFactura(int CodigoConvenio, DateTime FechaTransaccion, string NroTransaccion, string Usuario, string Sesion)
        {
            try
            {
                string result = clsIntegrador.mtdObtenerDatosDeFactura(CodigoConvenio, FechaTransaccion, NroTransaccion, Usuario, Sesion);
                return result;
            }
            catch (Exception ex)
            {
                return ex.Message.ToString();
            }
        }


        public string ObtenerPlandePagos(int CodigoConvenio, string Gestion, string CodigoTipoBusqueda, string CodigoCliente, string Usuario, string Sesion)
        {
            try
            {
                string result = clsIntegrador.mtdObtenerPlandePagos(CodigoConvenio, Gestion, CodigoTipoBusqueda, CodigoCliente, Usuario, Sesion);
                return result;
            }
            catch (Exception ex)
            {
                return ex.Message.ToString();
            }
        }


        public string ConciliarPagos(int CodigoConvenio, DateTime FechaInicio, DateTime FechaFin, string UsuarioPago, string Usuario, string Sesion)
        {
            try
            {
                string result = clsIntegrador.mtdConciliarPagos(CodigoConvenio, FechaInicio, FechaFin, UsuarioPago, Usuario,Sesion);
                return result;
            }
            catch (Exception ex)
            {
                return ex.Message.ToString();
            }
        }
    }
}
