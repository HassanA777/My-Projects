'!TITLE "Denso robot program"
'#define <constance> <Strings>

#define SystemAutoMode I1  'Key is in Auto position
#define SystemPowerOn I2   'Servo power is ON

#define RobotTaskStatus I5
'Light status: 0 - Off, 1 - Solid, 2 - Blinking
#define TowerLight_Green I6 
#define TowerLight_Yellow I7
#define TowerLight_Red I8

#define Product_Offset I11  'P100 - P199 
#define RobotTaskAutoStartEnable I12
#define RobotGripIDEnable I13 'If it is 0, simulated gripper status is used.

'#define RobotGrip
#define DimmPick_Settling I14
#define DimmPick_DwellTime I15
#define DimmPick_Decel I16
#define MB_MaxPath I17
#define WBeam_Area1_Delay I18
#define RobotGripSimID I19

#define IOPneumaticTimeout I20 'Default = 3000
#define PosMax I21 'The largest position allowed
#define SettlingTimeMotherboard I22 'Settling time for Motherboard placing
#define WorkOffset_Screw_W4 I23 'Contains work number parallel to Screw robot work coordinate for area 2.
#define WorkOffset_Screw_W6 I24 'Contains work number parallel to Screw robot work coordinate for area 3.
#define WorkOffset_Screw_W3 I25 'Contains work number parallel to Screw robot work coordinate for area 2 chassis.
#define Barcode_Timeout I26
#define HeatSinks_Settling I27
#define InputDebounce I28
#define Zone_Req_Timeout I29

#define RobotPartNotReady I30 'Not use
#define RobotScrewNotReady I31 'Net use
'When robot is sitting at the defined home position
'#define RobotPartAtHome I32 'This will be cleared when zone control is identified.
'#define RobotScrewAtHome I33 'This will be cleared when zone control is identified.
#define RobCom_Timer I34  'Robot to robot communication timer
#define RobCom_Timeout I35
#define Enable_Error_Display I36
#define Disable_Collision_Detection I37

#define Dimm_Pallet_Size I40
#define Monitor_Com_Lock I41
'#define Cmd_Com_Lock I42  'Not use
#define ZoneCtrl_2A_Lock I43
#define ZoneCtrl_2B_Lock I44
#define ZoneCtrl_3_Lock I45
#define TestTimer I46
#define FidRetryMax I47
'I[50] to I[59] are debug and simulation Integers
#define Sim_CPU_Gripper_Sensors I50
#define Sim_CPU_Gripper_Delay I51
#define Sim_Zone_Control I53

#define LOCJ_Home_AreaB 1
#define LOCJ_Home_Area2 2
#define LOCJ_Home_Area3 3
#define LOC_NestMax I101
#define LOC_NestMotherboard I102 'MB Gripper
#define LOC_NestCPUHeatSink I103 
#define LOC_NestSpare4 I104      'HS Gripper
#define LOC_NestSpare5 I105      ''CPU Gripper
#define LOC_NestSpare6 I106
#define LOC_NestDimm I107         'Dimm Gripper
#define LOC_NestSpare8 I108

'Offset from Part robot to Screw robot
#define LOC_Offset_Area_2_Chassis I109 'P109 - Can't be changed
#define LOC_Offset_Area_2 I110  'P110 - Can't be changed
#define LOC_Offset_Area_3 I111  'P111 - Can't be changed

#define LOC_ChassisBCR I120
#define LOC_PickMotherboard I123
#define LOC_PlaceMotherboard I124
#define LOC_PickDimmPallet1 I129
#define LOC_PickDimmPallet2 I130
#define LOC_PlaceDimm1 I131
#define LOC_PlaceDimm2 I132
#define LOC_PlaceDimm3 I133
#define LOC_PlaceDimm4 I134
#define LOC_PickCoverCPU1 I135
#define LOC_PickCoverCPU2 I136
#define LOC_PickCPU1 I139
#define LOC_PickCPU2 I140
#define LOC_PlaceCPU1 I141
#define LOC_PlaceCPU2 I142
#define LOC_PickHeatSink1 I143
#define LOC_PickHeatSink2 I144
#define LOC_PlaceHeatSink1 I145
#define LOC_PlaceHeatSink2 I146
#define LOC_PlaceCoverCPU1 I147  
#define LOC_PlaceCoverCPU2 I148

'Don't use I160 to I199.  It is for cycle time measurement.

#define VisCmd_Row I200

#define LOC_Golden_W1 I201
#define LOC_Golden_W2 I202
#define LOC_Golden_W3 I203
#define LOC_Golden_W4 I204
#define LOC_Golden_W5 I205
#define LOC_Golden_W6 I206
#define LOC_Golden_W7 I207

#define LOC_W1Fid1 I211
#define LOC_W1Fid2 I212
#define LOC_W1Fid3 I213 ' This is a non-vision location
#define LOC_W2Fid1 I214
#define LOC_W2Fid2 I215
#define LOC_W2Fid3 I216 ' This is a non-vision location
#define LOC_W3Fid1 I217
#define LOC_W3Fid2 I218
#define LOC_W3Fid3 I219 ' This is a non-vision location
#define LOC_W4Fid1 I220
#define LOC_W4Fid2 I221
#define LOC_W4Fid3 I222 ' This is a non-vision location
#define LOC_W5Fid1 I223
#define LOC_W5Fid2 I224
#define LOC_W5Fid3 I225 ' This is a non-vision location
#define LOC_W6Fid1 I226
#define LOC_W6Fid2 I227
#define LOC_W6Fid3 I228 ' This is a non-vision location
#define LOC_W7Fid1 I229
#define LOC_W7Fid2 I230
#define LOC_W7Fid3 I231 ' This is a non-vision location
#define LOC_W4ScrewRef I232 'teach relative to W4T0
#define LOC_W6ScrewRef I233 'teach relative to W6T0
#define LOC_W3ScrewRef I234 'teach relative to W3T0

'Vision Commands
#define VISCMD_W1Fid1 I241
#define VISCMD_W1Fid2 I242
#define VISCMD_W2Fid1 I244
#define VISCMD_W2Fid2 I245
#define VISCMD_W3Fid1 I247
#define VISCMD_W3Fid2 I248
#define VISCMD_W4Fid1 I250
#define VISCMD_W4Fid2 I251
#define VISCMD_W5Fid1 I253
#define VISCMD_W5Fid2 I254
#define VISCMD_W6Fid1 I256
#define VISCMD_W6Fid2 I257
#define VISCMD_W7Fid1 I259
#define VISCMD_W7Fid2 I260

#define TowerLight_BlinkingTimer D9
#define TowerLight_BlinkingTime D10

'Vision Last Offset
#define Vision_OffsetX F11
#define Vision_OffsetY F12
'Offset relative to W5 to be sent to Screw Robot
'#define W5_OffsetX F21 
'#define W5_OffsetY F22
'Offset relative to W5 to be sent to Screw Robot
'#define W7_OffsetX F25
'#define W7_OffsetY F26

'Tool Changer Parameters
#define ToolPNPOffset F30 'Final pick and place location Z offset
#define ToolPNPApp F31 'Pick approach Z offset
#define ToolPNPDepart F32 'Pick/Place depart Z offset
#define ToolPNPClearOffset F33 ' Z Offset to clear nest 
#define ToolZClearRecovery F34 ' Z component to clear nest
#define ToolPNPSideOffset1 F41   'Pick/Place side Y offset
#define ToolPNPSideOffset2 F42   'Pick/Place side Y offset
#define ToolPNPSideOffset3 F43   'Pick/Place side Y offset
#define ToolPNPSideOffset4 F44   'Pick/Place side Y offset
#define ToolPNPSideOffset5 F45   'Pick/Place side Y offset
#define ToolPNPSideOffset6 F46   'Pick/Place side Y offset
#define ToolPNPSideOffset7 F47   'Pick/Place side Y offset
#define ToolPNPSideOffset8 F48   'Pick/Place side Y offset
'
#define Cover_PendantSpeed F50
#define Speed_General	F51
#define Speed_Process	F52
#define Accel_General	F53
#define Accel_Process	F54
#define PendantSpeed F55
'
'#define Vis_Slope_X F56
'#define Vis_Slope_Y F57
#define MB_Side_Tweak F58
#define TweakAngle F59
#define ApproAngle F60
#define ApproTiltDist F61
#define ApproFinal F62
#define CoverCUPPickYOffset F64
#define NestZoneOffset F65
#define CoverCPUGripSettling F66
#define CoverCPUPickZOffset F67
#define CoverCPUPickAngle F68
#define MB_Speed_Process F69 'Place only
#define MB_Accel_Process F70'Place only
#define MB_PendantSpeed F71'Place only
#define VisOffset_Max F72
#define VisOffset_Min F73

'
#define Dimm_ZClear F75
#define Dimm_Press_Delay F76
#define Dimm_Angle F77 'Fiducial Dimm angle
#define Dimm_Place_SettleTime F78
#define Dimm1_Place_Offset F81
#define Dimm2_Place_Offset F82
#define Dimm3_Place_Offset F83
#define Dimm4_Place_Offset F84
#define Dimm1_Slope_Value F85
#define Dimm2_Slope_Value F86
#define Dimm3_Slope_Value F87
#define Dimm4_Slope_Value F88
#define FidSettling F89
'
#define Recovery_AppOffset F90
#define Recovery_Drop_ZOffset_MB F91
#define Recovery_Drop_ZOffset_CPU F92
#define Recovery_Drop_ZOffset_HeatSinks F93
#define Recovery_Drop_ZOffset_Dimm F94
#define Recovery_Pendant_Speed F95
'
'Command structure
#define Command S1
#define Response S2
#define VisLastOffset_X S3
#define VisLastOffset_Y 
'
#define CmdHeader S10
#define CmdPar1 S11
#define CmdPar2 S12
#define CmdPar3 S13
#define CmdPar4 S14
#define CmdPar5 S15
#define CmdPar6 S16
#define CmdStatus S17
#define CurCmdHeader S20
#define CurCmdPar1 S21
#define CurCmdPar2 S22
#define CurCmdPar3 S23
#define CurCmdPar4 S24
#define CurCmdPar5 S25
#define CurCmdPar6 S26
#define CurCmdStatus S27
'

'#define Zone2_Owner S50 'Zone control
'#define Zone2_Owner_Part_Area S51
'#define Zone2_Owner_Screw_Area S52 'Zone control
'#define Zone3_Owner S53 'Zone control
#define Zone2A_Owner S40 'This is a copy from Screw robot
#define Zone2B_Owner S41 'This is a copy from Screw robot
#define Zone3_Owner S42  'This is a copy from Screw robot
#define Zone2A_Request S45 'Request by part robot
#define Zone2B_Request S46 'Request by part robot
#define Zone3_Request S47 'Request by part robot
'
#define Zone_Screw_Request_Var "S39" 'If "", no request. "Zone 2", "Zone 2B", "Zone 3","Release Zone 2A", "Release Zone 2B", "Release Zone 3"
#define Zone2A_Owner_Var "S40"
#define Zone2B_Owner_Var "S41"
#define Zone3_Owner_Var "S42"
#define Zones_Owners_Var "S43"
#define Zone_Owner_Part "Part Handler"
#define Zone_Owner_Screw "Screw Handler"
#define Zone_Released "None"
#define Zone_Unknown "Unknown"
#define Zone_Part_Release_Zone_2A "Release Zone 2A"
#define Zone_Part_Release_Zone_2B "Release Zone 2B"
#define Zone_Part_Release_Zone_3 "Release Zone 3"

' S70 - S79 are reserved for command log
#define Cmd_Log_Latest S70
#define Cmd_Log_Oldest S79

'
'Offset from Part robot to Screw robot
'Area 2
#define STR_Offset_Area_2 "P110"  'P110 - Can't be changed
'Area 3
#define STR_Offset_Area_3 "P111"  'P111 - Can't be changed
'Area 2 Chassis
#define STR_Offset_Area_2_Chassis "P109"  'P109 - Can't be changed
'
#define VisCmd_Col S200
#define VisBarcode S201 'C180
#define VisBarcode_Result S202
'
'Offset Cell Numbers In In-Sight
#define STR_VIS_W1Fid1_X S211
#define STR_VIS_W1Fid1_Y S212
#define STR_VIS_W1Fid2_X S213
#define STR_VIS_W1Fid2_Y S214
#define STR_VIS_W2Fid1_X S216
#define STR_VIS_W2Fid1_Y S217
#define STR_VIS_W2Fid2_X S218
#define STR_VIS_W2Fid2_Y S219
#define STR_VIS_W3Fid1_X S221
#define STR_VIS_W3Fid1_Y S222
#define STR_VIS_W3Fid2_X S223
#define STR_VIS_W3Fid2_Y S224
#define STR_VIS_W4Fid1_X S226
#define STR_VIS_W4Fid1_Y S227
#define STR_VIS_W4Fid2_X S228
#define STR_VIS_W4Fid2_Y S229
#define STR_VIS_W5Fid1_X S231
#define STR_VIS_W5Fid1_Y S232
#define STR_VIS_W5Fid2_X S233
#define STR_VIS_W5Fid2_Y S234
#define STR_VIS_W6Fid1_X S236
#define STR_VIS_W6Fid1_Y S237
#define STR_VIS_W6Fid2_X S238
#define STR_VIS_W6Fid2_Y S239
#define STR_VIS_W7Fid1_X S241
#define STR_VIS_W7Fid1_Y S242
#define STR_VIS_W7Fid2_X S243
#define STR_VIS_W7Fid2_Y S244

#define TaskStatus_Running 3 '

'
#define IOCntrl As Object
'Commands
#define Cmd_Set_Product "Set_Product"
#define Cmd_Set_Output "Set_Output"
#define Cmd_Get_Inputs "Get_Inputs"
#define Cmd_Get_Outputs "Get_Outputs"
#define Cmd_Pass "Pass"
#define Cmd_Fail "Fail"
#define Cmd_Home "Home"
#define Cmd_Initialize "Initialize"
#define Cmd_Gripper_Change "Gripper_Change"
#define Cmd_Gripper_Return "Gripper_Return"
#define Cmd_Move_To_Point "Move_to_Point"
#define Cmd_Get_Work "Get_Work"
#define Cmd_Vision_Picture_1 "Vision_Picture_1"
#define Cmd_Vision_Picture_2 "Vision_Picture_2"
#define Cmd_Pick_Motherboard "Pick_Motherboard"
#define Cmd_Hold_Motherboard "Hold_Motherboard"
#define Cmd_Release_Motherboard "Release_Motherboard"
#define Cmd_Pick_DimmCard "Pick_DimmCard"
#define Cmd_Place_DimmCard "Place_DimmCard"
#define Cmd_Pick_N_Place_DimmCard "Pick_N_Place_DimmCard"
#define Cmd_Pick_CPU "Pick_CPU"
#define Cmd_Place_CPU "Place_CPU"
#define Cmd_Pick_HeatSinks "Pick_HeatSinks"
#define Cmd_Hold_HeatSinks "Hold_HeatSinks"
#define Cmd_Release_HeatSinks "Release_HeatSinks"
#define Cmd_Place_HeatSinks "Place_HeatSinks"
#define Cmd_Index_Conveyor "Index_Conveyor"
#define Cmd_Remove_Cover_CPU "Remove_Cover_CPU"
#define Cmd_Barcode "Get_Barcode"
#define Cmd_Set_TowerLights "Set_TowerLights"
#define Cmd_Gripper_Status "Gripper_Status"
#define Cmd_Copy_Product "Copy_Product"
#define Grip_Close "Close"
#define Grip_Close_CPU "Close CPU"
#define Grip_Close_Cover "Close Cover"
#define Grip_Open "Open"
#define Grip_ToolPick "Tool Pick"
#define Grip_ToolRelease "Tool Release"
#define GripReturn_Home 0
#define GripReturn_Exchange 1
#define GripReturn_Recovery 2
'
'MB Insert Path
#define MB_Path_10 10
#define MB_Path_11 11
#define MB_Path_12 12
#define MB_Path_13 13
#define MB_Path_14 14
#define MB_Path_15 15
#define MB_Path_16 16
#define MB_Path_17 17
'Tool IDs
#define ToolID_None 0
#define ToolID_MotherBoard 1
#define ToolID_HeatSinks 3
#define ToolID_CPU 4
#define ToolID_DimmMemory 6

'Tool Frame
#define ToolFrame_MotherBoard 1
#define ToolFrame_MB_Tweak 2
#define ToolFrame_Camera 3
#define ToolFrame_CoverCPU 4

'Workspace Frame
#define WorkFrame_AreaB_MotherBoard 1
#define WorkFrame_AreaB_Pallet 2
#define WorkFrame_Area2_Chassis 3
#define WorkFrame_Area2_MotherBoard 4
' Work 5 is being used in Screw Robot only (it is the same as work 4)
#define WorkFrame_Area3_MotherBoard 6

'Product Selection
#define Product_P100 "Candlestick"
#define Product_P200 "CDM"
#define Product_P300 "new product 3"
#define Product_P400 "new product 4"
#define Part_Robot_IP "Server=192.168.0.3"
#define Screw_Robot_IP "Server=192.168.0.4"

'System Zones:  
#define Zone_2 "Zone 2"
#define Zone_2B "Zone 2B"
#define Zone_3 "Zone 3"
#define Zone_B "Zone B"
#define Zone_C "Zone C"
#define Zone_All "Zone All"

'Work in zone
#define Zone_W1 "Zone B"
#define Zone_W2 "Zone B"
#define Zone_W3 "Zone 2"
#define Zone_W4 "Zone 2"
#define Zone_W5 "Zone 2"
#define Zone_W6 "Zone 3"
#define Zone_W7 "Zone 3"

'PCI Inputs
#define DI_AreaA_Present 16
#define DI_AreaA_EndStopUp 17
#define DI_AreaA_EndStopDown 18
#define DI_AreaB_Present 19
#define DI_AreaB_Left_Clamped 20
#define DI_AreaB_Left_UnClamped 21
#define DI_AreaB_Right_Clamped 22
#define DI_AreaB_Right_UnClamped 23
#define DI_AreaD_Present 28
#define DI_WBeam_At_AreaA 30
#define DI_WBeam_At_AreaD 31

'PCI Outputs
#define DO_AreaA_EndStopUp 16
#define DO_AreaA_EndStopDown 17
#define DO_AreaB_Clamp 18
#define DO_AreaB_Unclamp 19
#define DO_WBeam_To_AreaA 20
#define DO_WBeam_To_AreaD 21


#define SYSSTATE_WARNING_OR_ERROR &h0082
#define SYSSTATE_AUTOMODE &h0010
'Part Robot Error code

' identify Alarms
#define ERR_EMO -1
#define ERR_NOT_IN_AUTO -2
#define ERR_DOOR_NOT_LOCKED -3
#define ERR_DOOR_OPEN_WHILE_LOCKED -4
#define ERR_ROBOT_STOPPED -5
#define ERR_NO_SERVO_POWER -6
#define ERR_DISP_ALARM -10
#define ERR_DISP_ENDOFCYCLE -11
#define ERR_DISP_PRESSURE_NOT_OK -12
#define ERR_INVALID_OUTPUT -13
#define ERR_INVALID_OUTPUT_STATE -14
#define ERR_INVALID_PRODUCT -15
#define ERR_INVALID_WORKSPACE -16
#define ERR_INVALID_TOOL -17
#define ERR_POSITION_OUTOFRANGE -18
#define ERR_NOT_SAFE_TO_MOVE -19
#define ERR_ROBOT_CODE_BUG -20
#define ERR_PAR_OUTOFRANGE -21
#define ERR_ROBOT_CANT_COMPLETE_MOTION -22

#define ERR_ROBOT_NOT_READY -100
#define ERR_INVALID_POS -113
#define ERR_INVALID_CMD -114
#define ERR_VIS_X_OUTOFRANGE -115
#define ERR_VIS_Y_OUTOFRANGE -116
#define ERR_VIS_THETA_OUTOFRANGE -117
#define ERR_VIS_ERROR -118
#define ERR_VIS_WRONG_RESP -119
#define ERR_VIS_NOT_CONNECTED -120
#define ERR_VIS_NO_RESP -121
#define ERR_VIS_BUSY -122
#define ERR_INVALID_FID -123
#define ERR_WRONG_PITCH -124
#define ERR_WRONG_BANK -125
#define ERR_DIMM_SLOPE_RANGE -126
#define ERR_FAILED_TO_INDEX -135
#define ERR_ZONE_CONTROL_FAILED -136
#define ERR_Zone_Req_Timeout -137
#define ERR_PARTROBOT_REQ_ZONE2A -138
#define ERR_PARTROBOT_REQ_ZONE2B -139
#define ERR_PARTROBOT_REQ_ZONE3 -140
#define ERR_PARTROBOT_REL_ZONE2A -141 'Release failure
#define ERR_PARTROBOT_REL_ZONE2B -142 'Release failure
#define ERR_PARTROBOT_REL_ZONE3 -143 'Release failure
'Part Robot
#define ERR_PART_DROPPED -200
#define ERR_UNEXP_PART_PRESENT -201
#define ERR_WRONG_GRIP_CMD -202 'Wrong gripper for current command
#define ERR_PART_NOT_PRESENT -203
#define ERR_GRIP_NOT_CLOSED -204
#define ERR_GRIP_NOT_OPENED -205
#define ERR_UNEXP_GRIP_STATE -206
#define ERR_GRIP_NOT_PRESENT -207
#define ERR_INVALID_GRIPPER_ID -208 'Invalid gripper ID
#define ERR_GRIP_NO_PART -209
#define ERR_TOOL_CLAMP_FAILED - 210
#define ERR_WRONG_GRIPPER -211 'Wrong gripper at specified nest
#define ERR_UNEXP_GRIPPER_PRES -212 'Unexpected gripper present
#define ERR_UNEXPECTED_PALLET_AREA_D -220
#define ERR_AREAA_ENDSTOP_UP -221
#define ERR_AREAA_ENDSTOP_DOWN -222
#define ERR_LEFT_CLAMP_AREA_B -223
#define ERR_RIGHT_CLAMP_AREA_B -224
#define ERR_LEFT_UNCLAMP_AREA_B -225
#define ERR_RIGHT_UNCLAMP_AREA_B -226
#define ERR_WBEAM_AT_AREA_A -227 'Can't reach area A
#define ERR_WBEAM_AT_AREA_D -228 'Can't reach area D
#define ERR_INVALID_COVERZOFFSET -229
#define ERR_INVALID_COVERANGLEOFFSET -230
