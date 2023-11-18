# An bare metal application project template for Vitis unified IDE to start development easily

(Support for AMD (Xilinx) Kria KV260, KR260)

## About this Script

This is a template project generation script to get you started developing on the AMD (Xilinx) Kria KV260, KR260. A minimal configuration is set up for each board and LED Flashing (rtl_top.v) is implemented as an example.

Development can be started by simply coding the HDL with rtl_top.v as the top.

PS configuration changes and wiring to external ports are done in Vivado's block design.

## Usage

By default, a project is generated for KV260; for KR260, replace "set board_type kv260" in vivado.tcl with "set board_type kr260".

### Prepare peripheral circuits

Connect a resistor and an LED to the PMOD J2 port on the board as shown below.

(The pin numbers should be the numbers shown on the board and on the schematic.)

PMOD_J2_Pin1 --- resistor 330 ohm --- (+)LED(-) --- PMOD_J2_Pin9(GND)

Connect the board and host PC with USB cable and turn on the power.

### Synthesis method using make

In a Linux terminal,

$ source "Vitis installation path"/settings64.sh

(e.g. $ source /opt/Xilinx/Vitis/2023.2/settings64.sh )

$ cd "Path of this directory"

$ make vivado

(Create a Vivado project)

$ make vivado-run

(Synthesis, Implement, Export HW)

$ make vitis

(Create and build a Vitis Unified IDE project)

Or

$ make

(Do all three of the above at once)

Start the Vitis Unified IDE,

"File": "Open Workspace",

Select the path "(this directory)/vitis_workspace" and OK.

"VIEW": "Flow" to show,

"FLOW": "Component", select "Project_1_app",

"FLOW": "Run" to run it.

### Synthesis method using Vivado's Tcl Console

Start Vivado and in "Menu": "Window": "Tcl Console",

$ pwd

(check the current directory)

$ cd "Path of this directory"

$ source vivado.tcl

(Run the Vivado project generation script)

$ source vivado-run.tcl

(Run Synthesis, Implement, Export HW)

This will generate a Vivado project under the project_1 directory, Bitstream generation and export of XSA files with bitstreams will be performed.

### For Vitis Unified IDE

In Vitis Unified IDE Terminal,

$ pwd

(check the current directory)

$ cd Path of this directory

(Go to this directory)

$ vitis -s vitisnew.py

(Run the Vitis project generation script. The build will also be executed automatically)

"File": "Open Workspace"

Select "(this directory)/vitis_workspace" and OK

"View": "Flow" to show,

"FLOW": "Component", select "Project_1_app",

"FLOW": "Run" to run it.

### For Vitis Classic IDE

Start the Vitis Classic IDE and start XSCT Console

xsct% pwd

(confirm current directory)

xsct% cd "The path of this directory"

(Go to this directory)

xsct% source vitis.tcl

(Run the Vitis project generation script. The build will also be executed automatically)

Right click on the application project icon and in "Run As",

Select "Single Application Debug", click "New launch configuration",

Open the "Target Setup" tab, turn off "Use FSBL flow for initialization", "Apply", then "Run" to execute.

For more information, please refer to the following website.

How to create an application project from a Vivado XSA file in Xilinx (AMD) Vitis (Stand alone, bare metal)

http://cellspe.matrix.jp/zerofpga/memo00001.html

## Supplemental Information

### Updating RTL sub-modules

When only the source code of a submodule of rtl_top.v is modified, the update information may not be captured properly on Vivado. In this case, if you modify rtl_top.v by adding comments or other dummy modifications, Vivado will catch it and display "Refresh Changed Modules", which you can click to reload and reset the source tree.

Example: // rev. 1 (2, 3, ...)

## About the License

This script and source code are in the public domain.
