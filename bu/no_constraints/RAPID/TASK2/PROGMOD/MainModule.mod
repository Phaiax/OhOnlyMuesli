MODULE MainModule
    TASK PERS bool bSimulation:=TRUE;
        
    PERS tasks task_list{2};

    TASK PERS bool bFPcommandInput:=FALSE;
    CONST listitem lstCommandlist{14} := [ 
        ["","Home"], 
        ["","Contempt"],
        ["","Kiss"],
        ["","No Clue"],
        ["","Hands Up"],
        ["","Suprised"],
        ["","To Diss"],
        ["","Anger"],
        ["","Excited"],
        ["","Give Me A Hug"],
        ["","Go Away"],
        ["","Happy"],
        ["","Powerfull"],
        ["","Scared"]
        ];
        
    ! This procedure is the entry point when starting a simulation.
    PROC main()
        Init;
        RunLoop;
    ENDPROC
    
    PROC ManualUserInput()
        VAR num ListResult;
        VAR btnres button_answer;
        
        ListResult := UIListView (
            \Result:=button_answer
            \Header:="Select the command.",
            lstCommandList
            \Buttons:=btnOKCancel
            \Icon:=iconInfo
            \DefaultIndex:=1);
            
        IF button_answer=resOK THEN
            stName:=lstCommandList{ListResult}.text;
            bStart:=TRUE;
        ELSE
            bStart:=FALSE;
        ENDIF

    ENDPROC
ENDMODULE