### INS Input Interface

#### IMU_Bus Interface (500Hz)
Type   | Name             | Unit        | Comments
-----  | --------------   | ----------  | ----------------
uint32 | timestamp_ms     | ms          | timestamp in ms
float  | gyr_x_radPs_B    | rad/s       | roll rate
float  | gyr_y_radPs_B    | rad/s       | pitch rate
float  | gyr_z_radPs_B    | rad/s       | yaw rate
float  | acc_x_mPs2_B     | m/s2        | acceleration in x
float  | acc_y_mPs2_B     | m/s2        | acceleration in y
float  | acc_z_mPs2_B     | m/s2        | acceleration in z

#### Mag_Bus Interface (100Hz)
Type   | Name             | Unit        | Comments
-----  | --------------   | ----------  | ----------------
uint32 | timestamp_ms     | ms          | timestamp in ms
float  | mag_x_ga_B       | gauss       | magnetic field in x
float  | mag_y_ga_B       | gauss       | magnetic field in y
float  | mag_z_ga_B       | gauss       | magnetic field in z

#### MS5611_Bus Interface (100Hz)
Type   | Name             | Unit        | Comments
-----  | --------------   | ----------  | ----------------
uint32 | timestamp_ms     | ms          | timestamp in ms
float  | pressure_pa      | Pa          | air pressure in Pa
float  | temp_deg         | degree      | temperature in degree

#### uBlox_PVT_Bus Interface (10Hz)
Type   | Name             | Unit        | Comments
-----  | --------------   | ----------  | ----------------
uint32 | timestamp_ms     | ms          | timestamp in ms
uint32 | iTOW             | ms          | GPS time of week
uint16 | year             | year        | Year(UTC)
uint8  | month            | month       | Month
uint8  | day              | day         | Day of month
uint8  | hour             | hour        | Hour of day
uint8  | min              | minute      | Minute of hour
uint8  | sec              | second      | Seconds of minute
uint8  | valid            | -           | Valid flags
uint32 | tAcc             | ns          | TIme accurancy estimate
int32  | nano             | ns          | Fraction of second
uint8  | fixType          | -           | GNSSfox Type
uint8  | flags            | -           | Fix status flags
uint8  | reserved1        | -           | Reserved
uint8  | numSV            | -           | Number of available satelites
int32  | lon              | 1e7 deg     | Lontitude
int32  | lat              | 1e7 deg     | Latitude
int32  | height           | mm          | Height above Elipsoid
int32  | hMSL             | mm          | Height above mean sea level
uint32 | hAcc             | mm          | Horizontal accurancy
uint32 | vAcc             | mm          | Vertical accurancy
int32  | velN             | mm/s        | NED north velocity
int32  | velE             | mm/s        | NED east velocity
int32  | velD             | mm/s        | NED down velocity
int32  | gSpeed           | mm/s        | Ground speed
int32  | headMot          | 1e5 deg     | Heading of motion
uint32 | sAcc             | mm/s        | Speed accurancy
uint32 | headAcc          | 1e5 deg     | Heading accurancy
uint16 | pDOP             | 1e2 deg     | Position DOP
uint16 | reserved2        | -           | Reserved

### INS Output Interface

#### INS_Out_Bus Interface (800Hz)
Type   | Name             | Unit        | Comments
-----  | --------------   | ----------  | ----------------
uint32 | timestamp_ms     | ms          | timestamp of INS output
single | roll             | rad         | roll angle
single | pitch            | rad         | pitch angle
single | yaw              | rad         | yaw angle
single | p                | rad/s       | roll rate
single | q                | rad/s       | pitch rate
single | r                | rad/s       | yaw rate
single | acc_x            | m/s^2       | specific force in x
single | acc_y            | m/s^2       | specific force in y
single | acc_z            | m/s^2       | specific force in z
single | velN             | m/s         | WGS84 north velocity
single | velE             | m/s         | WGS84 east velocity
single | velD             | m/s         | WGS84 down velocity
double | longitude        | deg         | WGS84 longitude
double | latitude         | deg         | WGS84 latitude
double | altitude         | m           | WGS84 altitude

### Controller Input Interface
Type   | Name             | Unit        | Comments
-----  | --------------   | ----------  | ----------------
FMS_Output | FMS_Output     | -         | FMS Output Interface
INS_Output | INS_Output     | -         | INS Output Interface

### Controller Output Interface
Type   | Name             | Unit        | Comments
-----  | --------------   | ----------  | ----------------
uint32 | timestamp_ms     | ms          | timestamp of Controller output
uint16 | pwm_cmd          | [1000 2000] | dimension: [8 1], pwm command for motors, valid if arm=1


### FMS Input Interface

#### Pilot_Cmd
Type   | Name             | Unit        | Comments
-----  | --------------   | ----------  | ----------------
uint32 | timestamp_ms     | ms          | timestamp of pilot command
single | ls_lr            | [-1 1]      | left stick value of left/right
single | ls_ud            | [-1 1]      | left stick value of up/down
single | rs_lr            | [-1 1]      | right stick value of left/right
single | rs_ud            | [-1 1]      | right stick value of up/down
uint32 | mode             | -           | flight mode, 0: attitude  1: altitude hold  2: autonomous
uint32 | command_1        | -           | command signal 1
uint32 | command_2        | -           | command signal 2

#### GCS_Cmd
Type   | Name             | Unit        | Comments
-----  | --------------   | ----------  | ----------------
uint32 | timestamp_ms     | ms          | timestamp of ground control station (GCS) command

### FMS Output Interface
Type   | Name             | Unit        | Comments
-----  | --------------   | ----------  | ----------------
uint32 | timestamp_ms     | ms          | timestamp of FMS output
single | p_cmd_radPs      | rad/s       | roll rate command
single | q_cmd_radPs      | rad/s       | pitch rate command
single | r_cmd_radPs      | rad/s       | yaw rate command
single | phi_cmd_rad      | rad         | roll command
single | theta_cmd_rad    | rad         | pitch command
single | psi_cmd_rad      | rad         | yaw command
single | u_cmd_B_mPs      | m/s         | velocity x command for outter controller in body frame
single | v_cmd_B_mPs      | m/s         | velocity y command for outter controller in body frame
single | w_cmd_B_mPs      | m/s         | velocity z command for outter controller in body frame
uint32 | throttle_cmd     | [1000 2000] | base throttle command if pos_mode = 0
uint16 | pwm_cmd          | [1000 2000] | dimension: [8 1], pwm command for motors, valid if arm=0
uint32 | reset            | -           | reset the controller
uint32 | arm              | -           | arm status
uint8  | att_mode         | -           | roll/pitch control mode, valid only if pos_mode != 2: <br> 0: rate control <br> 1: angle control
uint8  | yaw_mode         | -           | yaw control mode: <br> 0: rate control <br> 1: angle control
uint8  | pos_mode         | -           | position control mode: <br> 0: no control <br> 1: z velocity control <br> 2: full velocity control
uint8  | reserved         | -           | reserved for 32bit allighment
