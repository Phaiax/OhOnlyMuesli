using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
#if UNITY_WSA && !UNITY_EDITOR
using Windows.Web.Http.Filters;
using Windows.Web.Http;
#endif


namespace NewRobotControl
{
    public class RemoteYumi
    {
#if UNITY_WSA && !UNITY_EDITOR

        readonly string _hostname;
        readonly HttpClient _client;

        public RemoteYumi(string hostname, HttpClient client)
        {
            _hostname = hostname;
            _client = client;
            LeftArm = new RemoteRobotTask(hostname, "T_ROB_L", client);
            RightArm = new RemoteRobotTask(hostname, "T_ROB_R", client);
        }
#endif

        public RemoteRobotTask LeftArm { get; }
        public RemoteRobotTask RightArm { get; }

        /// <summary>
        /// Runs the same procedure for both arms.
        /// </summary>
        /// <param name="procedureName">The name of the procdure.</param>
        public async Task RunProcedureForBothArms(string procedureName)
        {
            await Task.WhenAll(new Task[] { LeftArm.RunProcedure(procedureName), RightArm.RunProcedure(procedureName) });               
        }

        public async Task StartExecution()
        {
#if UNITY_WSA && !UNITY_EDITOR

            string url = $"http://{_hostname}/rw/rapid/execution?action=start";
            var parameters = new Dictionary<string, string>
            {
                { "regain", "clear" },
                { "execmode", "continue" },
                { "cycle", "once" },
                { "condition", "none" },
                { "stopatbp", "enabled" },
                { "alltaskbytsp", "true" },
            };

            var content = new HttpFormUrlEncodedContent(parameters);
			var response = await _client.PostAsync(new Uri(url), content);
            if (!response.IsSuccessStatusCode)
            {
               // Console.WriteLine(await response.Content.ReadAsStringAsync());
            }
            response.EnsureSuccessStatusCode();
#endif

        }

        public async Task Init()
        {
            await Task.WhenAll(new Task[] { RightArm.Init(), LeftArm.Init() });
        }

	
    }
}
