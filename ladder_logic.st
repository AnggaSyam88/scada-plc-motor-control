PROGRAM main
  VAR
    TON0 : TON;
  END_VAR
  VAR
    Start_Cmd AT %QX0.2 : BOOL;
    Fault_Status AT %QX0.3 : BOOL;
    Motor_1_Out AT %QX0.0 : BOOL;
    Motor_2_Out AT %QX0.1 : BOOL;
    Encoder_Speed AT %MW0 : INT;
  END_VAR

  Motor_1_Out := Start_Cmd;
  TON0(IN := Motor_1_Out, PT := T#5s);
  Motor_2_Out := NOT(Fault_Status) AND TON0.Q;
END_PROGRAM


CONFIGURATION Config0

  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#20ms,PRIORITY := 1);
    PROGRAM instance0 WITH task0 : main;
  END_RESOURCE
END_CONFIGURATION
