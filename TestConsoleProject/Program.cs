using Newtonsoft.Json;
using System;
using System.IO.Ports;
using System.Threading;
namespace TestConsoleProject
{
    class Program
    {
        static SerialPort _serialPort;
        static void Main(string[] args)
        {
            _serialPort = new SerialPort();
            _serialPort.PortName = "COM3";//Set your board COM
            _serialPort.BaudRate = 115200;
            _serialPort.Open();
            _serialPort.DataReceived += _serialPort_DataReceived;
            while (true)
            {
                Thread.Sleep(200);
            }
        }

        public class ImuData
        {
            public double x { get; set; }
            public double y { get; set; }
            public double z { get; set; }

            public override string ToString()
            {
                return String.Format($"{x} {y} {z}");
            }
        }

        private static void _serialPort_DataReceived(object sender, SerialDataReceivedEventArgs e)
        {
            SerialPort serialPort = sender as SerialPort;
            if (serialPort == null)
            {
                Console.WriteLine("Failed to Cast");
            }
            else
            {

                string line = serialPort.ReadLine();
                Console.WriteLine("line" + line);

                try {
                    ImuData data = JsonConvert.DeserializeObject<ImuData>(line);
                    Console.WriteLine("data" + data);
                }
                catch(Exception ex){
                    Console.WriteLine(ex);
                }



            }

        }
    }
}
