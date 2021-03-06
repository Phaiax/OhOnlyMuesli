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

    CONST robtarget Target_10:=[[314.699715633,-292.148031152,367.159687256],[0.159532666,0.511489136,0.162496176,0.828566947],[1,0,0,5],[-122.185137209,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_20:=[[143.244207362,-303.049195945,660.697114826],[0.6530857,-0.147210566,0.221457786,0.70905893],[1,0,0,5],[154.264930282,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_30:=[[235.909258765,-382.383017558,818.803192241],[0.490338864,0.057638645,0.190726209,0.848450999],[1,0,0,5],[-161.185793796,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_40:=[[223.935861995,-152.493872643,837.018526473],[0.280171534,-0.02496644,0.413534074,0.865950436],[1,0,0,5],[-151.318897483,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_50:=[[164.121226093,1.97602582,802.916853322],[0.202263762,-0.511536601,0.520846089,0.65279325],[0,0,0,4],[-173.792654192,9E+09,9E+09,9E+09,9E+09,9E+09]];

    CONST robtarget pKissR_10:=[[221.654761882,15.032417216,486.855961247],[0.69462356,-0.026998762,-0.017404571,0.718655868],[1,0,-2,4],[-163.076395011,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pKissR_20:=[[354.929073971,15.031772271,486.855510206],[0.677332175,0.151651856,0.155002452,0.702991521],[1,1,-2,4],[-128.711073694,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pKissR_30:=[[431.669236847,15.031318104,443.566889626],[0.639190619,0.273714512,0.272469802,0.665038289],[1,1,-2,4],[-128.711078258,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pKissR_40:=[[305.18930413,-24.552371649,335.517713502],[0.817106929,-0.136325958,0.414031132,0.377266114],[1,0,-2,4],[-146.11021025,9E+09,9E+09,9E+09,9E+09,9E+09]];

    CONST robtarget pSayHelloR_10:=[[314.699715633,-292.148031152,367.159687256],[0.159532666,0.511489136,0.162496176,0.828566947],[1,0,0,5],[-122.185137209,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pSayHelloR_20:=[[143.244207362,-303.049195945,660.697114826],[0.6530857,-0.147210566,0.221457786,0.70905893],[1,0,0,5],[154.264930282,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pSayHelloR_30:=[[235.909258765,-382.383017558,818.803192241],[0.490338864,0.057638645,0.190726209,0.848450999],[1,0,0,5],[-161.185793796,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pSayHelloR_40:=[[223.935861995,-152.493872643,837.018526473],[0.280171534,-0.02496644,0.413534074,0.865950436],[1,0,0,5],[-151.318897483,9E+09,9E+09,9E+09,9E+09,9E+09]];

    CONST robtarget pNoClueR_20:=[[331.005027183,-415.055262019,240.258080351],[0.395586627,0.754614135,0.446136315,0.273918084],[0,0,0,5],[-121.777862862,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pNoClueR_10:=[[160.547655799,-566.897146043,554.058433096],[0.765286197,0.45290272,-0.146899327,0.433170579],[1,0,0,5],[169.961367293,9E+09,9E+09,9E+09,9E+09,9E+09]];

    CONST robtarget pHomeR_10:=[[89.387946422,-156.622117956,147.913470217],[0.066010726,-0.842420918,-0.111214912,-0.523068661],[0,0,0,4],[-101.964427132,9E+09,9E+09,9E+09,9E+09,9E+09]];

    CONST robtarget pShakingHandsR_10:=[[315.738569474,-225.378667241,206.19666017],[0.339537865,-0.658753284,0.219946518,-0.63433562],[0,0,1,4],[-108.735165241,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pShakingHandsR_40:=[[440.955889424,-225.380066174,182.362206426],[0.11092253,0.699479671,0.098185544,0.699130876],[1,1,-1,4],[-108.735179691,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pShakingHandsR_20:=[[440.955617046,-225.379654836,237.561937878],[0.110922498,0.699479548,0.098185209,0.699131051],[1,2,-1,4],[-108.735186134,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pShakingHandsR_30:=[[440.955691509,-225.379895287,135.696714265],[0.110922513,0.699479626,0.098185285,0.69913096],[1,1,-1,4],[-108.735178424,9E+09,9E+09,9E+09,9E+09,9E+09]];

    CONST robtarget pAngerR_10:=[[363.531838424,-38.636637831,473.352200394],[0.300745531,-0.136482013,-0.04783233,-0.94267537],[1,0,0,4],[-130.403991592,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pAngerR_20:=[[350.75125662,-29.515051373,503.763471562],[0.257706669,0.015454476,-0.043694396,-0.965110995],[1,0,0,4],[-121.508331805,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pAngerR_30:=[[306.632986283,-52.601439571,528.928808016],[0.261410738,0.064341961,-0.04557113,-0.96200198],[1,0,0,4],[-122.099256333,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pAngerR_40:=[[288.800844629,-81.29752225,478.773158089],[0.216079199,-0.014900154,-0.132940712,-0.967168306],[1,0,0,4],[-129.63023687,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pAngerR_50:=[[297.418539835,-81.958124122,428.713986694],[0.109438137,-0.189120514,-0.255285462,-0.941852461],[1,0,0,4],[-136.020526211,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pAngerR_60:=[[354.350248531,-52.04234992,430.466884854],[0.177313873,-0.133250362,-0.160013373,-0.961873096],[1,0,0,4],[-129.960312977,9E+09,9E+09,9E+09,9E+09,9E+09]];

    CONST robtarget pContemptR_10:=[[-65.408295514,-231.499226874,119.303275828],[0.188476781,-0.180789855,-0.941418807,0.213359232],[1,0,-1,5],[-169.723005722,9E+09,9E+09,9E+09,9E+09,9E+09]];

    CONST robtarget pToDissR_10:=[[310.08261334,-191.393706007,305.466074161],[0.673664037,0.094173277,0.328608316,0.655228765],[1,0,-1,4],[-103.279379297,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pToDissR_20:=[[370.062778661,-109.65260016,473.851053749],[0.666629844,-0.160646787,-0.045141606,0.726470575],[1,0,-1,4],[-103.911686462,9E+09,9E+09,9E+09,9E+09,9E+09]];

    CONST robtarget pSuprisedR_10:=[[83.03148877,-465.085929834,650.386646622],[0.703838382,-0.01527703,0.013249227,-0.710072252],[1,0,-2,4],[115.639447021,9E+09,9E+09,9E+09,9E+09,9E+09]];

    CONST robtarget pHandsUpR_10:=[[83.03187344,-465.085940939,952.690090127],[0.703838421,-0.015277226,0.013249253,-0.710072208],[0,1,-2,4],[137.877026865,9E+09,9E+09,9E+09,9E+09,9E+09]];

    CONST robtarget pSayNoR_10:=[[359.801557873,36.119395579,442.32851368],[0.724497161,0.007725768,-0.00165855,-0.68923249],[1,0,0,4],[-143.857840595,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pSayNoR_20:=[[359.802142459,93.128614528,426.773071438],[0.708401181,-0.152065476,-0.153449882,-0.671935259],[1,0,0,4],[-143.857842721,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pSayNoR_30:=[[359.802673586,-61.261892837,415.421024536],[0.687551152,0.228536622,0.208835913,-0.656834824],[1,0,0,4],[-143.857842589,9E+09,9E+09,9E+09,9E+09,9E+09]];

    CONST jointtarget JointTarget_3:=[[5.435483871,-60.25483871,20.919354839,150.895790314,17.687340054,-159.437228739],[57.616129032,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST jointtarget JointTarget_4:=[[29.560965021,-41.462551121,-79.294754901,150.895790314,17.687340054,-159.437228739],[57.616129032,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST jointtarget JointTarget_1:=[[44.570967742,-88.003225806,2.538709677,0,39.999998836,0],[-79.358064516,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST jointtarget JointTarget_2:=[[62.386456105,-93.54618891,41.493211378,150.895790314,17.687340054,-159.437228739],[-93.969401092,9E+09,9E+09,9E+09,9E+09,9E+09]];

    CONST robtarget pIKillYou10:=[[374.16,-154.35,254.16],[0.161557,0.694401,0.0894066,0.695495],[1,1,-1,4],[-117.393,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pIKillYou20:=[[488.56,-144.83,314.81],[0.000395089,-0.719169,-0.00618865,-0.694808],[1,2,-2,4],[-101.713,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pIKillYou30:=[[196.92,127.33,379.19],[0.180402,0.188619,-0.483007,-0.835812],[1,1,-2,5],[-129.125,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pIKillYou40:=[[197.77,-80.86,359.78],[0.278102,0.15155,-0.466809,-0.8257],[1,2,-2,5],[-126.747,9E+09,9E+09,9E+09,9E+09,9E+09]];

    CONST robtarget pGiveMeAHug10:=[[509.34,-328.38,480.34],[0.155829,0.0974494,0.882897,0.432104],[0,0,0,4],[155.094,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pGiveMeAHug20:=[[393.96,-310.78,474.19],[0.193899,0.0762726,-0.873009,-0.440955],[0,0,0,4],[156.47,9E+09,9E+09,9E+09,9E+09,9E+09]];

    CONST robtarget pGoAway10:=[[197.61,-52.80,224.96],[0.499064,-0.586453,-0.400827,-0.496333],[0,-1,1,4],[-116.88,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pGoAway20:=[[514.65,-111.17,249.33],[0.259577,-0.6352,-0.212178,-0.695788],[1,-1,1,4],[-120.721,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pGoAway30:=[[317.99,-135.96,207.81],[0.221309,-0.723273,-0.258737,-0.600794],[0,-1,1,4],[-117.948,9E+09,9E+09,9E+09,9E+09,9E+09]];

    CONST robtarget pPowerfull10:=[[140.08,-238.76,738.33],[0.454908,-0.375862,0.550802,0.590257],[1,0,0,4],[173.484,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pPowerfull20:=[[353.35,-118.73,464.57],[0.235961,-0.363756,-0.103651,0.895131],[1,0,0,4],[-87.9474,9E+09,9E+09,9E+09,9E+09,9E+09]];

    CONST robtarget pExcited10:=[[275.33,-202.51,129.63],[0.0269036,-0.723872,-0.129753,-0.677089],[0,0,0,4],[-106.838,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pExcited20:=[[275.24,-202.41,186.57],[0.0270641,-0.723988,-0.12976,-0.676958],[0,0,0,4],[-106.853,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pExcited30:=[[323.93,-65.42,387.99],[0.517684,-0.471011,0.505859,0.50424],[1,-1,-1,4],[-106.11,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pExcited40:=[[325.27,-16.87,386.93],[0.51709,-0.469045,0.507547,0.504986],[1,-1,0,4],[-106.069,9E+09,9E+09,9E+09,9E+09,9E+09]];

    CONST robtarget pScared10:=[[245.99,-54.68,490.90],[0.711197,-0.0374195,-0.0510866,0.700135],[1,0,-1,4],[-114.575,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pScared20:=[[246.96,-54.06,395.22],[0.711164,-0.0365424,-0.0478151,0.700446],[1,0,-1,4],[-114.624,9E+09,9E+09,9E+09,9E+09,9E+09]];

    CONST robtarget pHappy10:=[[270.72,174.42,416.02],[0.424616,-0.16407,-0.415377,-0.787556],[1,0,0,4],[-156.077,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pHappy20:=[[362.98,-54.19,373.08],[0.14727,-0.120428,-0.717561,-0.670012],[0,0,0,4],[174.558,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pHappy30:=[[137.55,-675.50,871.93],[0.696123,0.382261,0.348089,-0.49812],[0,0,0,6],[50.4932,9E+09,9E+09,9E+09,9E+09,9E+09]];

    PROC Home()
        MoveJ pHomeR_10,v1000,fine,Servo\WObj:=wobj0;
    ENDPROC

    PROC SayHello()
        MoveJ pSayHelloR_10,v1000,z10,Servo\WObj:=wobj0;
        MoveJ pSayHelloR_20,v1000,z10,Servo\WObj:=wobj0;
        MoveJ pSayHelloR_30,v400,z10,Servo\WObj:=wobj0;
        MoveJ pSayHelloR_40,v400,z10,Servo\WObj:=wobj0;
        MoveJ pSayHelloR_30,v400,z10,Servo\WObj:=wobj0;
        MoveJ pSayHelloR_40,v400,z10,Servo\WObj:=wobj0;
        MoveJ pSayHelloR_40,v400,z10,Servo\WObj:=wobj0;
        MoveJ pSayHelloR_30,v400,z10,Servo\WObj:=wobj0;
        MoveJ pSayHelloR_20,v1000,z10,Servo\WObj:=wobj0;
        MoveJ pSayHelloR_10,v1000,z10,Servo\WObj:=wobj0;
        Home;
    ERROR
        RAISE ;
    ENDPROC

    PROC NoClue()
        WaitSyncTask syncCommandStart,task_list\TimeOut:=5;
        MoveJ pNoClueR_20,v1000,z10,Servo\WObj:=wobj0;
        MoveJ pNoClueR_10,v1000,fine,Servo\WObj:=wobj0;
        WaitTime 2;
        MoveJ pNoClueR_20,v1000,z10,Servo\WObj:=wobj0;
        Home;
    ERROR
        RAISE ;
    ENDPROC

    PROC ShakingHands()
        MoveJ pShakingHandsR_10,v1000,z10,Servo\WObj:=wobj0;
        MoveJ pShakingHandsR_40,v1000,z10,Servo\WObj:=wobj0;
        WaitTime 1;
        MoveJ pShakingHandsR_20,v1000,z10,Servo\WObj:=wobj0;
        MoveJ pShakingHandsR_30,v1000,z10,Servo\WObj:=wobj0;
        MoveJ pShakingHandsR_20,v1000,z10,Servo\WObj:=wobj0;
        MoveJ pShakingHandsR_30,v1000,z10,Servo\WObj:=wobj0;
        MoveJ pShakingHandsR_20,v1000,z10,Servo\WObj:=wobj0;
        MoveJ pShakingHandsR_30,v1000,z10,Servo\WObj:=wobj0;
        MoveJ pShakingHandsR_40,v1000,z10,Servo\WObj:=wobj0;
        WaitTime 1;
        Home;
    ERROR
        RAISE ;
    ENDPROC

    PROC Anger()
        WaitSyncTask syncCommandStart,task_list\TimeOut:=5;
        MoveJ pAngerR_10,v1000,z40,Servo\WObj:=wobj0;
        MoveJ pAngerR_20,v1000,z40,Servo\WObj:=wobj0;
        MoveJ pAngerR_30,v1000,z40,Servo\WObj:=wobj0;
        MoveJ pAngerR_40,v1000,z40,Servo\WObj:=wobj0;
        MoveJ pAngerR_50,v1000,z40,Servo\WObj:=wobj0;
        MoveJ pAngerR_60,v1000,z40,Servo\WObj:=wobj0;
        MoveJ pAngerR_10,v1000,z40,Servo\WObj:=wobj0;
        Home;
    ERROR
        RAISE ;
    ENDPROC

    PROC Contempt()
        WaitSyncTask syncCommandStart,task_list\TimeOut:=5;
        MoveJ pContemptR_10,v1000,fine,Servo\WObj:=wobj0;
        WaitTime 2;
        Home;
    ERROR
        RAISE ;
    ENDPROC

    PROC ToDiss()
        rGrServoClose;
        WaitSyncTask syncCommandStart,task_list\TimeOut:=5;
        MoveJ pToDissR_10,v500,z10,Servo\WObj:=wobj0;
        MoveJ pToDissR_20,v500,fine,Servo\WObj:=wobj0;
        WaitSyncTask syncToDiss,task_list;
        WaitTime 1;
        Home;
    ERROR
        RAISE ;
    ENDPROC

    PROC Kiss()
        rGrServoClose;
        MoveJ pKissR_10,v1000,z10,Servo\WObj:=wobj0;
        MoveJ pKissR_20,v1000,z10,Servo\WObj:=wobj0;
        MoveJ pKissR_30,v1000,z10,Servo\WObj:=wobj0;
        MoveJ pKissR_40,v1000,fine,Servo\WObj:=wobj0;
        Home;
    ERROR
        RAISE ;
    ENDPROC

    PROC Suprised()
        WaitSyncTask syncCommandStart,task_list\TimeOut:=5;
        MoveJ pSuprisedR_10,v5000,fine,Servo\WObj:=wobj0;
        WaitTime 2;
        Home;
    ERROR
        RAISE ;
    ENDPROC

    PROC HandsUp()
        WaitSyncTask syncCommandStart,task_list\TimeOut:=5;
        MoveJ pHandsUpR_10,v1000,fine,Servo\WObj:=wobj0;
        WaitTime 2;
        Home;
    ERROR
        RAISE ;
    ENDPROC

    PROC HandUp()
        !WaitSyncTask syncCommandStart,task_list\TimeOut:=5;
        MoveJ pHandsUpR_10,v1000,fine,Servo\WObj:=wobj0;
        !WaitTime 2;
        !Home;
    ERROR
        RAISE ;
    ENDPROC
    
    PROC SayNo()
        rGrServoClose;
        MoveJ pSayNoR_10,v1000,z10,Servo\WObj:=wobj0;
        MoveJ pSayNoR_20,v1000,z10,Servo\WObj:=wobj0;
        MoveJ pSayNoR_10,v1000,z10,Servo\WObj:=wobj0;
        MoveJ pSayNoR_30,v1000,z10,Servo\WObj:=wobj0;
        MoveJ pSayNoR_10,v1000,z10,Servo\WObj:=wobj0;
        MoveJ pSayNoR_20,v1000,z10,Servo\WObj:=wobj0;
        MoveJ pSayNoR_10,v1000,z10,Servo\WObj:=wobj0;
        MoveJ pSayNoR_30,v1000,z10,Servo\WObj:=wobj0;
        MoveJ pSayNoR_10,v1000,z10,Servo\WObj:=wobj0;
        MoveJ pSayNoR_20,v1000,z10,Servo\WObj:=wobj0;
        MoveJ pSayNoR_10,v1000,z10,Servo\WObj:=wobj0;
        MoveJ pSayNoR_30,v1000,z10,Servo\WObj:=wobj0;
        MoveJ pSayNoR_10,v1000,z10,Servo\WObj:=wobj0;
        Home;
    ERROR
        RAISE ;
    ENDPROC

    PROC IKillYou()
        MoveJ pIKillYou10,v300,z10,Servo;
        MoveJ pIKillYou20,v1000,fine,Servo;
        WaitTime 2;
        MoveJ pIKillYou30,v1000,z10,Servo;
        MoveL pIKillYou40,v100,fine,Servo;
        WaitTime 2;
        Home;
    ERROR
        RAISE ;
    ENDPROC

    PROC GiveMeAHug()
        MoveJ pGiveMeAHug10,v1000,fine,Servo;
        WaitSyncTask syncGiveMeAHug,task_list;
        WaitTime 2;
        MoveJ pGiveMeAHug20,v1000,fine,Servo;
        MoveJ pGiveMeAHug10,v1000,fine,Servo;
        MoveJ pGiveMeAHug20,v1000,fine,Servo;
        MoveJ pGiveMeAHug10,v1000,fine,Servo;
        MoveJ pGiveMeAHug20,v1000,fine,Servo;
        MoveJ pGiveMeAHug10,v1000,fine,Servo;
        MoveJ pGiveMeAHug20,v1000,fine,Servo;
        WaitSyncTask syncGiveMeAHug1,task_list;
        WaitTime 2;
        Home;
    ERROR
        RAISE ;
    ENDPROC

    PROC GoAway()
        WaitSyncTask syncCommandStart,task_list\TimeOut:=5;
        SyncMoveOn syncGoAway,task_list;
        MoveJ pGoAway10\ID:=10,v1000,fine,Servo;
        MoveJ pGoAway20\ID:=20,v1000,fine,Servo;
        MoveJ pGoAway10\ID:=30,v1000,fine,Servo;
        MoveJ pGoAway20\ID:=40,v1000,fine,Servo;
        MoveJ pGoAway10\ID:=50,v1000,fine,Servo;
        SyncMoveOff syncGoAway1;
        WaitTIme 2;
        MoveJ pGoAway30,v1000,fine,Servo;
        MoveJ pGoAway10,v1000,fine,Servo;
        MoveJ pGoAway30,v1000,fine,Servo;
        MoveJ pGoAway10,v1000,fine,Servo;
        WaitTime 2;
        WaitSyncTask syncGoAway2,task_list;
        Home;
    ERROR
        RAISE ;
    ENDPROC

    PROC Powerful()
        WaitSyncTask syncCommandStart,task_list\TimeOut:=5;
        MoveJ pPowerfull10,v1000,fine,Servo;
        WaitTime 2;
        MoveJ pPowerfull20,v1000,fine,Servo;
        WaitSyncTask syncPowerfull,task_list;
        Home;
    ERROR
        RAISE ;
    ENDPROC

    PROC Happy()
        VAR num nCircleDiameter:=100;
        WaitSyncTask syncCommandStart,task_list\TimeOut:=5;
        MoveJ pHappy10,v1000,fine,Servo;
        WaitTime 1;
        WaitSyncTask syncHappy,task_list;
        MoveJ pHappy20,v1000,fine,Servo;

        SyncMoveOn syncHappy1,task_list;
        MoveC Offs(pHappy20,-nCircleDiameter/2,0,-nCircleDiameter/2),Offs(pHappy20,-nCircleDiameter,0,0)\ID:=10,v1000,z5,Servo;
        MoveC Offs(pHappy20,-nCircleDiameter/2,0,nCircleDiameter/2),pHappy20\ID:=20,v1000,z5,Servo;
        MoveC Offs(pHappy20,-nCircleDiameter/2,0,-nCircleDiameter/2),Offs(pHappy20,-nCircleDiameter,0,0)\ID:=30,v1000,z5,Servo;
        MoveC Offs(pHappy20,-nCircleDiameter/2,0,nCircleDiameter/2),pHappy20\ID:=40,v1000,z5,Servo;
        SyncMoveOff syncHappy2;

        MoveJ pHappy30,v1000,fine,Servo;
        WaitTime 2;
        WaitSyncTask syncHappy3,task_list;
        Home;
    ERROR
        RAISE ;
    ENDPROC

    PROC Excited()
        WaitSyncTask syncCommandStart,task_list\TimeOut:=5;
        MoveJ pExcited10,v1000,fine,Servo;
        SyncMoveOn syncExcited,task_list;
        MoveJ pExcited20\ID:=10,v1000,z5,Servo;
        MoveJ pExcited10\ID:=20,v1000,z5,Servo;
        MoveJ pExcited20\ID:=30,v1000,z5,Servo;
        MoveJ pExcited10\ID:=40,v1000,z5,Servo;
        MoveJ pExcited20\ID:=50,v1000,z5,Servo;
        MoveJ pExcited10\ID:=60,v1000,fine,Servo;
        SyncMoveOff syncExcited1;
        WaitTime 1;
        MoveJ pExcited30,v1000,fine,Servo;
        WaitTime 0.5;
        SyncMoveOn syncExcited2,task_list;
        MoveJ pExcited40\ID:=10,v1000,z5,Servo;
        MoveJ pExcited30\ID:=20,v1000,z5,Servo;
        MoveJ pExcited40\ID:=30,v1000,z5,Servo;
        MoveJ pExcited30\ID:=40,v1000,z5,Servo;
        MoveJ pExcited40\ID:=50,v1000,z5,Servo;
        MoveJ pExcited30\ID:=60,v1000,fine,Servo;
        SyncMoveOff syncExcited3;
        WaitTime 2;
        Home;
    ERROR
        RAISE ;
    ENDPROC

    PROC Scared()
        WaitSyncTask syncCommandStart,task_list\TimeOut:=5;
        MoveJ pScared10,v1000,fine,Servo;
        WaitTime 2;
        SyncMoveOn syncScared,task_list;
        MoveJ pScared20\ID:=10,v100,fine,Servo;
        MoveJ pScared10\ID:=20,v1000,fine,Servo;
        SyncMoveOff syncScared1;
        WaitTime 2;
        Home;
    ERROR
        RAISE ;
    ENDPROC
ENDMODULE