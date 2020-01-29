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

                string result = string.Empty;
                ServiceIntegradorClient ServicioCliente = new ServiceIntegradorClient();


                Console.WriteLine("Opcion 1 : mtdVerificarConectividad");
                Console.WriteLine("Opcion 2 : mtdObtenerConceptoPago");
                Console.WriteLine("Opcion 3 : mtdObtenerListaNiveles");
                Console.WriteLine("Opcion 4 : mtdObtenerListaSubNiveles");
                Console.WriteLine("Opcion 5 : mtdObtenerListaClientes");
                Console.WriteLine("Opcion 6 : mtdObtenerDeuda");
                Console.WriteLine("Opcion 7 : mtdRegistrarPago");
                Console.WriteLine("Opcion 8 : mtdRevertirPago");
                Console.WriteLine("Opcion 9 : mtdExtornarFactura");
                Console.WriteLine("Opcion 10 : mtdConsultarTransaccion");
                Console.WriteLine("Opcion 11 : mtdObtenerDetallePagos");
                Console.WriteLine("Opcion 12 : mtdObtenerDatosDeFactura");
                Console.WriteLine("Opcion 13 : mtdObtenerPlandePagos");
                Console.WriteLine("Opcion 14 : mtdConciliarPagos");

                Console.WriteLine("-------------------------------------");
                Console.WriteLine("Ingrese el Nro. de opcion : ");


                int opcion = Convert.ToInt16(Console.ReadLine());
              
                switch (opcion)
                {
                    case 1:
                        Console.WriteLine("Seleccionaste opcion 1 :  mtdVerificarConectividad");
                        Console.WriteLine("----------------------------------");
                        result = ServicioCliente.mtdVerificarConectividad("usuario", "demo", "KWDKRVJT9PEOAIWEF25TL02EMBT6M1XFFKMF1O1VCV0SFPNIOX764DTK2VH3TO");
                        Console.WriteLine(result);
                        Console.ReadLine();
                        break;
                    case 2:
                        Console.WriteLine("Seleccionaste opcion 2 :  mtdObtenerConceptoPago");
                        Console.WriteLine("----------------------------------");
                        result = ServicioCliente.mtdObtenerConceptoPago(1, "2019", "demo", "GQHDM8GNOJRT6QN9BK1OTGC9EJ3JLOUR93XKGWBWVAIZ95AU4XFSFPRIX36BKZ");
                        Console.WriteLine(result);
                        Console.ReadLine();
                        break;
                    case 3:
                        Console.WriteLine("Seleccionaste opcion 3 :  mtdObtenerListaNiveles");
                        Console.WriteLine("----------------------------------");
                        result = ServicioCliente.mtdObtenerListaNiveles(1, "2019", "demo", "GQHDM8GNOJRT6QN9BK1OTGC9EJ3JLOUR93XKGWBWVAIZ95AU4XFSFPRIX36BKZ");
                        Console.WriteLine(result);
                        Console.ReadLine();
                        break;
                    case 4:
                        Console.WriteLine("Seleccionaste opcion 4 :  mtdObtenerListaSubNiveles");
                        Console.WriteLine("----------------------------------");
                        result = ServicioCliente.mtdObtenerListaSubNiveles(1, "2019", "demo", "GQHDM8GNOJRT6QN9BK1OTGC9EJ3JLOUR93XKGWBWVAIZ95AU4XFSFPRIX36BKZ");
                        Console.WriteLine(result);
                        Console.ReadLine();
                        break;
                    case 5:
                        Console.WriteLine("Seleccionaste opcion 5 :  mtdObtenerListaClientes");
                        Console.WriteLine("----------------------------------");
                        result = ServicioCliente.mtdObtenerListaClientes(1, "2019", "T", "demo", "GQHDM8GNOJRT6QN9BK1OTGC9EJ3JLOUR93XKGWBWVAIZ95AU4XFSFPRIX36BKZ");
                        Console.WriteLine(result);
                        Console.ReadLine();
                        break;
                    case 6:
                        Console.WriteLine("Seleccionaste opcion 6 :  mtdObtenerDeuda");
                        Console.WriteLine("----------------------------------");
                        result = ServicioCliente.mtdObtenerDeuda(1,"2019", "COD", "MGT1234","demo", "GQHDM8GNOJRT6QN9BK1OTGC9EJ3JLOUR93XKGWBWVAIZ95AU4XFSFPRIX36BKZ");
                        Console.WriteLine(result);
                        Console.ReadLine();
                        break;
                    case 7:
                        Console.WriteLine("Seleccionaste opcion 7 :  mtdRegistrarPago");
                        Console.WriteLine("----------------------------------");
                        result = ServicioCliente.mtdRegistrarPago(1, DateTime.Now, "COD", "MGT1234", "1020809963", "EmpresaSRL", "105", "demo", "GQHDM8GNOJRT6QN9BK1OTGC9EJ3JLOUR93XKGWBWVAIZ95AU4XFSFPRIX36BKZ");
                        Console.WriteLine(result);
                        Console.ReadLine();
                        break;
                    case 8:
                        Console.WriteLine("Seleccionaste opcion 8 :  mtdRevertirPago");
                        Console.WriteLine("----------------------------------");
                        result = ServicioCliente.mtdRevertirPago(1, DateTime.Now, "102080909", "demo", "GQHDM8GNOJRT6QN9BK1OTGC9EJ3JLOUR93XKGWBWVAIZ95AU4XFSFPRIX36BKZ");
                        Console.WriteLine(result);
                        Console.ReadLine();
                        break;
                    case 9:
                        Console.WriteLine("Seleccionaste opcion 9 :  mtdExtornarFactura");
                        Console.WriteLine("----------------------------------");
                        result = ServicioCliente.mtdExtornarFactura(1, DateTime.Now, "10208099963", 90910, "demo", "GQHDM8GNOJRT6QN9BK1OTGC9EJ3JLOUR93XKGWBWVAIZ95AU4XFSFPRIX36BKZ");
                        Console.WriteLine(result);
                        Console.ReadLine();
                        break;
                    case 10:
                        Console.WriteLine("Seleccionaste opcion 10 :  mtdConsultarTransaccion");
                        Console.WriteLine("----------------------------------");
                        result = ServicioCliente.mtdConsultarTransaccion(1, DateTime.Now, "1008", "demo", "GQHDM8GNOJRT6QN9BK1OTGC9EJ3JLOUR93XKGWBWVAIZ95AU4XFSFPRIX36BKZ");
                        Console.WriteLine(result);
                        Console.ReadLine();
                        break;
                    case 11:
                        Console.WriteLine("Seleccionaste opcion 11 :  mtdObtenerDetallePagos");
                        Console.WriteLine("----------------------------------");
                        result = ServicioCliente.mtdObtenerDetallePagos(1, "COD", "MGT1234", DateTime.Now, DateTime.Now, "demo", "GQHDM8GNOJRT6QN9BK1OTGC9EJ3JLOUR93XKGWBWVAIZ95AU4XFSFPRIX36BKZ");
                        Console.WriteLine(result);
                        Console.ReadLine();
                        break;
                    case 12:
                        Console.WriteLine("Seleccionaste opcion 12 :  mtdObtenerDatosDeFactura");
                        Console.WriteLine("----------------------------------");
                        result = ServicioCliente.mtdObtenerDatosDeFactura(1, DateTime.Now, "1009", "demo", "GQHDM8GNOJRT6QN9BK1OTGC9EJ3JLOUR93XKGWBWVAIZ95AU4XFSFPRIX36BKZ");
                        Console.WriteLine(result);
                        Console.ReadLine();
                        break;
                    case 13:
                        Console.WriteLine("Seleccionaste opcion 13 :  mtdObtenerPlandePagos");
                        Console.WriteLine("----------------------------------");
                        result = ServicioCliente.mtdObtenerPlandePagos(1, "2019", "CON", "MGT1234", "demo", "GQHDM8GNOJRT6QN9BK1OTGC9EJ3JLOUR93XKGWBWVAIZ95AU4XFSFPRIX36BKZ");
                        Console.WriteLine(result);
                        Console.ReadLine();
                        break;
                    case 14:
                        Console.WriteLine("Seleccionaste opcion 14 :  mtdConciliarPagos");
                        Console.WriteLine("----------------------------------");
                        result = ServicioCliente.mtdConciliarPagos(1, DateTime.Now, DateTime.Now, "usuarioPago", "demo", "GQHDM8GNOJRT6QN9BK1OTGC9EJ3JLOUR93XKGWBWVAIZ95AU4XFSFPRIX36BKZ");
                        Console.WriteLine(result);
                        Console.ReadLine();
                        break;
                    default:
                        Console.WriteLine("No es una opcion valida !!!");
                        Console.ReadLine();
                        break;
                }

                //ServiceIntegradorClient ServicioCliente = new ServiceIntegradorClient();
                //string result = string.Empty;
                //result = ServicioCliente.mtdVerificarConectividad("usuario", "demo", "KWDKRVJT9PEOAIWEF25TL02EMBT6M1XFFKMF1O1VCV0SFPNIOX764DTK2VH3TO");
                //result = ServicioCliente.mtdObtenerConceptoPago(1, "2019", "demo", "KWDKRVJT9PEOAIWEF25TL02EMBT6M1XFFKMF1O1VCV0SFPNIOX764DTK2VH3TO");
                //result = ServicioCliente.mtdObtenerListaNiveles(1, "2019", "demo", "KWDKRVJT9PEOAIWEF25TL02EMBT6M1XFFKMF1O1VCV0SFPNIOX764DTK2VH3TO");
                //result = ServicioCliente.mtdObtenerListaSubNiveles(1, "2019", "demo", "KWDKRVJT9PEOAIWEF25TL02EMBT6M1XFFKMF1O1VCV0SFPNIOX764DTK2VH3TO");
                //result = ServicioCliente.mtdObtenerListaClientes(1, "2019", "T", "demo", "KWDKRVJT9PEOAIWEF25TL02EMBT6M1XFFKMF1O1VCV0SFPNIOX764DTK2VH3TO");
                //result = ServicioCliente.mtdObtenerDeuda(1,"2019", "COD", "MGT1234","demo", "KWDKRVJT9PEOAIWEF25TL02EMBT6M1XFFKMF1O1VCV0SFPNIOX764DTK2VH3TO");
                //result = ServicioCliente.mtdRegistrarPago(1, DateTime.Now, "COD", "MGT1234", "1020809963", "EmpresaSRL", "105", "demo", "KWDKRVJT9PEOAIWEF25TL02EMBT6M1XFFKMF1O1VCV0SFPNIOX764DTK2VH3TO");
                //result = ServicioCliente.mtdRevertirPago(1, DateTime.Now, "102080909", "demo", "KWDKRVJT9PEOAIWEF25TL02EMBT6M1XFFKMF1O1VCV0SFPNIOX764DTK2VH3TO");
                //result = ServicioCliente.mtdExtornarFactura(1, DateTime.Now, "10208099963", 90910, "demo", "KWDKRVJT9PEOAIWEF25TL02EMBT6M1XFFKMF1O1VCV0SFPNIOX764DTK2VH3TO");
                //result = ServicioCliente.mtdConsultarTransaccion(1, DateTime.Now, "1008", "demo", "KWDKRVJT9PEOAIWEF25TL02EMBT6M1XFFKMF1O1VCV0SFPNIOX764DTK2VH3TO");
                //result = ServicioCliente.mtdObtenerDetallePagos(1, "COD", "MGT1234", DateTime.Now, DateTime.Now, "demo", "KWDKRVJT9PEOAIWEF25TL02EMBT6M1XFFKMF1O1VCV0SFPNIOX764DTK2VH3TO");
                //result = ServicioCliente.mtdObtenerDatosDeFactura(1, DateTime.Now, "1009", "demo", "KWDKRVJT9PEOAIWEF25TL02EMBT6M1XFFKMF1O1VCV0SFPNIOX764DTK2VH3TO");
                //result = ServicioCliente.mtdObtenerPlandePagos(1, "2019", "CON", "MGT1234", "demo", "KWDKRVJT9PEOAIWEF25TL02EMBT6M1XFFKMF1O1VCV0SFPNIOX764DTK2VH3TO");
                //result = ServicioCliente.mtdConciliarPagos(1, DateTime.Now, DateTime.Now, "usuarioPago", "demo", "KWDKRVJT9PEOAIWEF25TL02EMBT6M1XFFKMF1O1VCV0SFPNIOX764DTK2VH3TO");
                // Console.WriteLine(result);
                //  Console.ReadLine();
            }
            catch (Exception ex) {
                Console.WriteLine(ex.Message);
                Console.ReadLine();
            }

        }
    }
}




