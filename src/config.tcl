# The only thing you can change is the PL_BASIC_PLACEMENT line
# If you get stuck with this config, please open an issue or get in touch via the discord.

# User config
set script_dir [file dirname [file normalize [info script]]]

set ::env(DESIGN_NAME) fma
set ::env(VERILOG_FILES) "\
    $::env(DESIGN_DIR)/fma.v"


# save some time
set ::env(RUN_KLAYOUT_XOR) 0
set ::env(RUN_KLAYOUT_DRC) 0

# absolute die size
set ::env(FP_SIZING) absolute
set ::env(DIE_AREA) "0 0 200 200"
set ::env(FP_CORE_UTIL) 55

# clock
set ::env(CLOCK_TREE_SYNTH) 0
set ::env(CLOCK_PORT) null
