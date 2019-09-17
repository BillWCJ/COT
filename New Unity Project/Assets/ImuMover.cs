using System;
using System.Collections;
using System.Collections.Generic;
using System.IO.Ports;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UnityEngine;

namespace Assets
{
    class ImuMover : MonoBehaviour
    {
        SerialPort _serialPort = new SerialPort("COM3", 115200);
        float x = 0;
        float y = 0;
        float z = 0;

        public ImuMover()
        {

        }
        void Awake()
        {
            Debug.Log("Awake");
        }

        IEnumerator Start()
        {
            Debug.Log("Start1");
            if (!_serialPort.IsOpen)
            {
                _serialPort.Open();
            }
            yield return new WaitForSeconds(2.5f);
            Debug.Log("Start2");
        }
        
        void Update()
        {
            String line = _serialPort.ReadLine();
            Debug.Log("line" + line);

            String[] split = line.Split();
            if (split.Length == 4 && split[3] == "Done")
            {
                x = float.Parse(split[0]);
                x = x < 0 ? x + 360 : x;
                y = float.Parse(split[1]);
                y = y < 0 ? y + 360 : y;
                z = float.Parse(split[2]);
                z = z < 0 ? z + 360 : z;

                Debug.Log($"{x} {y} {z}");
                _serialPort.BaseStream.Flush();
            }
            Debug.Log($"Set {x} {y} {z}");
            transform.rotation = Quaternion.Euler(z, x, y);
        }
    }
}
