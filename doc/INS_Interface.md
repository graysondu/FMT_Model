# INS Interface

**Version 1.0**

*This file is a part of Firmament Autopilot project*

## Input Bus

#### IMU_Bus Interface (500Hz)
Type   | Name             | Unit        | Comments
-----  | --------------   | ----------  | ----------------
uint32 | timestamp_ms     | ms          | timestamp in ms
float  | gyr_x_radPs_B    | rad/s       | roll rate
float  | gyr_y_radPs_B    | rad/s       | pitch rate
float  | gyr_z_radPs_B    | rad/s       | yaw rate
float  | acc_x_mPs2_B     | m/s2        | acceleration of x in body frame
float  | acc_y_mPs2_B     | m/s2        | acceleration of y in body frame
float  | acc_z_mPs2_B     | m/s2        | acceleration of z in body frame
-------------
#### Mag_Bus Interface (100Hz)
Type   | Name             | Unit        | Comments
-----  | --------------   | ----------  | ----------------
uint32 | timestamp_ms     | ms          | timestamp in ms
float  | mag_x_ga_B       | gauss       | magnetic field of x in body frame
float  | mag_y_ga_B       | gauss       | magnetic field of y in body frame
float  | mag_z_ga_B       | gauss       | magnetic field of z in body frame
-------------
#### Baro_Bus Interface (100Hz)
Type   | Name             | Unit        | Comments
-----  | --------------   | ----------  | ----------------
uint32 | timestamp_ms     | ms          | timestamp in ms
float  | pressure_pa      | pa          | static air pressure in pa
float  | temp_deg         | degree      | temperature in degree
-------------
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
-------------
#### Sonar_Bus Interface(TO BE ADDED)
-------------
#### OpticalFlow_Bus Interface(TO BE ADDED)
-------------
## Output Bus

#### INS_Out_Bus Interface (500Hz)
Type   | Name             | Unit        | Comments
-----  | --------------   | ----------  | ----------------
uint32 | timestamp        | ms          | timestamp of INS output
single | phi              | rad         | roll angle
single | theta            | rad         | pitch angle
single | psi              | rad         | yaw angle
single[4]| quat           | -           | attitude quaternion
single | p                | rad/s       | roll rate
single | q                | rad/s       | pitch rate
single | r                | rad/s       | yaw rate
single | ax               | m/s^2       | specific force in x
single | ay               | m/s^2       | specific force in y
single | az               | m/s^2       | specific force in z
single | vn               | m/s         | WGS84 north velocity
single | ve               | m/s         | WGS84 east velocity
single | vd               | m/s         | WGS84 down velocity
double | lon              | deg         | WGS84 longitude
double | lat              | deg         | WGS84 latitude
double | alt              | m           | WGS84 altitude
single | x_R              | m           | Relative position of x
single | y_R              | m           | Relative position of y
single | h_R              | m           | Relative position of height
single | h_AGL            | m           | Height above ground level
uint32 | flag             | -           | INS output flag, refer to below definition
uint32 | status           | -           | INS sensor status, refer to below definition

#### flag
bit    | Comments
-----  | --------------
0      | INS ready
1      | standstill
2      | attitude valid
3      | heading valid
4      | velocity valid
5      | WGS84 position valid
6      | relative position x,y valid
7      | relative height valid
8      | height above ground level valid
9-31   | reserved

#### status
bit    | Comments
-----  | --------------
0      | IMU1 available
1      | IMU2 available
2      | magnetometer available
3      | barometer available
4      | GPS available
5      | sonar available
6      | optical flow available
7-31   | reserved