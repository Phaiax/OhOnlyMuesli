﻿using System;
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
        //const string hostname = "172.20.0.224"; // real  robot

        //const string hostname = "requestb.in/1df3ott1";

        MyPoint ground0, actPoint;
        MyPoint initPoint = new MyPoint(318, 28, 132, false);

        public HoloInterface()
        {
            store = new AzureStorage();
            Task.Run(async () => 
            {
                await Task.Delay(1000);
                await InitAsync();
            });
            
        }


        public async Task InitAsync()
        {
#if UNITY_WSA && !UNITY_EDITOR

            store.putBlob(new MyPoint[] { new MyPoint(0, 0, 0, false), new MyPoint(1, 1, 1, true) });

            MainScript.Log("-1");
            var httpClient = RobotClientProvider.GetHttpClientAsync(hostname);
            MainScript.Log("0");

            //string url = "http://requestb.in/1df3ott1";
            //var response = await httpClient.GetAsync(new Uri(url));
            //var content = await response.Content.ReadAsStringAsync();
            //MainScript.Log("1 " + content);
            //return;

            yumi = new RemoteYumi(hostname, httpClient);

            await yumi.RightArm.DisableLiveFollow();
            MainScript.Log("1");
            await yumi.Init();
            MainScript.Log("2");
            await yumi.RunProcedureForBothArms("Home");
            MainScript.Log("3");
            await yumi.LeftArm.RunProcedure("HandUp");
            MainScript.Log("4");

            await yumi.RightArm.ActivateLiveFollow();
            await yumi.RightArm.OpenGripper();
            await Task.Delay(1000);
            await yumi.RightArm.CloseGripper();
            await Task.Delay(1000);
            await yumi.RightArm.DisableLiveFollow();
            await Task.Delay(1000);
            isInitialized = true;
            MainScript.Log("Initialized!");
            lastUpdate = DateTime.Now;


#endif
        }

        public void StartRecording()
        {
            if (!isInitialized) return;
            currentPath.Clear();
            isRecording = true;
            StartMotion();
            currentPath.Add(initPoint);
        }

        public void StopRecording()
        {
            if (!isInitialized) return;
            if (isRecording)
            {
                isRecording = false;
                var arr = currentPath.ToArray();
                Task.Run(() => { store.putBlob(arr); });
            }
            StopMotion();
        }

        public void StartMotion()
        {
            if (!isInitialized) return;
            if (!isMoving)
            {
                isMoving = true;
                isRecording = true;
                currentPath.Clear();

                Task.Run(async () => { await yumi.RightArm.ActivateLiveFollow(); });

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
                Task.Run(async () => { await yumi.RightArm.DisableLiveFollow(); });

                isRecording = false;
                var arr = currentPath.ToArray();
                Task.Run( () => {  store.putBlob(arr); });

            }
        }

        public void CloseGripper()
        {
            if (!isInitialized) return;
            if (g_state == false)
            {
                g_state = true;
                Task.Run(async () => { await yumi.RightArm.CloseGripper(); });
            }
        }

        public void OpenGripper()
        {
            if (!isInitialized) return;
            if (g_state == true)
            {
                g_state = false;
                Task.Run(async () => { await yumi.RightArm.OpenGripper(); });
            }
        }


        public void GoodBoy()
        {
            Task.Run(async () => { 

                if (isMoving)
                {
                    await yumi.RightArm.DisableLiveFollow();
                }
                await yumi.RunProcedureForBothArms("Home");
                await yumi.RunProcedureForBothArms("Powerful");
                await yumi.RightArm.RunProcedure("Home");
                await yumi.LeftArm.RunProcedure("HandUp");

                if (isMoving)
                {
                    await yumi.RightArm.ActivateLiveFollow();
                }
            });
        }

        private DateTime lastUpdate = DateTime.Now;

        public void UpdatePoint(float x, float y, float z)
        {
            if (!isInitialized) return;

            x = (float)(x * 1000.0);
            y = (float)(y * 1000.0);
            z = (float)(z * 1000.0);
            actPoint = new MyPoint(x, y, z, g_state);
            MyPoint newpoint = actPoint;

            var timediff = DateTime.Now - lastUpdate;
            if (timediff.TotalMilliseconds < 300)
            {
                return;
            }
            lastUpdate = DateTime.Now;

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
                        Task.Run(async () => { await yumi.RightArm.MoveToPoint(diffp.x, diffp.y, diffp.z); });
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

