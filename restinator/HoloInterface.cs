using System;
using System.Collections;
using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;

namespace NewRobotControl
{
    public class HoloInterface
    {
        List<MyPoint> currentPath = new List<MyPoint>();
        bool isRecording = false;
        bool isMoving = false;
        bool isInitialized = false;

        bool g_state = false;
        float tresh = 0.05f; //meter :D

        public RemoteYumi yumi;
        public AzureStorage store;

        const string hostname = "23.101.77.124";
        //const string hostname = "requestb.in/1df3ott1";

        MyPoint ground0, actPoint;
        MyPoint initPoint = new MyPoint(90, -157, 148, false);

        public HoloInterface()
        {
            store = new AzureStorage();
            Task.Run(async () => 
            {
                await InitAsync();
            });
            
        }


        public async Task InitAsync()
        {
#if UNITY_WSA && !UNITY_EDITOR
 
            MainScript.Log("-1");
            var httpClient = RobotClientProvider.GetHttpClientAsync(hostname);
            MainScript.Log("0");

            //string url = "http://requestb.in/1df3ott1";
            //var response = await httpClient.GetAsync(new Uri(url));
            //var content = await response.Content.ReadAsStringAsync();
            //MainScript.Log("1 " + content);
            //return;

            yumi = new RemoteYumi(hostname, httpClient);

            MainScript.Log("1");
            await yumi.Init();
            MainScript.Log("2");
            await yumi.RunProcedureForBothArms("Home");
            MainScript.Log("3");
            await yumi.LeftArm.RunProcedure("HandUp");
            MainScript.Log("4");

            await yumi.RightArm.ActivateLiveFollow();
            await yumi.RightArm.CloseGripper();
            await Task.Delay(1000);
            await yumi.RightArm.CloseGripper();
            await Task.Delay(1000);
            await yumi.RightArm.DisableLiveFollow();
            await Task.Delay(1000);
            isInitialized = true;
            MainScript.Log("Initialized!");
#endif
        }

        public void StartRecording()
        {
            currentPath.Clear();
            isRecording = true;
            StartMotion();
        }

        public void StopRecording()
        {
            if (!isInitialized) return;
            if (isRecording)
            {
                isRecording = false;
                store.putBlob (currentPath.ToArray ());
            }
            StopMotion();
        }

        public void StartMotion()
        {
            if (!isInitialized) return;
            if (!isMoving)
            {
                isMoving = true;
                yumi.RightArm.ActivateLiveFollow();
                ground0 = actPoint;
                currentPath.Add(initPoint); //sonst lässt sich das delta nicht berechnen
            }
        }

        public void StopMotion()
        {
            if (!isInitialized) return;
            if (isMoving)
            {
                isMoving = false;
                yumi.RightArm.DisableLiveFollow();
            }
        }

        public void CloseGripper()
        {
            if (!isInitialized) return;
            if (g_state == false)
            {
                g_state = true;
                yumi.RightArm.CloseGripper();
            }
        }

        public void OpenGripper()
        {
            if (!isInitialized) return;
            if (g_state == true)
            {
                g_state = false;
                yumi.RightArm.OpenGripper();
            }
        }


        public void GoodBoy()
        {
            if (isMoving)
            {
                yumi.RightArm.DisableLiveFollow().Wait();
            }
            yumi.RunProcedureForBothArms("Home");
            yumi.RunProcedureForBothArms("Powerful");
            yumi.RightArm.RunProcedure("Home").Wait();
            yumi.LeftArm.RunProcedure("HandUp").Wait();

            if (isMoving)
            {
                yumi.RightArm.ActivateLiveFollow().Wait();
            }
        }

        public void UpdatePoint(float x, float y, float z)
        {
            if (!isInitialized) return;

            x = (float)(x * 1000.0);
            y = (float)(y * 1000.0);
            z = (float)(z * 1000.0);
            actPoint = new MyPoint(x, y, z, g_state);
            MyPoint newpoint = actPoint;
            if (currentPath.Count > 0)
            {
                newpoint = newpoint.diff_point(ground0);

                float dist = (float)Math.Sqrt(newpoint.x * newpoint.x + newpoint.y * newpoint.y + newpoint.z * newpoint.z);
                MyPoint lastp = currentPath[currentPath.Count - 1];
                if (dist > tresh || lastp.g != g_state)
                {
                    MyPoint diffp = lastp.add_point(newpoint);
                    if (isRecording)
                    {
                        currentPath.Add(diffp);
                    }
                    if (isMoving)
                    {
                        //moving...  MyPoint (x, y, z, g_state
                        yumi.RightArm.MoveToPoint(diffp.x, diffp.y);
                    }
                }
            }
        }

        public void PlayLast()
        {
            if (!isInitialized) return;

        }


    }
}

