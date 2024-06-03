PROJECT = project_1
VITIS_WORKSPACE = vitis_workspace
VIVADO = $(XILINX_VIVADO)/bin/vivado
VITIS = $(XILINX_VITIS)/bin/vitis
RM = rm -rf

all: vivado vivado-run vitis

vivado:
	$(VIVADO) -mode batch -notrace -source vivado.tcl

vivado-run:
	$(VIVADO) -mode batch -notrace -source vivado-run.tcl

vitis:
	$(VITIS) -source vitisnew.py

clean:
	$(RM) $(PROJECT) $(VITIS_WORKSPACE) vivado.log vivado*.jou .Xil *dynamic* *.log *.xpe .gitignore .lock .peers.ini
