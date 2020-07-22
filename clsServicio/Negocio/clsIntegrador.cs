using clsServicio.Modelo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace clsServicio.Negocio
{
    public class clsIntegrador
    {

        public static string mtdVerificarConectividad(string usuario, string usuarioConexion, string contraseniaConexion)
        {
            try
            {
                using (IntegradorModel context = new IntegradorModel())
                {
                    string sp = string.Format("EXEC SP_VerificarConectividad '{0}','{1}','{2}'", usuario, usuarioConexion, contraseniaConexion);
                    var queryResult = context.Database.SqlQuery<string>(sp).ToList();
                    string result = "";
                    foreach (var item in queryResult)
                    {
                        result += item;
                    }
                    
                    return result;
                }

            }
            catch (Exception ex)
            {
                return ex.Message.ToString();
            }

        }


        public static string mtdObtenerConceptoPago(string codigoConvenio, string Gestion, string usuario, string Sesion) {           
            try
            {
                using (IntegradorModel context = new IntegradorModel())
                {
                    string sp = string.Format("EXEC SP_ObtenerConceptosPago '{0}','{1}','{2}','{3}'", codigoConvenio, Gestion,usuario,Sesion);
                    var queryResult = context.Database.SqlQuery<string>(sp).ToList();
                    string result = "";
                    foreach (var item in queryResult)
                    {
                        result += item;
                    }
                    return result;
                }
               
            }
            catch (Exception ex) {
                return ex.Message.ToString();
            }

        }


        public static string mtdObtenerListasNiveles(string codigoConvenio, string Gestion, string usuario, string Sesion)
        {
            try
            {
                using (IntegradorModel context = new IntegradorModel())
                {
                    string sp = string.Format("EXEC SP_ObtenerListaNiveles '{0}','{1}','{2}','{3}'", codigoConvenio, Gestion, usuario, Sesion);
                    var queryResult = context.Database.SqlQuery<string>(sp).ToList();
                    string result = "";
                    foreach (var item in queryResult)
                    {
                        result += item;
                    }
                    return result;
                }

            }
            catch (Exception ex)
            {
                return ex.Message.ToString();
            }

        }


        public static string mtdObtenerListaSubNiveles(string codigoConvenio, string Gestion, string usuario, string Sesion)
        {
            try
            {
                using (IntegradorModel context = new IntegradorModel())
                {
                    string sp = string.Format("EXEC SP_ObtenerListaSubNiveles '{0}','{1}','{2}','{3}'", codigoConvenio, Gestion, usuario, Sesion);
                    var queryResult = context.Database.SqlQuery<string>(sp).ToList();
                    string result = "";
                    foreach (var item in queryResult)
                    {
                        result += item;
                    }
                    return result;
                }

            }
            catch (Exception ex)
            {
                return ex.Message.ToString();
            }

        }

        public static string mtdObtenerListaClientes(string codigoConvenio, string Gestion, string TipoConsulta, string usuario, string Sesion)
        {
            try
            {
                using (IntegradorModel context = new IntegradorModel())
                {
                    string sp = string.Format("EXEC SP_ObtenerListaClientes '{0}','{1}','{2}','{3}','{4}'", codigoConvenio, Gestion, TipoConsulta, usuario, Sesion);
                    var queryResult = context.Database.SqlQuery<string>(sp).ToList();
                    string result = "";
                    foreach (var item in queryResult)
                    {
                        result += item;
                    }
                    return result;
                }

            }
            catch (Exception ex)
            {
                return ex.Message.ToString();
            }

        }


        public static string mtdObtenerServiciosRelacionados(string codigoConvenio, string Gestion, string CodigoTipoBusqueda, string CodigoCliente, string usuario, string Sesion)
        {
            try
            {
                using (IntegradorModel context = new IntegradorModel())
                {
                    string sp = string.Format("EXEC SP_ObtenerServiciosRelacionados '{0}','{1}','{2}','{3}','{4}','{5}'", codigoConvenio, Gestion, CodigoTipoBusqueda, CodigoCliente, usuario, Sesion);
                    var queryResult = context.Database.SqlQuery<string>(sp).ToList();
                    string result = "";
                    foreach (var item in queryResult)
                    {
                        result += item;
                    }
                    return result;
                }
            }
            catch (Exception ex)
            {
                return ex.Message.ToString();
            }

        }


        public static string mtdObtenerDeuda(string codigoConvenio, string Gestion, string CodigoTipoBusqueda, string CodigoCliente, string usuario, string Sesion)
        {
            try
            {
                using (IntegradorModel context = new IntegradorModel())
                {
                    string sp = string.Format("EXEC SP_ObtenerDeuda '{0}','{1}','{2}','{3}','{4}','{5}'", codigoConvenio, Gestion, CodigoTipoBusqueda, CodigoCliente,usuario, Sesion);
                    var queryResult = context.Database.SqlQuery<string>(sp).ToList();
                    string result = "";
                    foreach (var item in queryResult)
                    {
                        result += item;
                    }
                    return result;
                }
            }
            catch (Exception ex)
            {
                return ex.Message.ToString();
            }

        }

        //Consultar el parametro lista dettalle pago y otro parametro de tipo Item(datos de factura)
        public static string mtdRegistrarPago(string codigoConvenio, DateTime FechaTransaccion, string CodigoTipoBusqueda, 
                                              string CodigoCliente, string FacturaNITCI, string FacturaNombre, string NroTransaccion, 
                                              string usuario, string sesion, string DetallePago, string DatosFactura)
        {
            try
            {
                using (IntegradorModel context = new IntegradorModel())
                {
                    string sp = string.Format("EXEC SP_RegistrarPago '{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}','{9}','{10}'", codigoConvenio, FechaTransaccion, CodigoTipoBusqueda, CodigoCliente
                        , FacturaNITCI,FacturaNombre, NroTransaccion, usuario, sesion, DetallePago, DatosFactura);
                    var queryResult = context.Database.SqlQuery<string>(sp).ToList();
                    string result = "";
                    foreach (var item in queryResult)
                    {
                        result += item;
                    }
                    return result;
                }
            }
            catch (Exception ex)
            {
                return ex.Message.ToString();
            }

        }


        public static string mtdRevertirPago(string codigoConvenio, DateTime FechaTransaccion, string NroTransaccion,string usuario, string sesion)
        {
            try
            {
                using (IntegradorModel context = new IntegradorModel())
                {
                    string sp = string.Format("EXEC SP_RevertirPago '{0}','{1}','{2}','{3}','{4}'", codigoConvenio, FechaTransaccion, NroTransaccion, usuario, sesion);
                    var queryResult = context.Database.SqlQuery<string>(sp).ToList();
                    string result = "";
                    foreach (var item in queryResult)
                    {
                        result += item;
                    }
                    return result;
                }
            }
            catch (Exception ex)
            {
                return ex.Message.ToString();
            }
        }


        public static string mtdExtornarFactura(string codigoConvenio, DateTime FechaTransaccion, string NroTransaccion, int  NumeroFactura,
                                           string usuario, string sesion)
        {
            try
            {
                using (IntegradorModel context = new IntegradorModel())
                {
                    string sp = string.Format("EXEC SP_ExtornarFactura '{0}','{1}','{2}',{3},'{4}','{5}'", codigoConvenio, FechaTransaccion, NroTransaccion, NumeroFactura, usuario, sesion);
                    var queryResult = context.Database.SqlQuery<string>(sp).ToList();
                    string result = "";
                    foreach (var item in queryResult)
                    {
                        result += item;
                    }
                    return result;
                }
            }
            catch (Exception ex)
            {
                return ex.Message.ToString();
            }

        }


        public static string mtdConsultarTransaccion(string codigoConvenio, DateTime FechaTransaccion, string NroTransaccion,string usuario, string sesion)
        {
            try
            {
                using (IntegradorModel context = new IntegradorModel())
                {
                    string sp = string.Format("EXEC SP_ConsultarTransaccion '{0}','{1}','{2}','{3}','{4}'", codigoConvenio, FechaTransaccion, NroTransaccion, usuario, sesion);
                    var queryResult = context.Database.SqlQuery<string>(sp).ToList();
                    string result = "";
                    foreach (var item in queryResult)
                    {
                        result += item;
                    }
                    return result;
                }
            }
            catch (Exception ex)
            {
                return ex.Message.ToString();
            }

        }

        public static string mtdObtenerDetallePagos(string codigoConvenio, string CodigoTipoBusqueda, string CodigoCliente, DateTime FechaInicio, DateTime FechaFin, string usuario, string sesion)
        {
            try
            {
                using (IntegradorModel context = new IntegradorModel())
                {
                    string sp = string.Format("EXEC SP_ObtenerDetallePagos '{0}','{1}','{2}','{3}','{4}','{5}','{6}'", codigoConvenio, CodigoTipoBusqueda, CodigoCliente, FechaInicio, FechaFin, usuario,sesion);
                    var queryResult = context.Database.SqlQuery<string>(sp).ToList();
                    string result = "";
                    foreach (var item in queryResult)
                    {
                        result += item;
                    }
                    return result;
                }
            }
            catch (Exception ex)
            {
                return ex.Message.ToString();
            }
        }


        public static string mtdObtenerDatosDeFactura(string codigoConvenio, DateTime FechaTransaccion, string NroTransaccion,string usuario, string sesion)
        {
            try
            {
                using (IntegradorModel context = new IntegradorModel())
                {
                    string sp = string.Format("EXEC SP_ObtenerDatosFactura '{0}','{1}','{2}','{3}','{4}'", codigoConvenio, FechaTransaccion, NroTransaccion, usuario, sesion);
                    var queryResult = context.Database.SqlQuery<string>(sp).ToList();
                    string result = "";
                    foreach (var item in queryResult)
                    {
                        result += item;
                    }
                    return result;
                }
            }
            catch (Exception ex)
            {
                return ex.Message.ToString();
            }
        }

        public static string mtdObtenerPlandePagos(string codigoConvenio, string Gestion, string CodigoTipoBusqueda, string CodigoCliente, string usuario, string sesion)
        {
            try
            {
                using (IntegradorModel context = new IntegradorModel())
                {
                    string sp = string.Format("EXEC SP_ObtenerPlanPagos '{0}','{1}','{2}','{3}','{4}','{5}'", codigoConvenio, Gestion, CodigoTipoBusqueda, CodigoCliente, usuario, sesion);
                    var queryResult = context.Database.SqlQuery<string>(sp).ToList();
                    string result = "";
                    foreach (var item in queryResult)
                    {
                        result += item;
                    }
                    return result;
                }
            }
            catch (Exception ex)
            {
                return ex.Message.ToString();
            }
        }


        public static string mtdConciliarPagos(string codigoConvenio, DateTime FechaInicio, DateTime FechaFin, string UsuarioPago, string usuario, string sesion)
        {
            try
            {
                using (IntegradorModel context = new IntegradorModel())
                {
                    string sp = string.Format("EXEC SP_ConciliarPagos '{0}','{1}','{2}','{3}','{4}','{5}'", codigoConvenio, FechaInicio, FechaFin, UsuarioPago, usuario, sesion);
                    var queryResult = context.Database.SqlQuery<string>(sp).ToList();
                    string result = "";
                    foreach (var item in queryResult)
                    {
                        result += item;
                    }
                    return result;
                }
            }
            catch (Exception ex)
            {
                return ex.Message.ToString();
            }
        }

    }
}
