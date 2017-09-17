MODULE Remote
    TASK PERS bool bStart:=TRUE;
    TASK PERS bool bRunning:=FALSE;

    TASK PERS string stName:="Home";
    TASK PERS string stAnswer:="Command not known! Please try again.";


    PROC Init()
        bStart:=FALSE;
        bRunning:=FALSE;
        
        !Check if system is virtual
        bSimulation:=NOT RobOS();
        
        rGrInit;
        rGrServoClose;
    ENDPROC

    PROC RunLoop()
        WHILE TRUE DO
            IF bFPcommandInput ManualUserInput;
            
            WaitUntil bStart;
                       
            bRunning:=TRUE;
            bStart:=FALSE;
            %stName%;
            bRunning:=FALSE;
        ENDWHILE
    ERROR
        IF ERRNO = ERR_REFUNKPRC THEN
            stAnswer:="Command not known! Please try again.";
            TRYNEXT;
        ELSEIF ERRNO=ERR_WAITSYNCTASK  THEN
            stAnswer:="Task L not ready. Please try again.";
            TRYNEXT;
        ENDIF
    ENDPROC
ENDMODULE