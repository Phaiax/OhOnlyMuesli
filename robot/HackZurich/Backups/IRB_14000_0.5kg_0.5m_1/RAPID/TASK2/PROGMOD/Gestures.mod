MODULE Gestures
    VAR syncident syncCommandStart;
    VAR syncident syncCommandEnd;
    VAR syncident syncToDiss;
    VAR syncident syncGiveMeAHug;
    VAR syncident syncGiveMeAHug1;
    VAR syncident syncGoAway;
    VAR syncident syncGoAway1;
    VAR syncident syncGoAway2;
    VAR syncident syncPowerfull;
    VAR syncident syncExcited;
    VAR syncident syncExcited1;
    VAR syncident syncExcited2;
    VAR syncident syncExcited3;
    VAR syncident syncScared;
    VAR syncident syncScared1;
    VAR syncident syncHappy;
    VAR syncident syncHappy1;
    VAR syncident syncHappy2;
    VAR syncident syncHappy3;
    
    CONST robtarget pContemptL_10:=[[-94.491553607,225.077568886,137.327093089],[0.306193092,0.231227469,-0.892125882,-0.238518467],[-1,0,1,5],[170.068678796,9E+09,9E+09,9E+09,9E+09,9E+09]];
    
    CONST robtarget pAngerL_10:=[[431.098301309,61.959159256,458.125646738],[0.188343319,-0.135994051,0.205422096,-0.950701938],[-1,0,1,4],[116.357977607,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pAngerL_20:=[[427.541303481,96.078854268,428.274281879],[0.242851724,-0.180947804,0.292829472,-0.906935407],[-1,0,1,4],[121.814803059,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pAngerL_30:=[[371.370802791,102.647922136,430.309317662],[0.250175091,-0.189729403,0.368594998,-0.874958802],[-1,0,1,4],[129.017692817,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pAngerL_40:=[[354.020430947,75.987991242,458.212372351],[0.211781199,-0.1200539,0.309854599,-0.919089719],[-1,0,1,4],[127.31237471,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pAngerL_50:=[[359.09325296,50.040718323,483.103930387],[0.132670971,-0.022575789,0.326351779,-0.935619187],[-1,0,1,4],[134.887718951,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pAngerL_60:=[[396.062972248,27.911166703,492.703033028],[0.114272503,-0.022558134,0.275782172,-0.954136845],[-1,0,1,4],[129.639362388,9E+09,9E+09,9E+09,9E+09,9E+09]];
    
	CONST robtarget pToDissL_10:=[[311.262788205,141.365155063,320.620976131],[0.30127594,0.413850338,-0.12183377,0.850363004],[-1,0,0,4],[109.137922493,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget pToDissL_20:=[[313.163869898,99.550091581,313.678214603],[0.405584331,0.369718383,-0.180052484,0.816327612],[-1,0,0,4],[120.550323233,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget pToDissL_30:=[[327.793203037,3.134311337,277.462215839],[0.525517576,0.35593926,-0.443885036,0.632538216],[-1,0,0,4],[161.707001678,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget pToDissL_40:=[[274.023321791,-80.991562457,305.086937965],[0.647848865,0.227051384,-0.451204352,0.570222895],[-1,0,0,4],[171.12747593,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget pToDissL_50:=[[233.086731165,-187.421735572,361.300083015],[0.647848463,0.227050931,-0.451204503,0.570223413],[-1,1,-1,4],[154.498524311,9E+09,9E+09,9E+09,9E+09,9E+09]];
    
    CONST robtarget pHomeL_10:=[[89.387946423,156.622117957,147.913470217],[0.066010726,0.842420918,-0.111214912,0.523068661],[0,0,0,4],[101.964427132,9E+09,9E+09,9E+09,9E+09,9E+09]];
	
    CONST robtarget pSuprisedL_10:=[[108.153191894,471.411528047,647.230762026],[0.699371757,0.003098078,0.006552088,-0.714721357],[-1,0,0,4],[-132.382826108,9E+09,9E+09,9E+09,9E+09,9E+09]];
	
    CONST robtarget pHandsUpL_10:=[[108.153567372,471.411547841,988.720364525],[0.699371728,0.003098049,0.006552252,-0.714721384],[0,-1,0,4],[-132.382818416,9E+09,9E+09,9E+09,9E+09,9E+09]];
	
    CONST robtarget pNoClueL_10:=[[116.844170561,567.745373907,549.176802943],[0.612414859,-0.27944775,-0.40047322,-0.621673705],[-1,0,0,5],[170.97345488,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget pNoClueL_20:=[[332.599072052,360.424339744,333.84998915],[0.323491568,-0.733582932,-0.040436016,-0.596300441],[-1,0,0,5],[100.391786771,9E+09,9E+09,9E+09,9E+09,9E+09]];

    CONST robtarget pGiveMeAHug10:=[[527.97,296.13,502.72],[0.151847,-0.178758,0.845099,-0.480413],[0,0,0,4],[-148.435,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pGiveMeAHug20:=[[405.40,271.24,496.02],[0.213733,-0.0269022,-0.854052,0.473487],[0,0,0,4],[-149.626,9E+09,9E+09,9E+09,9E+09,9E+09]];
    
    CONST robtarget pGoAway10:=[[201.45,40.13,222.49],[0.507555,0.594761,-0.385316,0.49008],[0,1,-1,4],[118.012,9E+09,9E+09,9E+09,9E+09,9E+09]];   
    CONST robtarget pGoAway20:=[[518.18,74.70,248.67],[0.288596,0.590195,-0.341764,0.671997],[-1,1,-1,4],[116.115,9E+09,9E+09,9E+09,9E+09,9E+09]];
    
    CONST robtarget pPowerfull10:=[[118.30,247.25,704.02],[0.422171,0.460914,0.546915,-0.556969],[-1,0,0,4],[179.781,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pPowerfull20:=[[245.96,143.00,310.92],[0.0443739,-0.318911,0.39353,-0.861081],[0,0,0,4],[112.918,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pPowerfull30:=[[252.00,-77.89,315.69],[0.488544,0.342198,-0.661481,0.454609],[-1,1,-1,4],[123.612,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pPowerfull40:=[[322.00,-67.67,364.23],[0.442195,0.413994,-0.46771,0.643677],[-1,1,-1,4],[123.892,9E+09,9E+09,9E+09,9E+09,9E+09]];
    
    CONST robtarget pExcited10:=[[283.05,206.57,132.91],[0.0344361,0.707983,-0.0555807,0.703197],[0,0,0,4],[118.262,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pExcited20:=[[282.98,206.60,184.63],[0.0343905,0.708084,-0.0557234,0.703086],[0,0,0,4],[118.259,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pExcited30:=[[327.61,77.77,391.45],[0.471456,0.494579,0.520471,-0.512085],[-1,1,0,4],[115.029,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pExcited40:=[[327.81,34.51,391.34],[0.471431,0.494263,0.520659,-0.512222],[-1,1,0,4],[115.022,9E+09,9E+09,9E+09,9E+09,9E+09]];
    
    CONST robtarget pScared10:=[[253.81,59.02,495.38],[0.715734,-0.00275996,-0.0560464,0.696115],[-1,0,-1,4],[114.586,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pScared20:=[[253.81,59.02,394.12],[0.715731,-0.00275244,-0.0560455,0.696118],[-1,0,-1,4],[114.588,9E+09,9E+09,9E+09,9E+09,9E+09]];
    
    CONST robtarget pHappy10:=[[139.69,626.34,927.43],[0.90409,-0.412355,0.0928741,-0.0629285],[0,0,0,6],[-47.2014,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pHappy20:=[[263.63,23.73,371.01],[0.080959,0.0864927,-0.709647,0.694526],[0,0,0,4],[-174.693,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pHappy30:=[[298.49,-216.51,440.95],[0.379184,0.0939631,-0.443299,0.806769],[-1,0,0,4],[153.776,9E+09,9E+09,9E+09,9E+09,9E+09]];
    

    PROC Home()
        MoveJ pHomeL_10,v1000,fine,Servo\WObj:=wobj0;
    ENDPROC
    
    PROC Anger()
        WaitSyncTask syncCommandStart, task_list\TimeOut:=5;
        MoveJ pAngerL_10,v1000,z40,Servo\WObj:=wobj0;
        MoveJ pAngerL_20,v1000,z40,Servo\WObj:=wobj0;
        MoveJ pAngerL_30,v1000,z40,Servo\WObj:=wobj0;
        MoveJ pAngerL_40,v1000,z40,Servo\WObj:=wobj0;
        MoveJ pAngerL_50,v1000,z40,Servo\WObj:=wobj0;
        MoveJ pAngerL_60,v1000,z40,Servo\WObj:=wobj0;
        MoveJ pAngerL_10,v1000,z40,Servo\WObj:=wobj0;
		Home;
    ERROR
        RAISE;
    ENDPROC
    
    PROC Contempt()
        WaitSyncTask syncCommandStart, task_list\TimeOut:=5;
        MoveJ pContemptL_10,v1000,fine,Servo\WObj:=wobj0;
        WaitTime 2;
		Home;
    ERROR
        RAISE;
    ENDPROC
    
    PROC ToDiss()
        WaitSyncTask syncCommandStart, task_list\TimeOut:=5;
        MoveJ pToDissL_10,v1000,z10,Servo\WObj:=wobj0;
        MoveJ pToDissL_20,v1000,z10,Servo\WObj:=wobj0;
        MoveJ pToDissL_30,v1000,z10,Servo\WObj:=wobj0;
        MoveJ pToDissL_40,v1000,z10,Servo\WObj:=wobj0;
        MoveJ pToDissL_50,v1000,fine,Servo\WObj:=wobj0;
        WaitSyncTask syncToDiss, task_list;
        WaitTime 1;
		Home;
    ERROR
        RAISE;
    ENDPROC
    
    PROC Suprised()
        WaitSyncTask syncCommandStart, task_list\TimeOut:=5;
	    MoveJ pSuprisedL_10,v5000,fine,Servo\WObj:=wobj0;
        WaitTime 2;
	    Home;
    ERROR
        RAISE;
	ENDPROC
    
	PROC HandsUp()
        WaitSyncTask syncCommandStart, task_list\TimeOut:=5;
	    MoveJ pHandsUpL_10,v1000,fine,Servo\WObj:=wobj0;
        WaitTime 2;
	    Home;
    ERROR
        RAISE;
	ENDPROC
    
    PROC HandUp()
        !WaitSyncTask syncCommandStart,task_list\TimeOut:=5;
        MoveJ pHandsUpL_10,v1000,fine,Servo\WObj:=wobj0;
        !WaitTime 2;
        !Home;
    ERROR
        RAISE ;
    ENDPROC
    
	PROC NoClue()
        WaitSyncTask syncCommandStart, task_list\TimeOut:=5;
	    MoveJ pNoClueL_20,v1000,z10,Servo\WObj:=wobj0;
	    MoveJ pNoClueL_10,v1000,fine,Servo\WObj:=wobj0;
        WaitTime 2;
	    MoveJ pNoClueL_20,v1000,z10,Servo\WObj:=wobj0;
	    Home;
    ERROR
        RAISE;
	ENDPROC
    
    PROC GiveMeAHug()
        MoveJ pGiveMeAHug10, v1000, fine, Servo;
        WaitSyncTask syncGiveMeAHug, task_list;
        WaitTime 2;
        MoveJ pGiveMeAHug20, v1000, fine, Servo;
        MoveJ pGiveMeAHug10, v1000, fine, Servo;
        MoveJ pGiveMeAHug20, v1000, fine, Servo;
        MoveJ pGiveMeAHug10, v1000, fine, Servo;
        MoveJ pGiveMeAHug20, v1000, fine, Servo;
        MoveJ pGiveMeAHug10, v1000, fine, Servo;
        MoveJ pGiveMeAHug20, v1000, fine, Servo;
        WaitSyncTask syncGiveMeAHug1, task_list;
        WaitTime 2;
        Home;
    ERROR
        RAISE;
    ENDPROC
    
    PROC GoAway()
        WaitSyncTask syncCommandStart, task_list\TimeOut:=5;
        SyncMoveOn syncGoAway, task_list;
        MoveJ pGoAway10\ID:=10, v1000, fine, Servo;
        MoveJ pGoAway20\ID:=20, v1000, fine, Servo;
        MoveJ pGoAway10\ID:=30, v1000, fine, Servo;
        MoveJ pGoAway20\ID:=40, v1000, fine, Servo;
        MoveJ pGoAway10\ID:=50, v1000, fine, Servo;
        SyncMoveOff syncGoAway1;
        WaitSyncTask syncGoAway2, task_list;
        Home;
    ERROR
        RAISE;
    ENDPROC
    
    PROC Powerful()
        WaitSyncTask syncCommandStart, task_list\TimeOut:=5;
        MoveJ pPowerfull10, v1000, fine, Servo;
        WaitTime 2;
        MoveJ pPowerfull20, v1000, fine, Servo;
        WaitTime 2;
        MoveJ pPowerfull30, v1000, fine, Servo;
        MoveJ pPowerfull40, v1000, fine, Servo;
        MoveJ pPowerfull30, v1000, fine, Servo;
        MoveJ pPowerfull40, v1000, fine, Servo;
        MoveJ pPowerfull30, v1000, fine, Servo;
        MoveJ pPowerfull20, v1000, fine, Servo;
        WaitTime 2;
        WaitSyncTask syncPowerfull, task_list;
        Home;
    ERROR
        RAISE;
    ENDPROC
    
    PROC Happy()
        VAR num nCircleDiameter:=100;
        WaitSyncTask syncCommandStart, task_list\TimeOut:=5;
        MoveJ pHappy10, v1000, fine, Servo;
        WaitTime 1;
        WaitSyncTask syncHappy, task_list;
        MoveJ pHappy20, v1000, fine, Servo;
        
        SyncMoveOn syncHappy1, task_list;
        MoveC Offs(pHappy20,nCircleDiameter/2, 0, nCircleDiameter/2), Offs(pHappy20,nCircleDiameter, 0, 0)\ID:=10, v1000, z5, Servo;
        MoveC Offs(pHappy20,nCircleDiameter/2, 0, -nCircleDiameter/2), pHappy20\ID:=20, v1000, z5, Servo;
        MoveC Offs(pHappy20,nCircleDiameter/2, 0, nCircleDiameter/2), Offs(pHappy20,nCircleDiameter, 0, 0)\ID:=30, v1000, z5, Servo;
        MoveC Offs(pHappy20,nCircleDiameter/2, 0, -nCircleDiameter/2), pHappy20\ID:=40, v1000, z5, Servo;
        SyncMoveOff syncHappy2;
        
        MoveJ pHappy30, v1000, fine, Servo;
        WaitTime 2;
        WaitSyncTask syncHappy3, task_list;
        Home;
    ERROR
        RAISE;
    ENDPROC
    
    PROC Excited()
        WaitSyncTask syncCommandStart, task_list\TimeOut:=5;
        MoveJ pExcited10, v1000, fine, Servo;
        SyncMoveOn syncExcited, task_list;
        MoveJ pExcited20\ID:=10, v1000, z5, Servo;
        MoveJ pExcited10\ID:=20, v1000, z5, Servo;
        MoveJ pExcited20\ID:=30, v1000, z5, Servo;
        MoveJ pExcited10\ID:=40, v1000, z5, Servo;
        MoveJ pExcited20\ID:=50, v1000, z5, Servo;
        MoveJ pExcited10\ID:=60, v1000, fine, Servo;
        SyncMoveOff syncExcited1;
        WaitTime 1;
        MoveJ pExcited30, v1000, fine, Servo;
        WaitTime 0.5;
        SyncMoveOn syncExcited2, task_list;
        MoveJ pExcited40\ID:=10, v1000, z5, Servo;
        MoveJ pExcited30\ID:=20, v1000, z5, Servo;
        MoveJ pExcited40\ID:=30, v1000, z5, Servo;
        MoveJ pExcited30\ID:=40, v1000, z5, Servo;
        MoveJ pExcited40\ID:=50, v1000, z5, Servo;
        MoveJ pExcited30\ID:=60, v1000, fine, Servo;
        SyncMoveOff syncExcited3;
        WaitTime 2;
        Home;
    ERROR
        RAISE;
    ENDPROC
    
    PROC Scared()
        WaitSyncTask syncCommandStart, task_list\TimeOut:=5;
        MoveJ pScared10, v1000, fine, Servo;
        WaitTime 2;
        SyncMoveOn syncScared, task_list;
        MoveJ pScared20\ID:=10, v100, fine, Servo;
        MoveJ pScared10\ID:=20, v1000, fine, Servo;
        SyncMoveOff syncScared1;
        WaitTime 2;
        Home;
    ERROR
        RAISE;
    ENDPROC
ENDMODULE