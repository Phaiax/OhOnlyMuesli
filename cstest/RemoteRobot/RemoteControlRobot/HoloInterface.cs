using System;
using System.Collections;
using System.Collections.Generic;
using System.Threading;

namespace RemoteControlRobot
{
	public class HoloInterface
	{
		List<MyPoint> currentPath = new List<MyPoint>();
		bool isRecording = false;
		bool isMoving = false;

		bool g_state=false;
		float tresh=10f; //meter :D

		MyPoint ground0, actPoint;
		MyPoint initPoint = new MyPoint(90,-157,148);

		public HoloInterface ()
		{
		}

		public void StartRecording() {
			currentPath.Clear ();
			isRecording = true;
			StartMotion ();
			currentPath.Add (initPoint);
		}

		public void StopRecording() {
			if (isRecording) {
				isRecording = false;
				Program.store.putBlob (currentPath.ToArray ());
			}
			StopMotion ();
		}

		public void StartMotion() {
			if (!isMoving) {
				isMoving = true;
				Program.yumi.RightArm.ActivateLiveFollow ().Wait();
				ground0 = actPoint;
				currentPath.Add (initPoint); //sonst lässt sich das delta nicht berechnen
			}
		}

		public void StopMotion() {
			if (isMoving) {
				isMoving = false;
				Program.yumi.RightArm.DisableLiveFollow ();
			}
		}

		public void GoodBoy() {
			if (isMoving) {				
				Program.yumi.RightArm.DisableLiveFollow ();
			}
			Program.yumi.RunProcedureForBothArms("Home").Wait();
			Program.yumi.RunProcedureForBothArms("Powerful").Wait();
			Program.yumi.RightArm.RunProcedure("Home").Wait();
			Program.yumi.LeftArm.RunProcedure("HandUp").Wait();

			if (isMoving) {
				Program.yumi.RightArm.ActivateLiveFollow ().Wait ();
			}
		}
			

		public void CloseGripper() {
			if (g_state == false) {
				g_state = true;
				Program.yumi.RightArm.CloseGripper ();
			}
		}

		public void OpenGripper() {
			if (g_state == true) {
				g_state = false;
				Program.yumi.RightArm.OpenGripper ();
			}
		}

		public void UpdatePoint(float x, float y, float z) {
			x = x * 1000.0;
			y = y * 1000.0;
			z = z * 1000.0;
			actPoint = MyPoint (x, y, z, g_state);
			MyPoint newpoint = actPoint;
			newpoint = newpoint.diff_point(ground0);
			if (currentPath.Count > 0) {				
				float dist = (float)Math.Sqrt (newpoint.x * newpoint.x + newpoint.y * newpoint.y + newpoint.z * newpoint.z);
				if (dist > tresh || lastp.g != g_state) {
					MyPoint lastp =	currentPath [currentPath.Count - 1];
					MyPoint diffp = lastp.add_point (newpoint);
					if (isRecording) {
						currentPath.Add (diffp);
					}
					if (isMoving) {
						//moving...  MyPoint (x, y, z, g_state
						Program.yumi.RightArm.MoveToPoint (diffp.x,diffp.y);
					}
				}
			}
		}

		public void PlayLast() {

		}


	}
}

