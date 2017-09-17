using System;
using System.Collections.Generic;
using System.Linq;
#if UNITY_WSA && !UNITY_EDITOR
using Windows.Web.Http.Filters;
using Windows.Web.Http;
#endif
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json;
using UnityEngine.Networking;

namespace NewRobotControl
{
    public class RemoteRobotTask
    {
        readonly string _hostname;
        readonly string _taskName;

#if UNITY_WSA && !UNITY_EDITOR
        readonly HttpClient _client;

        public RemoteRobotTask(string hostname, string taskName, HttpClient client)
        {
            _hostname = hostname;
            _taskName = taskName;
            _client = client;
        }
#endif

        /// <summary>
        /// Makes sure that no motion is already running and the the robot is ready for commands.
        /// </summary>
        /// <returns></returns>
        public async Task Init()
        {
            // The state is stored in this module on the robot controller.
            const string moduleName = "Remote";

            await WaitForBoolValue(moduleName, "bStart", false);
            await WaitForBoolValue(moduleName, "bRunning", false);
        }

        public async Task RunProcedure(string procedureName)
        {
            // The robot is waiting for us to tell it what to do.

            // The state is stored in this module on the robot controller.
            const string moduleName = "Remote";

            // First, let it know what procedure we want to run.
            await SetStringVariable(moduleName, "stName", procedureName);
            // Then, tell the robot to stop waiting and start.
            await SetBoolVariable(moduleName, "bStart", true);
            // Immediately after starting the robot will set the bStart boolean back to false.
            // By waiting we know it has started.
            await WaitForBoolValue(moduleName, "bStart", false);
            // When the robot is finished moving and is waiting for a new command it will set 
            // the bRunning variable back to false.
            await WaitForBoolValue(moduleName, "bRunning", false);
        }

        /// <summary>
        /// Set the program pointer to a routine.
        /// </summary>
        /// <param name="moduleName">The module containing the routine.</param>
        /// <param name="routineName">The name of the routine.</param>
        public async Task SetPPToRoutine(string moduleName, string routineName)
        {
#if UNITY_WSA && !UNITY_EDITOR

            string url = $"http://{_hostname}/rw/rapid/tasks/{_taskName}/pcp?action=set-pp-routine";
            var parameters = new Dictionary<string, string>
            {
                {"module", moduleName },
                {"routine", routineName },
            };
            var content = new HttpFormUrlEncodedContent(parameters);
            MainScript.Log(url + DictToString(parameters));
            var response = await _client.PostAsync(new Uri(url), content);
            if (!response.IsSuccessStatusCode)
            {
                MainScript.Log(await response.Content.ReadAsStringAsync());
            }
            response.EnsureSuccessStatusCode();
#endif

        }

        async Task WaitForBoolValue(string moduleName, string name, bool value)
        {
            // Setting up subscriptions requires a websocket connection.
            // Let's use polling for now.
            while ((await GetBoolVariable(moduleName, name)) != value)
            {
                await Task.Delay(100);
            }
        }

        async Task<bool> GetBoolVariable(string moduleName, string name)
        {
#if UNITY_WSA && !UNITY_EDITOR
            MainScript.Log($"GetBoolVariable {moduleName} {name}");
            string url = $"http://{_hostname}/rw/rapid/symbol/data/RAPID/{_taskName}/{moduleName}/{name}?json=1";
            var response = await _client.GetAsync(new Uri(url));
            response.EnsureSuccessStatusCode();
            var content = await response.Content.ReadAsStringAsync();
            var tr = content.Contains("\"value\":\"TRUE\"");
            //MainScript.Log("JSON " + content);
            //JObject json = JObject.Parse(content);
            //string value = json["_embedded"]["_state"][0]["value"].ToString();
            //string value = "false";
            MainScript.Log("GET " + url + " getBool() -> " + tr.ToString() + content);
            return tr;
#else   
            return false;
#endif
        }

        async Task SetNumVariable(string moduleName, string name, float value)
		{
			await SetVariable(moduleName, name, value.ToString());
		}

        async Task SetBoolVariable(string moduleName, string name, bool value)
        {
            await SetVariable(moduleName, name, GetBoolString(value));
        }

        async Task SetStringVariable(string moduleName, string name, string value)
		{
            await SetVariable(moduleName, name, $"\"{value}\"");
		}

        async Task SetVariable(string moduleName, string name, string value)
        {
#if UNITY_WSA && !UNITY_EDITOR

            var parameters = new Dictionary<string, string>
            {
                {"value", value },
            };
            var content = new HttpFormUrlEncodedContent(parameters);
            string url = $"http://{_hostname}/rw/rapid/symbol/data/RAPID/{_taskName}/{moduleName}/{name}?action=set";
            var response = await _client.PostAsync(new Uri(url), content);
            response.EnsureSuccessStatusCode();
			string respcontent = await response.Content.ReadAsStringAsync();
            
            MainScript.Log("POST " + url + " " + DictToString(parameters) + " " + respcontent);
#else
            return;
#endif

        }
        string GetBoolString(bool value)
        {
            return value ? "TRUE" : "FALSE";
        }

        bool ParseBoolString(string value)
        {
            if (value.ToLowerInvariant().Equals("true"))
            {
                return true;
            }
            else if (value.ToLowerInvariant().Equals("false"))
            {
                return false;
            }
            else
            {
                throw new Exception("Unexpected bool value");
            }
        }

		string DictToString(Dictionary<string, string> dict)
		{
			string res = "";
			foreach(KeyValuePair<string, string> kv in dict) 
			{
				res += " " + kv.Key + "=" + kv.Value;
			}

			return res;
		}

		public async Task OpenGripper()
		{
            await SetBoolVariable("LiveFollow", "bGripperState", false);
		}

		public async Task CloseGripper()
		{
            await SetBoolVariable("LiveFollow", "bGripperState", true);
		}

		public async Task MoveToPoint(float x, float y, float z)
		{
            await SetNumVariable("LiveFollow", "nXPos", x);
            await SetNumVariable("LiveFollow", "nYPos", y);
            await SetNumVariable("LiveFollow", "nZPos", z);
        }

		public async Task ActivateLiveFollow()
		{
            await SetStringVariable("Remote", "stName", "StartLiveFollow");
            await SetBoolVariable("Remote", "bStart", true);
            await WaitForBoolValue("LiveFollow", "bLiveFollowActive", true);
		}

		public async Task DisableLiveFollow()
		{
            await SetBoolVariable("LiveFollow", "bLiveFollowActive", false);
		}
    }
}
