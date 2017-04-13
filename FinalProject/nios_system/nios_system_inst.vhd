	component nios_system is
		port (
			clk_clk               : in    std_logic                     := 'X';             -- clk
			key_wire_export       : in    std_logic_vector(3 downto 0)  := (others => 'X'); -- export
			qsys_vga_CLK          : out   std_logic;                                        -- CLK
			qsys_vga_HS           : out   std_logic;                                        -- HS
			qsys_vga_VS           : out   std_logic;                                        -- VS
			qsys_vga_BLANK        : out   std_logic;                                        -- BLANK
			qsys_vga_SYNC         : out   std_logic;                                        -- SYNC
			qsys_vga_R            : out   std_logic_vector(7 downto 0);                     -- R
			qsys_vga_G            : out   std_logic_vector(7 downto 0);                     -- G
			qsys_vga_B            : out   std_logic_vector(7 downto 0);                     -- B
			reset_reset_n         : in    std_logic                     := 'X';             -- reset_n
			sdram_wire_addr       : out   std_logic_vector(12 downto 0);                    -- addr
			sdram_wire_ba         : out   std_logic_vector(1 downto 0);                     -- ba
			sdram_wire_cas_n      : out   std_logic;                                        -- cas_n
			sdram_wire_cke        : out   std_logic;                                        -- cke
			sdram_wire_cs_n       : out   std_logic;                                        -- cs_n
			sdram_wire_dq         : inout std_logic_vector(31 downto 0) := (others => 'X'); -- dq
			sdram_wire_dqm        : out   std_logic_vector(3 downto 0);                     -- dqm
			sdram_wire_ras_n      : out   std_logic;                                        -- ras_n
			sdram_wire_we_n       : out   std_logic;                                        -- we_n
			switch_wire_export    : in    std_logic_vector(7 downto 0)  := (others => 'X'); -- export
			video_PIXEL_CLK       : in    std_logic                     := 'X';             -- PIXEL_CLK
			video_LINE_VALID      : in    std_logic                     := 'X';             -- LINE_VALID
			video_FRAME_VALID     : in    std_logic                     := 'X';             -- FRAME_VALID
			video_pixel_clk_reset : in    std_logic                     := 'X';             -- pixel_clk_reset
			video_PIXEL_DATA      : in    std_logic_vector(9 downto 0)  := (others => 'X')  -- PIXEL_DATA
		);
	end component nios_system;

	u0 : component nios_system
		port map (
			clk_clk               => CONNECTED_TO_clk_clk,               --         clk.clk
			key_wire_export       => CONNECTED_TO_key_wire_export,       --    key_wire.export
			qsys_vga_CLK          => CONNECTED_TO_qsys_vga_CLK,          --    qsys_vga.CLK
			qsys_vga_HS           => CONNECTED_TO_qsys_vga_HS,           --            .HS
			qsys_vga_VS           => CONNECTED_TO_qsys_vga_VS,           --            .VS
			qsys_vga_BLANK        => CONNECTED_TO_qsys_vga_BLANK,        --            .BLANK
			qsys_vga_SYNC         => CONNECTED_TO_qsys_vga_SYNC,         --            .SYNC
			qsys_vga_R            => CONNECTED_TO_qsys_vga_R,            --            .R
			qsys_vga_G            => CONNECTED_TO_qsys_vga_G,            --            .G
			qsys_vga_B            => CONNECTED_TO_qsys_vga_B,            --            .B
			reset_reset_n         => CONNECTED_TO_reset_reset_n,         --       reset.reset_n
			sdram_wire_addr       => CONNECTED_TO_sdram_wire_addr,       --  sdram_wire.addr
			sdram_wire_ba         => CONNECTED_TO_sdram_wire_ba,         --            .ba
			sdram_wire_cas_n      => CONNECTED_TO_sdram_wire_cas_n,      --            .cas_n
			sdram_wire_cke        => CONNECTED_TO_sdram_wire_cke,        --            .cke
			sdram_wire_cs_n       => CONNECTED_TO_sdram_wire_cs_n,       --            .cs_n
			sdram_wire_dq         => CONNECTED_TO_sdram_wire_dq,         --            .dq
			sdram_wire_dqm        => CONNECTED_TO_sdram_wire_dqm,        --            .dqm
			sdram_wire_ras_n      => CONNECTED_TO_sdram_wire_ras_n,      --            .ras_n
			sdram_wire_we_n       => CONNECTED_TO_sdram_wire_we_n,       --            .we_n
			switch_wire_export    => CONNECTED_TO_switch_wire_export,    -- switch_wire.export
			video_PIXEL_CLK       => CONNECTED_TO_video_PIXEL_CLK,       --       video.PIXEL_CLK
			video_LINE_VALID      => CONNECTED_TO_video_LINE_VALID,      --            .LINE_VALID
			video_FRAME_VALID     => CONNECTED_TO_video_FRAME_VALID,     --            .FRAME_VALID
			video_pixel_clk_reset => CONNECTED_TO_video_pixel_clk_reset, --            .pixel_clk_reset
			video_PIXEL_DATA      => CONNECTED_TO_video_PIXEL_DATA       --            .PIXEL_DATA
		);

