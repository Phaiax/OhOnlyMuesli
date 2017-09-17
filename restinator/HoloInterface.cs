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

        const string hostname = "23.101.77.124";
        //const string hostname = "requestb.in/1df3ott1";

        public HoloInterface()
        {
            InitAsync().Start();
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
            yumi.RunProcedureForBothArms("Home");
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
                //Program.store.putBlob (currentPath.ToArray ());
            }
            StopMotion();
        }

        public void StartMotion()
        {
            if (!isInitialized) return;
            if (!isMoving)
            {
                isMoving = true;
                yumi.RightArm.ActivateLiveFollow().Start();
            }
        }

        public void StopMotion()
        {
            if (!isInitialized) return;
            if (isMoving)
            {
                isMoving = false;
                yumi.RightArm.DisableLiveFollow().Start();
            }
        }

        public void CloseGripper()
        {
            if (!isInitialized) return;
            if (g_state == false)
            {
                g_state = true;
                yumi.RightArm.CloseGripper().Start();
            }
        }

        public void OpenGripper()
        {
            if (!isInitialized) return;
            if (g_state == true)
            {
                g_state = false;
                yumi.RightArm.OpenGripper().Start();
            }
        }

        public void UpdatePoint(float x, float y, float z)
        {
            if (!isInitialized) return;
            MyPoint lastp = currentPath[currentPath.Count - 1];
            MyPoint diffp = lastp.diff_point(new MyPoint(x, y, z, g_state));
            float dist = (float)Math.Sqrt(diffp.x * diffp.x + diffp.y * diffp.y + diffp.z * diffp.z);
            if (dist > tresh || lastp.g != g_state)
            {
                if (isRecording)
                {
                    currentPath.Add(new MyPoint(x, y, z, g_state));
                }
                if (isMoving)
                {
                    //moving...  MyPoint (x, y, z, g_state
                    yumi.RightArm.MoveToPoint(x, y).Start();
                }
            }
        }

        public void PlayLast()
        {
            if (!isInitialized) return;

        }


    }
}

