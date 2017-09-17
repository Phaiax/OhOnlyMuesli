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
    public static class RobotClientProvider
    {
#if UNITY_WSA && !UNITY_EDITOR
        static Dictionary<string, HttpClient> _clients = new Dictionary<string, HttpClient>();

        /// <summary>
        /// Createas an http client for a robot controller or returns a cached one. 
        /// The client will be logged in using default credentials.
        /// </summary>
        /// <param name="robotHostname">Hostname for robot.</param>
        /// <returns>HttpClient ready for requests to the robot.</returns>
        public static HttpClient GetHttpClientAsync(string robotHostname)
        {
            HttpClient client;
            if (!_clients.TryGetValue(robotHostname, out client))
            {
                var filter = new HttpBaseProtocolFilter();
                
                filter.AllowAutoRedirect = true;
                filter.ServerCredential = new Windows.Security.Credentials.PasswordCredential("http://{url}/rw", "Default User", "robotics");
                filter.AllowUI = false;

                client = new Windows.Web.Http.HttpClient(filter);
            }
            return client;
        }
    
#endif
    }
}
