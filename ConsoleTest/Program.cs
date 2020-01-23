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

                result = ServicioCliente.mtdVerificarConectividad("usuario", "demo", "KWDKRVJT9PEOAIWEF25TL02EMBT6M1XFFKMF1O1VCV0SFPNIOX764DTK2VH3TO");
                
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




