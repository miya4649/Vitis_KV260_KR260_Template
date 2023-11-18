PROJECT = project_1
VITIS_WORKSPACE = vitis_workspace
VITIS_CLASSIC_WORKSPACE = vitis_classic_workspace
VIVADO = $(XILINX_VIVADO)/bin/vivado
VITIS = $(XILINX_VITIS)/bin/vitis
XSCT = $(XILINX_VITIS)/bin/xsct
RM = rm -rf

all: vivado vivado-run vitis

vivado:
	$(VIVADO) -mode batch -notrace -source vivado.tcl

vivado-run:
	$(VIVADO) -mode batch -notrace -source vivado-run.tcl

vitis-classic:
	$(XSCT) -norlwrap vitis.tcl

vitis:
	$(VITIS) -source vitisnew.py

clean:
	$(RM) $(PROJECT) $(VITIS_WORKSPACE) $(VITIS_CLASSIC_WORKSPACE) vivado.log vivado*.jou .Xil *dynamic* *.log *.xpe .gitignore .lock .peers.ini
