curent_design cdc_2ff_sync

# Timing Constraints
create_clock -name clk_out -period 10.000 [get_ports {clk_out}]
create_clock -name clk_in -period 25.000 [get_ports {clk_in}]

set_max_delay 10.000 -from [get_clocks {clk_out}] -to [get_clocks {clk_in}]
