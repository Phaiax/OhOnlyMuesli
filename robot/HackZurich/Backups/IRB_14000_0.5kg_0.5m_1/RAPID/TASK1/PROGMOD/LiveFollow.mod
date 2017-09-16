MODULE LiveFollow
    
    TASK PERS num nXPos := 990;
    TASK PERS num nYPos := 0.0;
    TASK PERS bool bLiveFollowActive := FALSE;
    TASK PERS bool bGotKinematicError := TRUE;
    
    LOCAL VAR robtarget pTestTarget :=[[314.699715633,-292.148031152,367.159687256],[0.159532666,0.511489136,0.162496176,0.828566947],[1,0,0,5],[-122.185137209,9E+09,9E+09,9E+09,9E+09,9E+09]];
    LOCAL VAR robtarget pOrig :=[[314.699715633,-292.148031152,367.159687256],[0.159532666,0.511489136,0.162496176,0.828566947],[1,0,0,5],[-122.185137209,9E+09,9E+09,9E+09,9E+09,9E+09]];

    
    VAR jointtarget jointpos1;
    PROC TryPosition(num xpos)
        pTestTarget.trans.x:=nXPos+314;
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
        WHILE bLiveFollowActive AND (NOT bGotKinematicError) DO  
            TryPosition(nXPos);
        ENDWHILE
    ENDPROC
    
ENDMODULE