# defaults
SIM ?= icarus
TOPLEVEL_LANG ?= verilog

VERILOG_SOURCES += $(PWD)/src/fma.v
TOPLEVEL = fma
MODULE = test.test

# Adjust to your PDK
PDK = sky130A
PDK_ROOT = /home/matt/work/asic-workshop/shuttle9/pdk
OPENLANE_ROOT = /home/matt/work/asic-workshop/shuttle9/openlane
OPENLANE_IMAGE_NAME = efabless/openlane:a35b64aa200c91e9eb7dde56db787d6b4c0ea12a-amd64

include $(shell cocotb-config --makefiles)/Makefile.sim

show_trace_%: %.vcd %.gtkw
	gtkwave $^

show_synth_%: src/%.v
	yosys -p "read_verilog $<; proc; opt; show -colors 2 -width -signed"

# needs PDK_ROOT and OPENLANE_ROOT, OPENLANE_IMAGE_NAME set from your environment
harden:
	docker run --rm \
	-v $(OPENLANE_ROOT):/openlane \
	-v $(PDK_ROOT):$(PDK_ROOT) \
	-v $(CURDIR):/work \
	-e PDK_ROOT=$(PDK_ROOT) \
	-e PDK=$(PDK) \
	-u $(shell id -u $(USER)):$(shell id -g $(USER)) \
	$(OPENLANE_IMAGE_NAME) \
	/bin/bash -c "./flow.tcl -overwrite -design /work/src -run_path /work/runs -tag fma"

show_techmap_%: runs/%/tmp/synthesis/post_techmap.dot
	xdot $<

clean::
	rm -rf *vcd sim_build test/__pycache__

.PHONY: clean
