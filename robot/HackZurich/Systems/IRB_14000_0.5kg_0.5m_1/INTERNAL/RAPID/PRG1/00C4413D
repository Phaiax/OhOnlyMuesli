MODULE MainModule
    TASK PERS bool bSimulation:=TRUE;
        
    PERS tasks task_list{2}:= [["T_ROB_R"], ["T_ROB_L"]];

    TASK PERS bool bFPcommandInput:=FALSE;
    CONST listitem lstCommandlist{18} := [ 
        ["","Home"], 
        ["","Contempt"],
        ["","Kiss"],
        ["","NoClue"],
        ["","SayHello"],
        ["","ShakingHands"],
        ["","HandsUp"],
        ["","SayNo"],
        ["","Suprised"],
        ["","ToDiss"],
        ["","Anger"],
        ["","Excited"],
        ["","GiveMeAHug"],
        ["","GoAway"],
        ["","Happy"],
        ["","IKillYou"],
        ["","Powerfull"],
        ["","Scared"]
        ];
        
    ! This procedure is the entry point when starting a simulation.
    PROC main()
        Init;
        Home;
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