using System;
using System.IO;
using System.Runtime.Serialization;
using System.Runtime.Serialization.Formatters.Binary;


namespace RemoteControlRobot
{
	public class MyPoint : ISerializable
	{
		public float x;
		public float y;
		public float z;
		public bool g;

		public MyPoint (float _x, float _y, float _z, bool _g)
		{
			x = _x;
			y = _y;
			z = _z;
			g = _g;	
		}

		public MyPoint (double _x, double _y, double _z, bool _g)
		{
			x = (float) _x;
			y = (float)_y;
			z = (float)_z;
			g = _g;	
		}

		public MyPoint diff_point(MyPoint p)
		{
			return  new MyPoint(x - p.x, y - p.y, z - p.z, g);
		}

		public MyPoint add_point(MyPoint p)
		{
			return  new MyPoint(x + p.x, y + p.y, z + p.z, g);
		}

		//Deserialization constructor.
		public MyPoint(SerializationInfo info, StreamingContext ctxt)
		{
			//Get the values from info and assign them to the appropriate properties
			x = (float)info.GetValue("x", typeof(float));
			y = (float)info.GetValue("y", typeof(float));
			z = (float)info.GetValue("z", typeof(float));
			g = (bool)info.GetValue("g", typeof(bool));
		}

		//Serialization function.
		public void GetObjectData(SerializationInfo info, StreamingContext ctxt)
		{
			//You can use any custom name for your name-value pair. But make sure you
			// read the values with the same name. For ex:- If you write EmpId as "EmployeeId"
			// then you should read the same with "EmployeeId"
			info.AddValue("x", x);
			info.AddValue("y", y);
			info.AddValue("z", z);
			info.AddValue("g", g);
		}

	}
}

