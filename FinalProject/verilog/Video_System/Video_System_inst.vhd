	component Video_System is
		port (
			VGA_CLK_from_the_VGA_Controller                     : out   std_logic;                                        -- CLK
			VGA_HS_from_the_VGA_Controller                      : out   std_logic;                                        -- HS
			VGA_VS_from_the_VGA_Controller                      : out   std_logic;                                        -- VS
			VGA_BLANK_from_the_VGA_Controller                   : out   std_logic;                                        -- BLANK
			VGA_SYNC_from_the_VGA_Controller                    : out   std_logic;                                        -- SYNC
			VGA_R_from_the_VGA_Controller                       : out   std_logic_vector(7 downto 0);                     -- R
			VGA_G_from_the_VGA_Controller                       : out   std_logic_vector(7 downto 0);                     -- G
			VGA_B_from_the_VGA_Controller                       : out   std_logic_vector(7 downto 0);                     -- B
			reset_n                                             : in    std_logic                     := 'X';             -- reset_n
			I2C_SDAT_to_and_from_the_AV_Config                  : inout std_logic                     := 'X';             -- SDAT
			I2C_SCLK_from_the_AV_Config                         : out   std_logic;                                        -- SCLK
			clk                                                 : in    std_logic                     := 'X';             -- clk
			SRAM_DQ_to_and_from_the_Pixel_Buffer                : inout std_logic_vector(15 downto 0) := (others => 'X'); -- DQ
			SRAM_ADDR_from_the_Pixel_Buffer                     : out   std_logic_vector(19 downto 0);                    -- ADDR
			SRAM_LB_N_from_the_Pixel_Buffer                     : out   std_logic;                                        -- LB_N
			SRAM_UB_N_from_the_Pixel_Buffer                     : out   std_logic;                                        -- UB_N
			SRAM_CE_N_from_the_Pixel_Buffer                     : out   std_logic;                                        -- CE_N
			SRAM_OE_N_from_the_Pixel_Buffer                     : out   std_logic;                                        -- OE_N
			SRAM_WE_N_from_the_Pixel_Buffer                     : out   std_logic;                                        -- WE_N
			Video_In_Decoder_external_interface_PIXEL_CLK       : in    std_logic                     := 'X';             -- PIXEL_CLK
			Video_In_Decoder_external_interface_LINE_VALID      : in    std_logic                     := 'X';             -- LINE_VALID
			Video_In_Decoder_external_interface_FRAME_VALID     : in    std_logic                     := 'X';             -- FRAME_VALID
			Video_In_Decoder_external_interface_pixel_clk_reset : in    std_logic                     := 'X';             -- pixel_clk_reset
			Video_In_Decoder_external_interface_PIXEL_DATA      : in    std_logic_vector(9 downto 0)  := (others => 'X')  -- PIXEL_DATA
		);
	end component Video_System;

	u0 : component Video_System
		port map (
			VGA_CLK_from_the_VGA_Controller                     => CONNECTED_TO_VGA_CLK_from_the_VGA_Controller,                     --   VGA_Controller_external_interface.CLK
			VGA_HS_from_the_VGA_Controller                      => CONNECTED_TO_VGA_HS_from_the_VGA_Controller,                      --                                    .HS
			VGA_VS_from_the_VGA_Controller                      => CONNECTED_TO_VGA_VS_from_the_VGA_Controller,                      --                                    .VS
			VGA_BLANK_from_the_VGA_Controller                   => CONNECTED_TO_VGA_BLANK_from_the_VGA_Controller,                   --                                    .BLANK
			VGA_SYNC_from_the_VGA_Controller                    => CONNECTED_TO_VGA_SYNC_from_the_VGA_Controller,                    --                                    .SYNC
			VGA_R_from_the_VGA_Controller                       => CONNECTED_TO_VGA_R_from_the_VGA_Controller,                       --                                    .R
			VGA_G_from_the_VGA_Controller                       => CONNECTED_TO_VGA_G_from_the_VGA_Controller,                       --                                    .G
			VGA_B_from_the_VGA_Controller                       => CONNECTED_TO_VGA_B_from_the_VGA_Controller,                       --                                    .B
			reset_n                                             => CONNECTED_TO_reset_n,                                             --                    clk_clk_in_reset.reset_n
			I2C_SDAT_to_and_from_the_AV_Config                  => CONNECTED_TO_I2C_SDAT_to_and_from_the_AV_Config,                  --        AV_Config_external_interface.SDAT
			I2C_SCLK_from_the_AV_Config                         => CONNECTED_TO_I2C_SCLK_from_the_AV_Config,                         --                                    .SCLK
			clk                                                 => CONNECTED_TO_clk,                                                 --                          clk_clk_in.clk
			SRAM_DQ_to_and_from_the_Pixel_Buffer                => CONNECTED_TO_SRAM_DQ_to_and_from_the_Pixel_Buffer,                --     Pixel_Buffer_external_interface.DQ
			SRAM_ADDR_from_the_Pixel_Buffer                     => CONNECTED_TO_SRAM_ADDR_from_the_Pixel_Buffer,                     --                                    .ADDR
			SRAM_LB_N_from_the_Pixel_Buffer                     => CONNECTED_TO_SRAM_LB_N_from_the_Pixel_Buffer,                     --                                    .LB_N
			SRAM_UB_N_from_the_Pixel_Buffer                     => CONNECTED_TO_SRAM_UB_N_from_the_Pixel_Buffer,                     --                                    .UB_N
			SRAM_CE_N_from_the_Pixel_Buffer                     => CONNECTED_TO_SRAM_CE_N_from_the_Pixel_Buffer,                     --                                    .CE_N
			SRAM_OE_N_from_the_Pixel_Buffer                     => CONNECTED_TO_SRAM_OE_N_from_the_Pixel_Buffer,                     --                                    .OE_N
			SRAM_WE_N_from_the_Pixel_Buffer                     => CONNECTED_TO_SRAM_WE_N_from_the_Pixel_Buffer,                     --                                    .WE_N
			Video_In_Decoder_external_interface_PIXEL_CLK       => CONNECTED_TO_Video_In_Decoder_external_interface_PIXEL_CLK,       -- Video_In_Decoder_external_interface.PIXEL_CLK
			Video_In_Decoder_external_interface_LINE_VALID      => CONNECTED_TO_Video_In_Decoder_external_interface_LINE_VALID,      --                                    .LINE_VALID
			Video_In_Decoder_external_interface_FRAME_VALID     => CONNECTED_TO_Video_In_Decoder_external_interface_FRAME_VALID,     --                                    .FRAME_VALID
			Video_In_Decoder_external_interface_pixel_clk_reset => CONNECTED_TO_Video_In_Decoder_external_interface_pixel_clk_reset, --                                    .pixel_clk_reset
			Video_In_Decoder_external_interface_PIXEL_DATA      => CONNECTED_TO_Video_In_Decoder_external_interface_PIXEL_DATA       --                                    .PIXEL_DATA
		);

