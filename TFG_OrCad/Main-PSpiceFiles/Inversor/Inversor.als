.ALIASES
U_PWM           PWM(pin1=N03124 ) CN @MAIN.Inversor(sch_1):INS3283@SOURCE.STIM1.Normal(chips)
M_M1            M1(drain=N040710 gate=N03124 source=N04240 source=N04240 ) CN
+@MAIN.Inversor(sch_1):INS4059@EVAL.IRF9140.Normal(chips)
M_M2            M2(drain=N04240 gate=N03124 source=0 source=0 ) CN @MAIN.Inversor(sch_1):INS4088@EVAL.IRF150.Normal(chips)
V_V1            V1(+=N040710 -=0 ) CN @MAIN.Inversor(sch_1):INS4148@SOURCE.VDC.Normal(chips)
R_R1            R1(1=0 2=N03124 ) CN @MAIN.Inversor(sch_1):INS4309@ANALOG.R.Normal(chips)
.ENDALIASES
