using System;
using System.Collections;
using Microsoft.Azure;
using Microsoft.WindowsAzure;
using Microsoft.WindowsAzure.Storage;
using Microsoft.WindowsAzure.Storage.Blob;
using Newtonsoft.Json;

namespace RemoteControlRobot
{
	public class AzureStorage
	{
		private CloudStorageAccount storageAccount;
		private CloudBlobClient blobClient;
		private CloudBlobContainer container;

		public AzureStorage ()
		{
			String storageConnectionString = "DefaultEndpointsProtocol=https;AccountName=oom;AccountKey=sIRqaNUlztHLFaaE/BKasMU/zg4M3V4+a8pfKI/oiUcGtv51VDoMWqt3E1UK+6Ion5jmohFM3+uTl7pMcrdQjw==";
			storageAccount = CloudStorageAccount.Parse(storageConnectionString);

			blobClient = storageAccount.CreateCloudBlobClient();

			// Retrieve a reference to a container.
			container = blobClient.GetContainerReference("hololense");

			// Create the container if it doesn't already exist.
			if (container.CreateIfNotExists ()) {
				container.SetPermissions (
					new BlobContainerPermissions { PublicAccess = BlobContainerPublicAccessType.Blob });
			}
		}

		public void putBlob(MyPoint[] list)
		{
			DateTime now = DateTime.Now;
			String blobname = "path-" + now.Year + "." + now.Month + "." + now.Day + "-" + now.Hour + ":" + now.Minute;
			// Retrieve reference to a blob named "myblob".
			CloudBlockBlob blockBlob = container.GetBlockBlobReference(blobname);

			String j = JsonConvert.SerializeObject (list);
			blockBlob.UploadText(j);
		}
	}
}

