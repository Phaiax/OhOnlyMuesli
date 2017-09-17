using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using RemoteRobotLib;
using System.Net.Http;

namespace RemoteControlRobot
{
    class Program
    {
        // Service port
		const string hostname = "23.101.77.124";
        //const string hostname = "localhost";
		public static AzureStorage store = new AzureStorage();
		public static RemoteYumi yumi;

        static void Main(string[] args)
        {
			



			var httpClient = RobotClientProvider.GetHttpClientAsync(hostname).Result;
			Program.yumi = new RemoteYumi(hostname, httpClient);
			Program.yumi.Init().Wait();
			Program.yumi.RunProcedureForBothArms("Home").Wait();
			Program.yumi.LeftArm.RunProcedure ("HandUp");
			Console.WriteLine (" ==== INIT COMPLETE === ");

            try
            {
				//RunWithProgramPointer().Wait();
				//RunWithRunLoop().Wait();
				Test().Wait();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
            
            Console.ReadKey();
        }

		static async Task Test()
		{
			HoloInterface h = new HoloInterface();
			float xg = 0.318f;
			float yg = 0.028f;
			float zg = 0.132f;
			h.UpdatePoint (xg, yg, zg);
			h.StartMotion();
			h.OpenGripper();

			for (int i = 0; i < 300; i++) {
				h.UpdatePoint (xg+(i/1000.0f), yg+(i/1000.0f), zg+(i/1000.0f));
				await Task.Delay (50);
			}

			//await Task.Delay (2000);
			//h.CloseGripper();
			//await Task.Delay (2000);
			//h.StopMotion();
			await Task.Delay (2000);
			//h.GoodBoy ();
			await Task.Delay (4000);
			Console.WriteLine ("Waiting Finished");
		}

        static async Task RunWithProgramPointer()
        {
            // Using this method to get the HttpClient ensures that we are already logged in to the
            // robot when we try to send commands later.
            Console.WriteLine("1");
            var httpClient = await RobotClientProvider.GetHttpClientAsync(hostname);
            Console.WriteLine("2");
            // The RemoteYumi class represents the whole robot.
            var yumi = new RemoteYumi(hostname, httpClient);
            Console.WriteLine("3");
            // We must set the program pointer to the routine we want to run for each arm.
            await yumi.LeftArm.SetPPToRoutine("Gestures","NoClue");
            await yumi.RightArm.SetPPToRoutine("Gestures", "NoClue");
            Console.WriteLine("4");
            // To actually get the robot to move the execution must be started.
            await yumi.StartExecution();
            Console.WriteLine("5");
        }

        static async Task RunWithRunLoop()
        {
			Console.WriteLine("1");
            var httpClient = await RobotClientProvider.GetHttpClientAsync(hostname);
			Console.WriteLine("2");
            var yumi = new RemoteYumi(hostname, httpClient);
			Console.WriteLine("3");

            await yumi.Init();
			Console.WriteLine("4");

            await yumi.RunProcedureForBothArms("NoClue");
			Console.WriteLine("5");

        }

    }
}
