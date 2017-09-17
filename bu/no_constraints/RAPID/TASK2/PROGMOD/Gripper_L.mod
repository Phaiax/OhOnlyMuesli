MODULE Gripper_L
    !***********************************************
    ! AUTHOR     : Roland Richner, ABB Switzerland AG
    ! DATE       : 2016_01_12
    !******************** declarations ********************

    PERS tooldata Servo:=[TRUE,[[0,0,114.2],[1,0,0,0]],[0.24,[8.2,12.5,48.1],[1,0,0,0],0.00022,0.00024,0.00009]];
    PERS tooldata VaccumOne:=[TRUE,[[56,18.5,37.5],[0.707106781,0,0.707106781,0]],[0.24,[8.2,12.5,48.1],[1,0,0,0],0.00022,0.00024,0.00009]];
    PERS tooldata Camera:=[TRUE,[[-7.3,28.3,35.1],[0.5,-0.5,0.5,0.5]],[0.24,[8.2,12.5,48.1],[1,0,0,0],0.00022,0.00024,0.00009]];

    PROC rGrInit()
        IF NOT bSimulation THEN
            SetDO flange_24V_ROB_L,1;
            WaitTime 0.2;
            Hand_Initialize\maxSpd:=12\holdForce:=15\Calibrate;
            WaitTime 0.2;
            Hand_GripOutward;
            Hand_Stop;
            WaitTime 0.2;
            GripLoad load0;
            Hand_SetMaxSpeed 25;
            Hand_SetHoldForce 20;
        ENDIF
    ENDPROC

    PROC rGrVacuumOn()
        !WaitTime 0.2;
        SetDO hand_CmdVacuum1_L,1;
        WaitTime 0.5;
    ENDPROC

    PROC rGrVacuumOff()
        !WaitTime 0.2;
        SetDO hand_CmdVacuum1_L,0;
        SetDO hand_CmdBlowoff1_L,1;
        WaitTime 0.02;
        SetDO hand_CmdBlowoff1_L,0;
        WaitTime 0.5;
    ENDPROC

    PROC rGrServoClose()
        IF bSimulation THEN
            Reset soGripperL_Open;
            PulseDO soGripperL_Close;
        ELSE
            Hand_GripInward;
        ENDIF
    ENDPROC

    PROC rGrServoOpen()
        IF bSimulation THEN
            Reset soGripperL_Close;
            PulseDO soGripperL_Open;
        ELSE
            Hand_MoveTo 22;
        ENDIF
    ENDPROC

    PROC rGrTest()
        IF bSimulation THEN
            Reset soGripperL_Open;
            Reset soGripperL_Close;
            PulseDO soGripperL_Open;
            WaitTime 1;
            PulseDO soGripperL_Close;
            WaitTime 1;
            PulseDO soGripperL_Open;
            WaitTime 1;
            PulseDO soGripperL_Close;
        ELSE
            WaitTime 1;
            Hand_SetMaxSpeed 5;
            Hand_MoveTo 0;
            Hand_MoveTo 22;
            WaitTime 1;
            Hand_SetMaxSpeed 15;
            Hand_MoveTo 0;
            Hand_MoveTo 22;
            WaitTime 1;
            Hand_SetMaxSpeed 25;
            Hand_MoveTo 0;
            Hand_MoveTo 22;
            WaitTime 1;
            RETURN ;
            Hand_DoCalibrate;
            Hand_GripOutward;
            Hand_MoveTo 0;
            Hand_SetMaxSpeed 0;
            Hand_GripInward;
            Hand_Initialize;
            Hand_SetHoldForce 0;
            Hand_Stop;
            ! Air 1
            Hand_TurnOnVacuum1;
            Hand_TurnOffVacuum1;
            WaitTime 1;
            Hand_TurnOnBlow1;
            Hand_TurnOffBlow1;
            WaitTime 1;
            ! Air 2
            Hand_TurnOnVacuum2;
            Hand_TurnOffVacuum2;
            WaitTime 1;
            Hand_TurnOnBlow2;
            Hand_TurnOffBlow2;
            WaitTime 1;
        ENDIF
    ENDPROC
ENDMODULE
