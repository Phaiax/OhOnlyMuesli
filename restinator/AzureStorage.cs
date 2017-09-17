using System;
using System.Collections;
using Newtonsoft.Json;
using Unity3dAzure.StorageServices;
using System.Threading.Tasks;

namespace NewRobotControl
{
	public class AzureStorage
	{
        private BlobService bs;

        public AzureStorage ()
		{
			//String storageConnectionString = "DefaultEndpointsProtocol=https;AccountName=oom;AccountKey=sIRqaNUlztHLFaaE/BKasMU/zg4M3V4+a8pfKI/oiUcGtv51VDoMWqt3E1UK+6Ion5jmohFM3+uTl7pMcrdQjw==";
            StorageServiceClient cl = new StorageServiceClient("oom", "sIRqaNUlztHLFaaE/BKasMU/zg4M3V4+a8pfKI/oiUcGtv51VDoMWqt3E1UK+6Ion5jmohFM3+uTl7pMcrdQjw==");

            bs = new BlobService(cl);
		}

		public async Task putBlob(MyPoint[] list)
		{
            await new Task(() => { 
			    DateTime now = DateTime.Now;
			    String blobname = "path-" + now.Year + "." + now.Month + "." + now.Day + "-" + now.Hour + ":" + now.Minute;

                String j = JsonConvert.SerializeObject(list);

                bs.PutTextBlob((pr) => { MainScript.Log(pr.StatusCode.ToString() + " [" + pr.Content + "]"); }, j, "hololense", blobname, "text/json");
            });
        }
	}
}

