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
		float tresh=0.05f; //meter :D

		public HoloInterface ()
		{
		}

		public void StartRecording() {
			currentPath.Clear ();
			isRecording = true;
		}

		public void StopRecording() {
			if (isRecording) {
				isRecording = false;
				Program.store.putBlob (currentPath.ToArray ());
			}
		}

		public void StartMotion() {
			if (!isMoving) {
				isMoving = true;
			}
		}

		public void StopMotion() {
			if (isMoving) {
				isMoving = false;
			}
		}

		public void CloseGripper() {
			if (g_state == false) {
				g_state = true;
				Program.yumi.RightArm.closeGripper ();
			}
		}

		public void OpenGripper() {
			if (g_state == true) {
				g_state = false;
				Program.yumi.RightArm.openGripper ();
			}
		}

		public void UpdatePoint(float x, float y, float z) {
			MyPoint lastp =	currentPath[currentPath.Count-1];
			MyPoint diffp = lastp.diff_point(new MyPoint(x,y,z,g_state));
			float dist = (float) Math.Sqrt(diffp.x * diffp.x + diffp.y * diffp.y + diffp.z * diffp.z);
			if (dist > tresh || lastp.g != g_state) {
				if (isRecording) {
					currentPath.Add (new MyPoint (x, y, z, g_state));
				}
				if (isMoving) {
					//moving...  MyPoint (x, y, z, g_state

				}
			}
		}

		public void PlayLast() {

		}


	}
}

