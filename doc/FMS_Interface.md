# FMS Interface

**Version 1.0**

*This file is a part of Firmament Autopilot project*

## Input Bus

#### INS_Out_Bus
Refer to INS Interface

-------------
#### Pilot_Cmd_Bus
Type   | Name             | Unit        | Comments
-----  | --------------   | ----------  | ----------------
uint32 | timestamp        | ms          | timestamp in ms
float  | ls_lr            | [-1,1]      | left stick left/right value
float  | ls_ud            | [-1,1]      | left stick up/down value
float  | rs_lr            | [-1,1]      | right stick left/right value
float  | rs_ud            | [-1,1]      | right stick up/down value
uint32 | mode             | -           | control mode
uint32 | command_1        | -           | TBD
uint32 | command_2        | -           | TBD
-------------

## Output Bus

#### FMS_Out_Bus Interface
Type   | Name             | Unit        | Comments
-----  | --------------   | ----------  | ----------------
uint32 | timestamp        | ms          | timestamp of FMS output
single | p_cmd            | rad/s       | rate x command in body frame
single | q_cmd            | rad/s       | rate y command in body frame
single | r_cmd            | rad/s       | rate z command in body frame
single | phi_cmd          | rad         | roll command
single | theta_cmd        | rad         | pitch command
single | psi_rate_cmd     | rad/s       | yaw rate command
single | u_cmd            | m/s         | velocity x command in control frame
single | v_cmd            | m/s         | velocity y command in control frame
single | w_cmd            | m/s         | velocity z command in control frame
uint32 | throttle_cmd     | [1000,2000] | throttle command
uint32[8] | pwm_cmd       | [1000,2000] | pwm cmd of each motor
uint8 | state             | -           | vehicle state, refer to below definition
uint8 | mode              | -           | control mode, refer to below definition
uint8 | reset             | -           | reset controller
uint8 | reserved          | -           | 

#### state
Value  | Comments
-----  | --------------
0      | Disarm, `reset = 1`, `pwm_cmd` active
1      | Standby, `reset = 1`, `pwm_cmd`  active
2      | Arm, `reset = 0`, `pwm_cmd` inactive

#### mode
Value  | Comments
-----  | --------------
0      | Unknown Mode, `reset = 1`
1      | Mission Mode, `u_cmd`,`v_cmd`,`w_cmd`,`psi_rate_cmd` active
2      | Stablize Mode, `u_cmd`,`v_cmd`,`w_cmd`,`psi_rate_cmd` active
3      | Altitude Hold Mode, `phi_cmd`,`theta_cmd`,`psi_rate_cmd`,`w_cmd` active
4      | Attitude Mode, `phi_cmd`,`theta_cmd`,`psi_rate_cmd`,`throttle_cmd` active
5      | Acro Mode, `p_cmd`,`q_cmd`,`r_cmd`,`throttle_cmd` active
