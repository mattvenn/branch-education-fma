# FMA demo

to run the test:

    make

to show the trace:

    make show_trace_fma

to show top level structure:

    make show_synth_fma

to build the GDS:

    make harden

to change the width of the FMA, edit the src/fma.v and change the parameter WIDTH

# Output files

the output directory contains 3 directories, for 4, 8 and 16 bit versions of the FMA:

* GDS
* SVG of the 'yosys show' command
* STLs for each layer

# STLs

See here for the Sky130 stackup: https://skywater-pdk.readthedocs.io/en/main/rules/assumptions.html
That gives an idea of the dimensions for each layer.

Here is the order of the STL from bottom to top:

* gds_substrate.stl - p substrate
* gds_tap.stl       - inside the substrate
* gds_nwell.stl     - inside the substrate
* gds_poly.stl      - on top of the substrate, forms the gate of the MOSFETs
* gds_licon.stl     - connects nwell or tap to li1
* gds_li1.stl       - local interconnect layer
* gds_mcon.stl      - connects from li1 to met1
* gds_met1.stl      - metal 1
* gds_via.stl       - connects met1 to met2
* gds_met2.stl      - metal 2
* gds_via2.stl      - connects met2 to met3
* gds_met3.stl      - metal 3
* gds_via3.stl      - you get the idea
* gds_met4.stl
* gds_via4.stl
* gds_met5.stl


