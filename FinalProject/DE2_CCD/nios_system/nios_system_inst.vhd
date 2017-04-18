	component nios_system is
		port (
			clk_clk                                              : in  std_logic                     := 'X';             -- clk
			reset_reset_n                                        : in  std_logic                     := 'X';             -- reset_n
			video_decoder_0_external_interface_TD_CLK27          : in  std_logic                     := 'X';             -- TD_CLK27
			video_decoder_0_external_interface_TD_DATA           : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- TD_DATA
			video_decoder_0_external_interface_TD_HS             : in  std_logic                     := 'X';             -- TD_HS
			video_decoder_0_external_interface_TD_VS             : in  std_logic                     := 'X';             -- TD_VS
			video_decoder_0_external_interface_clk27_reset       : in  std_logic                     := 'X';             -- clk27_reset
			video_decoder_0_external_interface_TD_RESET          : out std_logic;                                        -- TD_RESET
			video_decoder_0_external_interface_overflow_flag     : out std_logic;                                        -- overflow_flag
			video_stream_export                                  : in  std_logic                     := 'X';             -- export
			video_dma_controller_0_avalon_dma_master_address     : out std_logic_vector(31 downto 0);                    -- address
			video_dma_controller_0_avalon_dma_master_waitrequest : in  std_logic                     := 'X';             -- waitrequest
			video_dma_controller_0_avalon_dma_master_write       : out std_logic;                                        -- write
			video_dma_controller_0_avalon_dma_master_writedata   : out std_logic_vector(31 downto 0)                     -- writedata
		);
	end component nios_system;

	u0 : component nios_system
		port map (
			clk_clk                                              => CONNECTED_TO_clk_clk,                                              --                                      clk.clk
			reset_reset_n                                        => CONNECTED_TO_reset_reset_n,                                        --                                    reset.reset_n
			video_decoder_0_external_interface_TD_CLK27          => CONNECTED_TO_video_decoder_0_external_interface_TD_CLK27,          --       video_decoder_0_external_interface.TD_CLK27
			video_decoder_0_external_interface_TD_DATA           => CONNECTED_TO_video_decoder_0_external_interface_TD_DATA,           --                                         .TD_DATA
			video_decoder_0_external_interface_TD_HS             => CONNECTED_TO_video_decoder_0_external_interface_TD_HS,             --                                         .TD_HS
			video_decoder_0_external_interface_TD_VS             => CONNECTED_TO_video_decoder_0_external_interface_TD_VS,             --                                         .TD_VS
			video_decoder_0_external_interface_clk27_reset       => CONNECTED_TO_video_decoder_0_external_interface_clk27_reset,       --                                         .clk27_reset
			video_decoder_0_external_interface_TD_RESET          => CONNECTED_TO_video_decoder_0_external_interface_TD_RESET,          --                                         .TD_RESET
			video_decoder_0_external_interface_overflow_flag     => CONNECTED_TO_video_decoder_0_external_interface_overflow_flag,     --                                         .overflow_flag
			video_stream_export                                  => CONNECTED_TO_video_stream_export,                                  --                             video_stream.export
			video_dma_controller_0_avalon_dma_master_address     => CONNECTED_TO_video_dma_controller_0_avalon_dma_master_address,     -- video_dma_controller_0_avalon_dma_master.address
			video_dma_controller_0_avalon_dma_master_waitrequest => CONNECTED_TO_video_dma_controller_0_avalon_dma_master_waitrequest, --                                         .waitrequest
			video_dma_controller_0_avalon_dma_master_write       => CONNECTED_TO_video_dma_controller_0_avalon_dma_master_write,       --                                         .write
			video_dma_controller_0_avalon_dma_master_writedata   => CONNECTED_TO_video_dma_controller_0_avalon_dma_master_writedata    --                                         .writedata
		);

