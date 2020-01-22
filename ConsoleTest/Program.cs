using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using ConsoleTest.ServiceIntegrador;

namespace ConsoleTest
{
    class Program
    {
        static void Main(string[] args)
        {          
            try
            {              
                ServiceIntegradorClient ServicioCliente = new ServiceIntegradorClient();
                string result = string.Empty;

                result = ServicioCliente.mtdObtenerConceptoPago(1, "usuario", "demo", "demo");
                //result = ServicioCliente.mtdObtenerListaNiveles(1, "UsuarioConsulta", "demo", "demo");
                //result = ServicioCliente.mtdObtenerListaSubNiveles(1, "UsuarioConsulta", "demo", "demo");
                //result = ServicioCliente.mtdObtenerListaClientes(1, "T", "demo", "demo");
                //result = ServicioCliente.mtdObtenerDeuda(1, "COD", "MGT1234", "usuarioConsulta", "demo", "demo");
                //result = ServicioCliente.mtdRegistrarPago(1, DateTime.Now, "COD", "MGT1234", "1020809963", "EmpresaSRL", "105", "usuarioConsulta", "demo", "demo");
                //result = ServicioCliente.mtdRevertirPago(1, DateTime.Now, "102080909", "usuarioConsulta", "demo", "demo");
                //result = ServicioCliente.mtdExtornarFactura(1, DateTime.Now, "10208099963", 90910, "usuarioConsulta", "demo", "demo");
                //result = ServicioCliente.mtdConsultarTransaccion(1, DateTime.Now, "1008", "usuarioConsulta", "demo", "demo");
                //result = ServicioCliente.mtdObtenerDetallePagos(1, "COD", "MGT1234", DateTime.Now, DateTime.Now, "usuarioConsulta", "demo", "demo");
                //result = ServicioCliente.mtdObtenerDatosDeFactura(1, DateTime.Now, "1009", "usuarioConsulta", "demo", "demo");
                //result = ServicioCliente.mtdObtenerPlandePagos(1, "CON", "MGT1234", "usuarioConsulta", "demo", "demo");
                //result = ServicioCliente.mtdConciliarPagos(1, DateTime.Now, DateTime.Now, "usuarioPago", "usuarioConsulta", "demo", "demo");

                Console.WriteLine(result);
                Console.ReadLine();
            }
            catch (Exception ex) {
                Console.WriteLine(ex.Message);
                Console.ReadLine();
            }

        }
    }
}




