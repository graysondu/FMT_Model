<p align="center"><img width="200" src="https://github.com/FirmamentPilot/fmt_user_guide_cn/blob/master/figures/logo.png" alt=FMT logo"></p>

# Overview
Firmament Model (FMT Model) is a part of [Firmament Autopilot](https://github.com/FirmamentPilot) project, which includes the simulation framework, such as **model-in-the-loop** , **hardware-in-the-loop** and **open-loop** simulation. Apart from that, the algorithm library is provided which contains various of simulink model including **INS**, **Controller**, **FMS**, **Plant**,  which can be used for different vehicles. These models can generate C/C++ source file and easily integrate into [FMT Firmware](https://github.com/FirmamentPilot/FMT_Firmware).

<p align="center"><img width="700" src="https://github.com/FirmamentPilot/fmt_user_guide_cn/blob/master/fmt_model/architecture/figures/fmt_model.png" alt=structure"></p>

## Quick Start

FMT Model is mainly developed and tested in Matlab 2018b, so it's strongly recommended to use this version. However, it's possible to open the project with higher matlab version, but that is not well tested.

### Initialization

To initialize the project, simply click and run `FMT_Model.prj`, which will do everything for you.

### MIL Simulation

Follow the belowing steps to start MIL simulation:

- Open the MIL simulation model `$FMT_Model/simulation/MILSIM.slx`.
- Modify `FCS/RC` module to select rc signal source (`Variant->Label Model Active Choice`). Currently there are two source supported:
	-  *Joystick* (default): A joystick should be connected to your PC.
	-  *Mavlink*: In this way, rc signal would be sent via mavlink protocol. Make sure you uncomment macro `FMT_OUTPUT_PILOT_CMD` in `$FMT_Firmware/fmt_fmu/target/pixhawk/fmtconfig.h`.
- Modify `Virtualization` module to select 3D environment.
	- *Matlab_3D*  (default): Matlab 3D Animation
	- *Flightgear*: Flightgear Simulator  
- Clock `Run` button to start the simulation.

### Open-loop Simulation

Follow the belowing steps to start open-loop simulation:

- Open the open-loop simulation model `$FMT_Model/simulation/OpenLoopSIM.slx`.


