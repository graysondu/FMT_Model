%% Sensor Model Initialize Script

Sensor_Model.g = 9.80665;
%% Gyroscope Model Parameter
Sensor_Model.IMU.Sampletime = 0.002;

Sensor_Model.Gyro.Vibration.Weight = [1.0; 1.0; 1.0; 1.0];
Sensor_Model.Gyro.Vibration.RPM_Max = [11000;11000;11000;11000];
Sensor_Model.Gyro.Vibration.Gain = [0.5;0.5;0.5];

Sensor_Model.Gyro.Bias = [0;0;0];
% Sensor_Model.Gyro.Temperature_Coefficient = [0;0;0];
% Sensor_Model.Gyro.Temperature_Reference = 298;
Sensor_Model.Gyro.Scalefactor_Error = zeros(3);
Sensor_Model.Gyro.Range = 2000*pi/180; % 2000dps
Sensor_Model.Gyro.Cutoff_frequency_Hz = 50; % TODO, 256 don't work
Sensor_Model.Gyro.Variance = [0.005;0.005;0.005].^2;
Sensor_Model.Gyro.Seed = [2123;2234;2345];
% Sensor_Model.Gyro.Sampletime = 0.002;
% Sensor_Model.Gyro.Latency_s = 1;
% Sensor_Model.Gyro.Resolution = 1/16.4*pi/180; % 16.4 LSB/dps

%% Accelerometer Model Parameter
Sensor_Model.Acc.Vibration.Weight = [1.0; 1.0; 1.0; 1.0];
Sensor_Model.Acc.Vibration.RPM_Max = [11000;11000;11000;11000];
Sensor_Model.Acc.Vibration.Gain = [20; 20; 15];

Sensor_Model.Acc.Bias = [0;0;0];
% Sensor_Model.Acc.Temperature_Coefficient = [0;0;0];
% Sensor_Model.Acc.Temperature_Reference = 298;
Sensor_Model.Acc.Scalefactor_Error = zeros(3);
Sensor_Model.Acc.Upper_limit = 8*9.80665;   % +-8g
Sensor_Model.Acc.Lower_limit = -8*9.80665;
Sensor_Model.Acc.Cutoff_frequency_Hz = 50;
Sensor_Model.Acc.Variance = [0.05;0.05;0.05].^2;
Sensor_Model.Acc.Seed = [1123;1234;1345];
% Sensor_Model.Acc.Sampletime = 0.002;
% Sensor_Model.Acc.Latency_s = 1;
% Sensor_Model.Acc.Resolution = 1/4096*9.80665;  % 4096 LSB/g

%% Magnetometer Model Parameter
Sensor_Model.Mag.Bias = [0;0;0];
% Sensor_Model.Mag.Temperature_Coefficient = [0.0;0.0;0.0];
% Sensor_Model.Mag.Temperature_Reference = 298;
Sensor_Model.Mag.Scalefactor_Error = zeros(3);
% Sensor_Model.Mag.Alignment = [1,0,0;0,1,0;0,0,1];
Sensor_Model.Mag.Upper_limit = 4; % +-4 Gauss
Sensor_Model.Mag.Lower_limit = -4; 
Sensor_Model.Mag.Cutoff_frequency_Hz = 100;
Sensor_Model.Mag.Variance = [0.001;0.001;0.001].^2;
Sensor_Model.Mag.Seed = [3123;3234;3345];
Sensor_Model.Mag.Sampletime = 0.01;
% Sensor_Model.Mag.Latency_s = 1;
% Sensor_Model.Mag.Resolution = 1/6842;  % 6842 LSB/Gauss

Sensor_Model.Mag.WMM_Mag = wmm.wmmgrid_mag_2019;
Sensor_Model.Mag.WMM_Dec = wmm.wmmgrid_dec_2019;
Sensor_Model.Mag.WMM_Inc = wmm.wmmgrid_inc_2019;

%% Barometer Model Parameter
Sensor_Model.Baro.Bias = 0;
% Sensor_Model.Baro.Temperature_Coefficient = 0;
% Sensor_Model.Baro.Temperature_Reference = 293.15;
% Sensor_Model.Baro.Scalefactor_Error = 0.0;
Sensor_Model.Baro.Upper_limit = 115e3;
Sensor_Model.Baro.Lower_limit = -15e3;
% Sensor_Model.Baro.Cutoff_frequency_Hz = 40;
Sensor_Model.Baro.Variance = 4^2;
Sensor_Model.Baro.Seed = 4123;
Sensor_Model.Baro.Sampletime = 0.01;
% Sensor_Model.Baro.Latency_s = 1;
% Sensor_Model.Baro.Resolution = 0.15;