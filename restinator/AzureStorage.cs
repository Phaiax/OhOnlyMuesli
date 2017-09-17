using System;
using System.Collections;
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

		public void putBlob(MyPoint[] list)
		{
			DateTime now = DateTime.Now;
			String blobname = "path-" + now.Year + "." + now.Month + "." + now.Day + "-" + now.Hour + ":" + now.Minute;
            MainScript.Log("Blob: " + blobname);

            string j = "";
            foreach (MyPoint p in list)
            {
                string s = String.Format("{0},{1},{2},{3};", p.x, p.y, p.z, p.g);
                j += s;
            }
                
            MainScript.Log("Serialized: " + j);

            bs.PutTextBlob((pr) => { MainScript.Log(pr.StatusCode.ToString() + " [" + pr.Content + "]"); }, j, "hololense", blobname, "text/json");
        }
	}
}

