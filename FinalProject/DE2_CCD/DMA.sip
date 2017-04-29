set_global_assignment -entity "DMA" -library "lib_DMA" -name IP_TOOL_NAME "altera_up_avalon_video_pixel_buffer_dma"
set_global_assignment -entity "DMA" -library "lib_DMA" -name IP_TOOL_VERSION "16.1"
set_global_assignment -entity "DMA" -library "lib_DMA" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_DMA" -name SPD_FILE [file join $::quartus(sip_path) "DMA.spd"]

set_global_assignment -library "lib_DMA" -name MISC_FILE [file join $::quartus(sip_path) "DMA_sim/DMA.v"]
