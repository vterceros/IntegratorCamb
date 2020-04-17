﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.42000
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ConsoleTest.ServicioIntegrador {
    
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ServiceModel.ServiceContractAttribute(ConfigurationName="ServicioIntegrador.IServiceIntegrador")]
    public interface IServiceIntegrador {
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IServiceIntegrador/VerificarConectividad", ReplyAction="http://tempuri.org/IServiceIntegrador/VerificarConectividadResponse")]
        string VerificarConectividad(string Usuario, string UsuarioConexion, string ContraseniaConexion);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IServiceIntegrador/VerificarConectividad", ReplyAction="http://tempuri.org/IServiceIntegrador/VerificarConectividadResponse")]
        System.Threading.Tasks.Task<string> VerificarConectividadAsync(string Usuario, string UsuarioConexion, string ContraseniaConexion);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IServiceIntegrador/ObtenerConceptoPago", ReplyAction="http://tempuri.org/IServiceIntegrador/ObtenerConceptoPagoResponse")]
        string ObtenerConceptoPago(int CodigoConvenio, string Gestion, string Usuario, string Sesion);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IServiceIntegrador/ObtenerConceptoPago", ReplyAction="http://tempuri.org/IServiceIntegrador/ObtenerConceptoPagoResponse")]
        System.Threading.Tasks.Task<string> ObtenerConceptoPagoAsync(int CodigoConvenio, string Gestion, string Usuario, string Sesion);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IServiceIntegrador/ObtenerListaNiveles", ReplyAction="http://tempuri.org/IServiceIntegrador/ObtenerListaNivelesResponse")]
        string ObtenerListaNiveles(int CodigoConvenio, string Gestion, string Usuario, string Sesion);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IServiceIntegrador/ObtenerListaNiveles", ReplyAction="http://tempuri.org/IServiceIntegrador/ObtenerListaNivelesResponse")]
        System.Threading.Tasks.Task<string> ObtenerListaNivelesAsync(int CodigoConvenio, string Gestion, string Usuario, string Sesion);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IServiceIntegrador/ObtenerListaSubNiveles", ReplyAction="http://tempuri.org/IServiceIntegrador/ObtenerListaSubNivelesResponse")]
        string ObtenerListaSubNiveles(int CodigoConvenio, string Gestion, string Usuario, string Sesion);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IServiceIntegrador/ObtenerListaSubNiveles", ReplyAction="http://tempuri.org/IServiceIntegrador/ObtenerListaSubNivelesResponse")]
        System.Threading.Tasks.Task<string> ObtenerListaSubNivelesAsync(int CodigoConvenio, string Gestion, string Usuario, string Sesion);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IServiceIntegrador/ObtenerListaClientes", ReplyAction="http://tempuri.org/IServiceIntegrador/ObtenerListaClientesResponse")]
        string ObtenerListaClientes(int CodigoConvenio, string Gestion, string TipoConsulta, string Usuario, string Sesion);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IServiceIntegrador/ObtenerListaClientes", ReplyAction="http://tempuri.org/IServiceIntegrador/ObtenerListaClientesResponse")]
        System.Threading.Tasks.Task<string> ObtenerListaClientesAsync(int CodigoConvenio, string Gestion, string TipoConsulta, string Usuario, string Sesion);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IServiceIntegrador/ObtenerServiciosRelacionados", ReplyAction="http://tempuri.org/IServiceIntegrador/ObtenerServiciosRelacionadosResponse")]
        string ObtenerServiciosRelacionados(int CodigoConvenio, string Gestion, string CodigoTipoBusqueda, string CodigoCliente, string Usuario, string Sesion);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IServiceIntegrador/ObtenerServiciosRelacionados", ReplyAction="http://tempuri.org/IServiceIntegrador/ObtenerServiciosRelacionadosResponse")]
        System.Threading.Tasks.Task<string> ObtenerServiciosRelacionadosAsync(int CodigoConvenio, string Gestion, string CodigoTipoBusqueda, string CodigoCliente, string Usuario, string Sesion);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IServiceIntegrador/ObtenerDeuda", ReplyAction="http://tempuri.org/IServiceIntegrador/ObtenerDeudaResponse")]
        string ObtenerDeuda(int CodigoConvenio, string Gestion, string CodigoTipoBusqueda, string CodigoCliente, string Usuario, string Sesion);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IServiceIntegrador/ObtenerDeuda", ReplyAction="http://tempuri.org/IServiceIntegrador/ObtenerDeudaResponse")]
        System.Threading.Tasks.Task<string> ObtenerDeudaAsync(int CodigoConvenio, string Gestion, string CodigoTipoBusqueda, string CodigoCliente, string Usuario, string Sesion);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IServiceIntegrador/RegistrarPago", ReplyAction="http://tempuri.org/IServiceIntegrador/RegistrarPagoResponse")]
        string RegistrarPago(int CodigoConvenio, string FechaTransaccion, string CodigoTipoBusqueda, string CodigoCliente, string FacturaNITCI, string FacturaNombre, string NroTransaccion, string Usuario, string Sesion, string DetallePago, string DatosFactura);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IServiceIntegrador/RegistrarPago", ReplyAction="http://tempuri.org/IServiceIntegrador/RegistrarPagoResponse")]
        System.Threading.Tasks.Task<string> RegistrarPagoAsync(int CodigoConvenio, string FechaTransaccion, string CodigoTipoBusqueda, string CodigoCliente, string FacturaNITCI, string FacturaNombre, string NroTransaccion, string Usuario, string Sesion, string DetallePago, string DatosFactura);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IServiceIntegrador/RevertirPago", ReplyAction="http://tempuri.org/IServiceIntegrador/RevertirPagoResponse")]
        string RevertirPago(int CodigoConvenio, string FechaTransaccion, string NroTransaccion, string Usuario, string Sesion);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IServiceIntegrador/RevertirPago", ReplyAction="http://tempuri.org/IServiceIntegrador/RevertirPagoResponse")]
        System.Threading.Tasks.Task<string> RevertirPagoAsync(int CodigoConvenio, string FechaTransaccion, string NroTransaccion, string Usuario, string Sesion);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IServiceIntegrador/ExtornarFactura", ReplyAction="http://tempuri.org/IServiceIntegrador/ExtornarFacturaResponse")]
        string ExtornarFactura(int CodigoConvenio, string FechaTransaccion, string NroTransaccion, int NumeroFactura, string Usuario, string Sesion);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IServiceIntegrador/ExtornarFactura", ReplyAction="http://tempuri.org/IServiceIntegrador/ExtornarFacturaResponse")]
        System.Threading.Tasks.Task<string> ExtornarFacturaAsync(int CodigoConvenio, string FechaTransaccion, string NroTransaccion, int NumeroFactura, string Usuario, string Sesion);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IServiceIntegrador/ConsultarTransaccion", ReplyAction="http://tempuri.org/IServiceIntegrador/ConsultarTransaccionResponse")]
        string ConsultarTransaccion(int CodigoConvenio, string FechaTransaccion, string NroTransaccion, string Usuario, string Sesion);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IServiceIntegrador/ConsultarTransaccion", ReplyAction="http://tempuri.org/IServiceIntegrador/ConsultarTransaccionResponse")]
        System.Threading.Tasks.Task<string> ConsultarTransaccionAsync(int CodigoConvenio, string FechaTransaccion, string NroTransaccion, string Usuario, string Sesion);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IServiceIntegrador/ObtenerDetallePagos", ReplyAction="http://tempuri.org/IServiceIntegrador/ObtenerDetallePagosResponse")]
        string ObtenerDetallePagos(int CodigoConvenio, string CodigoTipoBusqueda, string CodigoCliente, string FechaInicio, string FechaFin, string Usuario, string Sesion);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IServiceIntegrador/ObtenerDetallePagos", ReplyAction="http://tempuri.org/IServiceIntegrador/ObtenerDetallePagosResponse")]
        System.Threading.Tasks.Task<string> ObtenerDetallePagosAsync(int CodigoConvenio, string CodigoTipoBusqueda, string CodigoCliente, string FechaInicio, string FechaFin, string Usuario, string Sesion);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IServiceIntegrador/ObtenerDatosDeFactura", ReplyAction="http://tempuri.org/IServiceIntegrador/ObtenerDatosDeFacturaResponse")]
        string ObtenerDatosDeFactura(int CodigoConvenio, string FechaTransaccion, string NroTransaccion, string Usuario, string Sesion);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IServiceIntegrador/ObtenerDatosDeFactura", ReplyAction="http://tempuri.org/IServiceIntegrador/ObtenerDatosDeFacturaResponse")]
        System.Threading.Tasks.Task<string> ObtenerDatosDeFacturaAsync(int CodigoConvenio, string FechaTransaccion, string NroTransaccion, string Usuario, string Sesion);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IServiceIntegrador/ObtenerPlandePagos", ReplyAction="http://tempuri.org/IServiceIntegrador/ObtenerPlandePagosResponse")]
        string ObtenerPlandePagos(int CodigoConvenio, string Gestion, string CodigoTipoBusqueda, string CodigoCliente, string Usuario, string Sesion);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IServiceIntegrador/ObtenerPlandePagos", ReplyAction="http://tempuri.org/IServiceIntegrador/ObtenerPlandePagosResponse")]
        System.Threading.Tasks.Task<string> ObtenerPlandePagosAsync(int CodigoConvenio, string Gestion, string CodigoTipoBusqueda, string CodigoCliente, string Usuario, string Sesion);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IServiceIntegrador/ConciliarPagos", ReplyAction="http://tempuri.org/IServiceIntegrador/ConciliarPagosResponse")]
        string ConciliarPagos(int CodigoConvenio, string FechaInicio, string FechaFin, string UsuarioPago, string Usuario, string Sesion);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IServiceIntegrador/ConciliarPagos", ReplyAction="http://tempuri.org/IServiceIntegrador/ConciliarPagosResponse")]
        System.Threading.Tasks.Task<string> ConciliarPagosAsync(int CodigoConvenio, string FechaInicio, string FechaFin, string UsuarioPago, string Usuario, string Sesion);
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public interface IServiceIntegradorChannel : ConsoleTest.ServicioIntegrador.IServiceIntegrador, System.ServiceModel.IClientChannel {
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public partial class ServiceIntegradorClient : System.ServiceModel.ClientBase<ConsoleTest.ServicioIntegrador.IServiceIntegrador>, ConsoleTest.ServicioIntegrador.IServiceIntegrador {
        
        public ServiceIntegradorClient() {
        }
        
        public ServiceIntegradorClient(string endpointConfigurationName) : 
                base(endpointConfigurationName) {
        }
        
        public ServiceIntegradorClient(string endpointConfigurationName, string remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public ServiceIntegradorClient(string endpointConfigurationName, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public ServiceIntegradorClient(System.ServiceModel.Channels.Binding binding, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(binding, remoteAddress) {
        }
        
        public string VerificarConectividad(string Usuario, string UsuarioConexion, string ContraseniaConexion) {
            return base.Channel.VerificarConectividad(Usuario, UsuarioConexion, ContraseniaConexion);
        }
        
        public System.Threading.Tasks.Task<string> VerificarConectividadAsync(string Usuario, string UsuarioConexion, string ContraseniaConexion) {
            return base.Channel.VerificarConectividadAsync(Usuario, UsuarioConexion, ContraseniaConexion);
        }
        
        public string ObtenerConceptoPago(int CodigoConvenio, string Gestion, string Usuario, string Sesion) {
            return base.Channel.ObtenerConceptoPago(CodigoConvenio, Gestion, Usuario, Sesion);
        }
        
        public System.Threading.Tasks.Task<string> ObtenerConceptoPagoAsync(int CodigoConvenio, string Gestion, string Usuario, string Sesion) {
            return base.Channel.ObtenerConceptoPagoAsync(CodigoConvenio, Gestion, Usuario, Sesion);
        }
        
        public string ObtenerListaNiveles(int CodigoConvenio, string Gestion, string Usuario, string Sesion) {
            return base.Channel.ObtenerListaNiveles(CodigoConvenio, Gestion, Usuario, Sesion);
        }
        
        public System.Threading.Tasks.Task<string> ObtenerListaNivelesAsync(int CodigoConvenio, string Gestion, string Usuario, string Sesion) {
            return base.Channel.ObtenerListaNivelesAsync(CodigoConvenio, Gestion, Usuario, Sesion);
        }
        
        public string ObtenerListaSubNiveles(int CodigoConvenio, string Gestion, string Usuario, string Sesion) {
            return base.Channel.ObtenerListaSubNiveles(CodigoConvenio, Gestion, Usuario, Sesion);
        }
        
        public System.Threading.Tasks.Task<string> ObtenerListaSubNivelesAsync(int CodigoConvenio, string Gestion, string Usuario, string Sesion) {
            return base.Channel.ObtenerListaSubNivelesAsync(CodigoConvenio, Gestion, Usuario, Sesion);
        }
        
        public string ObtenerListaClientes(int CodigoConvenio, string Gestion, string TipoConsulta, string Usuario, string Sesion) {
            return base.Channel.ObtenerListaClientes(CodigoConvenio, Gestion, TipoConsulta, Usuario, Sesion);
        }
        
        public System.Threading.Tasks.Task<string> ObtenerListaClientesAsync(int CodigoConvenio, string Gestion, string TipoConsulta, string Usuario, string Sesion) {
            return base.Channel.ObtenerListaClientesAsync(CodigoConvenio, Gestion, TipoConsulta, Usuario, Sesion);
        }
        
        public string ObtenerServiciosRelacionados(int CodigoConvenio, string Gestion, string CodigoTipoBusqueda, string CodigoCliente, string Usuario, string Sesion) {
            return base.Channel.ObtenerServiciosRelacionados(CodigoConvenio, Gestion, CodigoTipoBusqueda, CodigoCliente, Usuario, Sesion);
        }
        
        public System.Threading.Tasks.Task<string> ObtenerServiciosRelacionadosAsync(int CodigoConvenio, string Gestion, string CodigoTipoBusqueda, string CodigoCliente, string Usuario, string Sesion) {
            return base.Channel.ObtenerServiciosRelacionadosAsync(CodigoConvenio, Gestion, CodigoTipoBusqueda, CodigoCliente, Usuario, Sesion);
        }
        
        public string ObtenerDeuda(int CodigoConvenio, string Gestion, string CodigoTipoBusqueda, string CodigoCliente, string Usuario, string Sesion) {
            return base.Channel.ObtenerDeuda(CodigoConvenio, Gestion, CodigoTipoBusqueda, CodigoCliente, Usuario, Sesion);
        }
        
        public System.Threading.Tasks.Task<string> ObtenerDeudaAsync(int CodigoConvenio, string Gestion, string CodigoTipoBusqueda, string CodigoCliente, string Usuario, string Sesion) {
            return base.Channel.ObtenerDeudaAsync(CodigoConvenio, Gestion, CodigoTipoBusqueda, CodigoCliente, Usuario, Sesion);
        }
        
        public string RegistrarPago(int CodigoConvenio, string FechaTransaccion, string CodigoTipoBusqueda, string CodigoCliente, string FacturaNITCI, string FacturaNombre, string NroTransaccion, string Usuario, string Sesion, string DetallePago, string DatosFactura) {
            return base.Channel.RegistrarPago(CodigoConvenio, FechaTransaccion, CodigoTipoBusqueda, CodigoCliente, FacturaNITCI, FacturaNombre, NroTransaccion, Usuario, Sesion, DetallePago, DatosFactura);
        }
        
        public System.Threading.Tasks.Task<string> RegistrarPagoAsync(int CodigoConvenio, string FechaTransaccion, string CodigoTipoBusqueda, string CodigoCliente, string FacturaNITCI, string FacturaNombre, string NroTransaccion, string Usuario, string Sesion, string DetallePago, string DatosFactura) {
            return base.Channel.RegistrarPagoAsync(CodigoConvenio, FechaTransaccion, CodigoTipoBusqueda, CodigoCliente, FacturaNITCI, FacturaNombre, NroTransaccion, Usuario, Sesion, DetallePago, DatosFactura);
        }
        
        public string RevertirPago(int CodigoConvenio, string FechaTransaccion, string NroTransaccion, string Usuario, string Sesion) {
            return base.Channel.RevertirPago(CodigoConvenio, FechaTransaccion, NroTransaccion, Usuario, Sesion);
        }
        
        public System.Threading.Tasks.Task<string> RevertirPagoAsync(int CodigoConvenio, string FechaTransaccion, string NroTransaccion, string Usuario, string Sesion) {
            return base.Channel.RevertirPagoAsync(CodigoConvenio, FechaTransaccion, NroTransaccion, Usuario, Sesion);
        }
        
        public string ExtornarFactura(int CodigoConvenio, string FechaTransaccion, string NroTransaccion, int NumeroFactura, string Usuario, string Sesion) {
            return base.Channel.ExtornarFactura(CodigoConvenio, FechaTransaccion, NroTransaccion, NumeroFactura, Usuario, Sesion);
        }
        
        public System.Threading.Tasks.Task<string> ExtornarFacturaAsync(int CodigoConvenio, string FechaTransaccion, string NroTransaccion, int NumeroFactura, string Usuario, string Sesion) {
            return base.Channel.ExtornarFacturaAsync(CodigoConvenio, FechaTransaccion, NroTransaccion, NumeroFactura, Usuario, Sesion);
        }
        
        public string ConsultarTransaccion(int CodigoConvenio, string FechaTransaccion, string NroTransaccion, string Usuario, string Sesion) {
            return base.Channel.ConsultarTransaccion(CodigoConvenio, FechaTransaccion, NroTransaccion, Usuario, Sesion);
        }
        
        public System.Threading.Tasks.Task<string> ConsultarTransaccionAsync(int CodigoConvenio, string FechaTransaccion, string NroTransaccion, string Usuario, string Sesion) {
            return base.Channel.ConsultarTransaccionAsync(CodigoConvenio, FechaTransaccion, NroTransaccion, Usuario, Sesion);
        }
        
        public string ObtenerDetallePagos(int CodigoConvenio, string CodigoTipoBusqueda, string CodigoCliente, string FechaInicio, string FechaFin, string Usuario, string Sesion) {
            return base.Channel.ObtenerDetallePagos(CodigoConvenio, CodigoTipoBusqueda, CodigoCliente, FechaInicio, FechaFin, Usuario, Sesion);
        }
        
        public System.Threading.Tasks.Task<string> ObtenerDetallePagosAsync(int CodigoConvenio, string CodigoTipoBusqueda, string CodigoCliente, string FechaInicio, string FechaFin, string Usuario, string Sesion) {
            return base.Channel.ObtenerDetallePagosAsync(CodigoConvenio, CodigoTipoBusqueda, CodigoCliente, FechaInicio, FechaFin, Usuario, Sesion);
        }
        
        public string ObtenerDatosDeFactura(int CodigoConvenio, string FechaTransaccion, string NroTransaccion, string Usuario, string Sesion) {
            return base.Channel.ObtenerDatosDeFactura(CodigoConvenio, FechaTransaccion, NroTransaccion, Usuario, Sesion);
        }
        
        public System.Threading.Tasks.Task<string> ObtenerDatosDeFacturaAsync(int CodigoConvenio, string FechaTransaccion, string NroTransaccion, string Usuario, string Sesion) {
            return base.Channel.ObtenerDatosDeFacturaAsync(CodigoConvenio, FechaTransaccion, NroTransaccion, Usuario, Sesion);
        }
        
        public string ObtenerPlandePagos(int CodigoConvenio, string Gestion, string CodigoTipoBusqueda, string CodigoCliente, string Usuario, string Sesion) {
            return base.Channel.ObtenerPlandePagos(CodigoConvenio, Gestion, CodigoTipoBusqueda, CodigoCliente, Usuario, Sesion);
        }
        
        public System.Threading.Tasks.Task<string> ObtenerPlandePagosAsync(int CodigoConvenio, string Gestion, string CodigoTipoBusqueda, string CodigoCliente, string Usuario, string Sesion) {
            return base.Channel.ObtenerPlandePagosAsync(CodigoConvenio, Gestion, CodigoTipoBusqueda, CodigoCliente, Usuario, Sesion);
        }
        
        public string ConciliarPagos(int CodigoConvenio, string FechaInicio, string FechaFin, string UsuarioPago, string Usuario, string Sesion) {
            return base.Channel.ConciliarPagos(CodigoConvenio, FechaInicio, FechaFin, UsuarioPago, Usuario, Sesion);
        }
        
        public System.Threading.Tasks.Task<string> ConciliarPagosAsync(int CodigoConvenio, string FechaInicio, string FechaFin, string UsuarioPago, string Usuario, string Sesion) {
            return base.Channel.ConciliarPagosAsync(CodigoConvenio, FechaInicio, FechaFin, UsuarioPago, Usuario, Sesion);
        }
    }
}