using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using ConsoleTest.ServicioIntegrador;

namespace ConsoleTest
{
    class Program
    {
        static void Main(string[] args)
        {
            try
            {

                string result = string.Empty;
                ServiceIntegradorClient ServicioCliente = new ServiceIntegradorClient();

                string token = "50QPHHENKNDXYK1UQRXY192ZE9YMPYKHB994G78P9RIYVVK75JBQK5HHNZMOOX";
                //Console.WriteLine("-----------------------------------------------------------------------------------------------------------------");
                //Console.WriteLine("Seleccionaste opcion 1 :  VerificarConectividad");
                //Console.WriteLine("-----------------------------------------------------------------------------------------------------------------");
                //result = ServicioCliente.VerificarConectividad("usuario", "demo", "KWDKRVJT9PEOAIWEF25TL02EMBT6M1XFFKMF1O1VCV0SFPNIOX764DTK2VH3TO");
                //Console.WriteLine(result);

                //Console.WriteLine("-----------------------------------------------------------------------------------------------------------------");
                //Console.WriteLine("Seleccionaste opcion 2 :  ObtenerConceptoPago");
                //Console.WriteLine("-----------------------------------------------------------------------------------------------------------------");
                //result = ServicioCliente.ObtenerConceptoPago(1, "2019", "demo", token);
                //Console.WriteLine(result);

                //Console.WriteLine("-----------------------------------------------------------------------------------------------------------------");
                //Console.WriteLine("Seleccionaste opcion 3 :  ObtenerListaNiveles");
                //Console.WriteLine("-----------------------------------------------------------------------------------------------------------------");
                //result = ServicioCliente.ObtenerListaNiveles(1, "2019", "demo", token);
                //Console.WriteLine(result);

                //Console.WriteLine("-----------------------------------------------------------------------------------------------------------------");
                //Console.WriteLine("Seleccionaste opcion 4 :  ObtenerListaSubNiveles");
                //Console.WriteLine("-----------------------------------------------------------------------------------------------------------------");
                //result = ServicioCliente.ObtenerListaSubNiveles(1, "2019", "demo", token);
                //Console.WriteLine(result);

                //Console.WriteLine("-----------------------------------------------------------------------------------------------------------------");
                //Console.WriteLine("Seleccionaste opcion 5 :  ObtenerListaClientes");
                //Console.WriteLine("-----------------------------------------------------------------------------------------------------------------");
                //result = ServicioCliente.ObtenerListaClientes(1, "2019", "T", "demo", token);
                //Console.WriteLine(result);

                //Console.WriteLine("-----------------------------------------------------------------------------------------------------------------");
                //Console.WriteLine("Seleccionaste opcion 6 :  ObtenerDeuda");
                //Console.WriteLine("-----------------------------------------------------------------------------------------------------------------");
                //result = ServicioCliente.ObtenerDeuda(1, "2019", "COD", "MGT1234", "demo", token);
                //Console.WriteLine(result);

                Console.WriteLine("-----------------------------------------------------------------------------------------------------------------");
                Console.WriteLine("Seleccionaste opcion 7 :  RegistrarPago");
                Console.WriteLine("-----------------------------------------------------------------------------------------------------------------");
                result = ServicioCliente.RegistrarPago(1, "18112020", "COD", "MGT1234", "1020809963", "EmpresaSRL", "105", "demo", token,"DETALLE","FACTURA");
                Console.WriteLine(result);

                Console.WriteLine("-----------------------------------------------------------------------------------------------------------------");
                Console.WriteLine("Seleccionaste opcion 8 :  RevertirPago");
                Console.WriteLine("-----------------------------------------------------------------------------------------------------------------");
                result = ServicioCliente.RevertirPago(1, "01022020", "102080909", "demo", token);
                Console.WriteLine(result);

                Console.WriteLine("-----------------------------------------------------------------------------------------------------------------");
                Console.WriteLine("Seleccionaste opcion 9 :  ExtornarFactura");
                Console.WriteLine("-----------------------------------------------------------------------------------------------------------------");
                result = ServicioCliente.ExtornarFactura(1, "01022020", "10208099963", 90910, "demo", token);
                Console.WriteLine(result);

                Console.WriteLine("-----------------------------------------------------------------------------------------------------------------");
                Console.WriteLine("Seleccionaste opcion 10 :  ConsultarTransaccion");
                Console.WriteLine("-----------------------------------------------------------------------------------------------------------------");
                result = ServicioCliente.ConsultarTransaccion(1, "01022020", "1008", "demo", token);
                Console.WriteLine(result);

                Console.WriteLine("-----------------------------------------------------------------------------------------------------------------");
                Console.WriteLine("Seleccionaste opcion 11 :  ObtenerDetallePagos");
                Console.WriteLine("-----------------------------------------------------------------------------------------------------------------");
                result = ServicioCliente.ObtenerDetallePagos(1, "COD", "MGT1234", "01022020", "01022020", "demo", token);
                Console.WriteLine(result);

                Console.WriteLine("-----------------------------------------------------------------------------------------------------------------");
                Console.WriteLine("Seleccionaste opcion 12 :  ObtenerDatosDeFactura");
                Console.WriteLine("-----------------------------------------------------------------------------------------------------------------");
                result = ServicioCliente.ObtenerDatosDeFactura(1, "01022020", "1009", "demo", token);
                Console.WriteLine(result);

                Console.WriteLine("-----------------------------------------------------------------------------------------------------------------");
                Console.WriteLine("Seleccionaste opcion 13 :  ObtenerPlandePagos");
                Console.WriteLine("-----------------------------------------------------------------------------------------------------------------");
                result = ServicioCliente.ObtenerPlandePagos(1, "2019", "CON", "MGT1234", "demo", token);
                Console.WriteLine(result);

                Console.WriteLine("-----------------------------------------------------------------------------------------------------------------");
                Console.WriteLine("Seleccionaste opcion 14 :  ConciliarPagos");
                Console.WriteLine("-----------------------------------------------------------------------------------------------------------------");
                result = ServicioCliente.ConciliarPagos(1, "19022020", "30022020", "usuarioPago", "demo", token);
                Console.WriteLine(result);

                Console.WriteLine("-----------------------------------------------------------------------------------------------------------------");
                Console.WriteLine("Seleccionaste opcion 15 :  Servicios Relacionados");
                Console.WriteLine("-----------------------------------------------------------------------------------------------------------------");
                result = ServicioCliente.ObtenerServiciosRelacionados(1, "2020", "T", "usuarioPago", "demo", token);
                Console.WriteLine(result);

                Console.ReadLine();


            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                Console.ReadLine();
            }

        }
    }
}




