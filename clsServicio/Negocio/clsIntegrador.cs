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

        public static string mtdObtenerConceptoPago(int codigoConvenio, string usuario, string usuarioConexion, string contraseniaConexion) {           
            try
            {
                using (IntegradorModel context = new IntegradorModel())
                {
                    string sp = string.Format("EXEC SP_ObtenerConceptosPago {0},{1},{2},{3}", codigoConvenio, usuario, usuarioConexion, contraseniaConexion);
                    var queryResult = context.Database.SqlQuery<string>(sp).FirstOrDefault();
                    var result = queryResult;
                    return result;
                }
               
            }
            catch (Exception ex) {
                return ex.Message.ToString();
            }

        }


        public static string mtdObtenerListasNiveles(int codigoConvenio, string usuario, string usuarioConexion, string contraseniaConexion)
        {
            try
            {
                using (IntegradorModel context = new IntegradorModel())
                {
                    string sp = string.Format("EXEC SP_ObtenerListaNiveles {0},{1},{2},{3}", codigoConvenio, usuario, usuarioConexion, contraseniaConexion);
                    var queryResult = context.Database.SqlQuery<string>(sp).FirstOrDefault();
                    var result = queryResult;
                    return result;
                }

            }
            catch (Exception ex)
            {
                return ex.Message.ToString();
            }

        }


        public static string mtdObtenerListaSubNiveles(int codigoConvenio, string usuario, string usuarioConexion, string contraseniaConexion)
        {
            try
            {
                using (IntegradorModel context = new IntegradorModel())
                {
                    string sp = string.Format("EXEC SP_ObtenerListaSubNiveles {0},{1},{2},{3}", codigoConvenio, usuario, usuarioConexion, contraseniaConexion);
                    var queryResult = context.Database.SqlQuery<string>(sp).FirstOrDefault();
                    var result = queryResult;
                    return result;
                }

            }
            catch (Exception ex)
            {
                return ex.Message.ToString();
            }

        }

        public static string mtdObtenerListaClientes(int codigoConvenio, string TipoConsulta, string usuarioConexion, string contraseniaConexion)
        {
            try
            {
                using (IntegradorModel context = new IntegradorModel())
                {
                    string sp = string.Format("EXEC SP_ObtenerListaClientes {0},{1},{2},{3}", codigoConvenio, TipoConsulta, usuarioConexion, contraseniaConexion);
                    var queryResult = context.Database.SqlQuery<string>(sp).FirstOrDefault();
                    var result = queryResult;
                    return result;
                }

            }
            catch (Exception ex)
            {
                return ex.Message.ToString();
            }

        }


        public static string mtdObtenerServiciosRelacionados(int codigoConvenio, string CodigoTipoBusqueda, string CodigoCliente, string usuarioConexion, string contraseniaConexion)
        {
            try
            {
                using (IntegradorModel context = new IntegradorModel())
                {
                    string sp = string.Format("EXEC SP_ObtenerServiciosRelacionados {0},{1},{2},{3},{4}", codigoConvenio, CodigoTipoBusqueda, CodigoCliente, usuarioConexion, contraseniaConexion);
                    var queryResult = context.Database.SqlQuery<string>(sp).FirstOrDefault();
                    var result = queryResult;
                    return result;
                }
            }
            catch (Exception ex)
            {
                return ex.Message.ToString();
            }

        }


        public static string mtdObtenerDeuda(int codigoConvenio, string CodigoTipoBusqueda, string CodigoCliente, string usuario, string usuarioConexion, string contraseniaConexion)
        {
            try
            {
                using (IntegradorModel context = new IntegradorModel())
                {
                    string sp = string.Format("EXEC SP_ObtenerDeuda {0},{1},{2},{3},{4},{5}", codigoConvenio, CodigoTipoBusqueda, CodigoCliente,usuario, usuarioConexion, contraseniaConexion);
                    var queryResult = context.Database.SqlQuery<string>(sp).FirstOrDefault();
                    var result = queryResult;
                    return result;
                }
            }
            catch (Exception ex)
            {
                return ex.Message.ToString();
            }

        }

        //Consultar el parametro lista dettalle pago y otro parametro de tipo Item(datos de factura)
        public static string mtdRegistrarPago(int codigoConvenio, DateTime FechaTransaccion, string CodigoTipoBusqueda, 
                                              string CodigoCliente, string FacturaNITCI, string FacturaNombre, string NroTransaccion, 
                                              string usuario, string usuarioConexion, string contraseniaConexion)
        {
            try
            {
                using (IntegradorModel context = new IntegradorModel())
                {
                    string sp = string.Format("EXEC SP_RegistrarPago {0},{1},{2},{3},{4},{5},{6},{7},{8},{9}", codigoConvenio, FechaTransaccion, CodigoTipoBusqueda, CodigoCliente, FacturaNITCI,FacturaNombre, NroTransaccion, usuario, usuarioConexion, contraseniaConexion);
                    var queryResult = context.Database.SqlQuery<string>(sp).FirstOrDefault();
                    var result = queryResult;
                    return result;
                }
            }
            catch (Exception ex)
            {
                return ex.Message.ToString();
            }

        }


        public static string mtdRevertirPago(int codigoConvenio, DateTime FechaTransaccion, string NroTransaccion,                                           
                                            string usuario, string usuarioConexion, string contraseniaConexion)
        {
            try
            {
                using (IntegradorModel context = new IntegradorModel())
                {
                    string sp = string.Format("EXEC SP_RevertirPago {0},{1},{2},{3},{4},{5}", codigoConvenio, FechaTransaccion, NroTransaccion,NroTransaccion, usuario, usuarioConexion, contraseniaConexion);
                    var queryResult = context.Database.SqlQuery<string>(sp).FirstOrDefault();
                    var result = queryResult;
                    return result;
                }
            }
            catch (Exception ex)
            {
                return ex.Message.ToString();
            }

        }


        public static string mtdExtornarFactura(int codigoConvenio, DateTime FechaTransaccion, string NroTransaccion, int  NumeroFactura,
                                           string usuario, string usuarioConexion, string contraseniaConexion)
        {
            try
            {
                using (IntegradorModel context = new IntegradorModel())
                {
                    string sp = string.Format("EXEC SP_ExtornarFactura {0},{1},{2},{3},{4},{5},{6}", codigoConvenio, FechaTransaccion, NroTransaccion, NumeroFactura, usuario, usuarioConexion, contraseniaConexion);
                    var queryResult = context.Database.SqlQuery<string>(sp).FirstOrDefault();
                    var result = queryResult;
                    return result;
                }
            }
            catch (Exception ex)
            {
                return ex.Message.ToString();
            }

        }


        public static string mtdConsultarTransaccion(int codigoConvenio, DateTime FechaTransaccion, string NroTransaccion,
                                        string usuario, string usuarioConexion, string contraseniaConexion)
        {
            try
            {
                using (IntegradorModel context = new IntegradorModel())
                {
                    string sp = string.Format("EXEC SP_ExtornarFactura {0},{1},{2},{3},{4},{5}", codigoConvenio, FechaTransaccion, NroTransaccion, usuario, usuarioConexion, contraseniaConexion);
                    var queryResult = context.Database.SqlQuery<string>(sp).FirstOrDefault();
                    var result = queryResult;
                    return result;
                }
            }
            catch (Exception ex)
            {
                return ex.Message.ToString();
            }

        }

        public static string mtdObtenerDetallePagos(int codigoConvenio, string CodigoTipoBusqueda, string CodigoCliente, DateTime FechaInicio, DateTime FechaFin,
                                      string usuario, string usuarioConexion, string contraseniaConexion)
        {
            try
            {
                using (IntegradorModel context = new IntegradorModel())
                {
                    string sp = string.Format("EXEC SP_ExtornarFactura {0},{1},{2},{3},{4},{5},{6},{7}", codigoConvenio, CodigoTipoBusqueda, CodigoCliente, FechaInicio, FechaFin, contraseniaConexion);
                    var queryResult = context.Database.SqlQuery<string>(sp).FirstOrDefault();
                    var result = queryResult;
                    return result;
                }
            }
            catch (Exception ex)
            {
                return ex.Message.ToString();
            }
        }


        public static string mtdObtenerDatosDeFactura(int codigoConvenio, DateTime FechaTransaccion, string NroTransaccion,string usuario, string usuarioConexion, string contraseniaConexion)
        {
            try
            {
                using (IntegradorModel context = new IntegradorModel())
                {
                    string sp = string.Format("EXEC SP_ObtenerDatosFactura {0},{1},{2},{3},{4},{5}", codigoConvenio, FechaTransaccion, NroTransaccion, usuario, usuarioConexion, contraseniaConexion);
                    var queryResult = context.Database.SqlQuery<string>(sp).FirstOrDefault();
                    var result = queryResult;
                    return result;
                }
            }
            catch (Exception ex)
            {
                return ex.Message.ToString();
            }
        }

        public static string mtdObtenerPlandePagos(int codigoConvenio, string CodigoTipoBusqueda, string CodigoCliente, string usuario, string usuarioConexion, string contraseniaConexion)
        {
            try
            {
                using (IntegradorModel context = new IntegradorModel())
                {
                    string sp = string.Format("EXEC SP_ObtenerPlanPagos {0},{1},{2},{3},{4},{5}", codigoConvenio, CodigoTipoBusqueda, CodigoCliente, usuario, usuarioConexion, contraseniaConexion);
                    var queryResult = context.Database.SqlQuery<string>(sp).FirstOrDefault();
                    var result = queryResult;
                    return result;
                }
            }
            catch (Exception ex)
            {
                return ex.Message.ToString();
            }
        }


        public static string mtdConciliarPagos(int codigoConvenio, DateTime FechaInicio, DateTime FechaFin, string UsuarioPago, string usuarioConsulta, string usuarioConexion, string contraseniaConexion)
        {
            try
            {
                using (IntegradorModel context = new IntegradorModel())
                {
                    string sp = string.Format("EXEC SP_ConciliarPagos {0},{1},{2},{3},{4},{5},{6}", codigoConvenio, FechaInicio, FechaFin, UsuarioPago, usuarioConsulta, usuarioConexion, contraseniaConexion);
                    var queryResult = context.Database.SqlQuery<string>(sp).FirstOrDefault();
                    var result = queryResult;
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
