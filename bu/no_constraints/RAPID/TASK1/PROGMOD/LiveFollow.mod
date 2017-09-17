MODULE LiveFollow
    
    TASK PERS num nXPos := 318;
    TASK PERS num nYPos := 28;
    TASK PERS num nZPos := 132;
    TASK PERS bool bLiveFollowActive := FALSE;
    TASK PERS bool bGotKinematicError := TRUE;
    TASK PERS bool bGripperState := TRUE;
    
    
    LOCAL VAR bool bOldGripperState := FALSE;
    LOCAL VAR robtarget pTestTarget :=  [[318, 28, 132],[0.0,-0.707,-0.707,0.0],[1,0,-2,4],[139.54,9E+09,9E+09,9E+09,9E+09,9E+09]];
    LOCAL VAR robtarget pOrig :=        [[318, 28, 132],[0.0,-0.707,-0.707,0.0],[1,0,-2,4],[139.54,9E+09,9E+09,9E+09,9E+09,9E+09]];

    
    VAR jointtarget jointpos1;
    PROC TryPosition()        
!        IF(nXPos<140) THEN
!            nXPos:=140;
!        ENDIF
!        IF(nXPos>610) THEN
!            nXPos:=610;
!        ENDIF
        pTestTarget.trans.x:=nXPos;
!        IF(nYPos<-350) THEN
!            nYPos:=-350;
!        ENDIF
!        IF(nYPos>250) THEN
!            nYPos:=250;
!        ENDIF
        pTestTarget.trans.y:=nYPos;
!        IF(nZPos<30) THEN
!            nZPos:=30;
!        ENDIF
!        IF(nZPos>560) THEN
!            nZPos:=560;
!        ENDIF
        pTestTarget.trans.z:=nZPos;        
        jointpos1 := CalcJointT (pTestTarget, Servo \WObj:=wobj0);
        MoveJ pTestTarget,v1000,fine,Servo\WObj:=wobj0;
    ERROR
        IF ERRNO = ERR_OUTSIDE_REACH THEN
            stAnswer:="Outside Reach.";
            bGotKinematicError := TRUE;
            !TRYNEXT;
            RETURN;
        ELSEIF ERRNO=ERR_ROBLIMIT THEN
            stAnswer:="Limit Reached.";
            bGotKinematicError := TRUE;
            !TRYNEXT;
            RETURN;
        ENDIF
    ENDPROC
    
 
    PROC StartLiveFollow()
        bLiveFollowActive := TRUE;
        bGotKinematicError := FALSE;
        MoveJ pOrig,v1000,fine,Servo\WObj:=wobj0;
        rGrServoOpen;
        nXPos:=318;
        nYPos:=28;
        nZPos:=132;
        WHILE bLiveFollowActive AND (NOT bGotKinematicError) DO  
            TryPosition;
            IF(bGripperState <> bOldGripperState) THEN
                IF bGripperState = TRUE THEN
                    rGrServoClose;
                ELSE
                    rGrServoOpen;
                ENDIF
                bOldGripperState:=bGripperState;
            ENDIF
        ENDWHILE
    ENDPROC
    
ENDMODULE