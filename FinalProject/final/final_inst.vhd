	component final is
		port (
			clk_clk            : in    std_logic                     := 'X';             -- clk
			key_wire_export    : in    std_logic_vector(3 downto 0)  := (others => 'X'); -- export
			led_wire_export    : out   std_logic_vector(7 downto 0);                     -- export
			reset_reset_n      : in    std_logic                     := 'X';             -- reset_n
			sdram_clk_clk      : out   std_logic;                                        -- clk
			sdram_wire_addr    : out   std_logic_vector(12 downto 0);                    -- addr
			sdram_wire_ba      : out   std_logic_vector(1 downto 0);                     -- ba
			sdram_wire_cas_n   : out   std_logic;                                        -- cas_n
			sdram_wire_cke     : out   std_logic;                                        -- cke
			sdram_wire_cs_n    : out   std_logic;                                        -- cs_n
			sdram_wire_dq      : inout std_logic_vector(31 downto 0) := (others => 'X'); -- dq
			sdram_wire_dqm     : out   std_logic_vector(3 downto 0);                     -- dqm
			sdram_wire_ras_n   : out   std_logic;                                        -- ras_n
			sdram_wire_we_n    : out   std_logic;                                        -- we_n
			switch_wire_export : in    std_logic_vector(7 downto 0)  := (others => 'X'); -- export
			rgb_export         : in    std_logic_vector(29 downto 0) := (others => 'X'); -- export
			inx_export         : in    std_logic_vector(9 downto 0)  := (others => 'X'); -- export
			iny_export         : in    std_logic_vector(9 downto 0)  := (others => 'X'); -- export
			vs_export          : in    std_logic                     := 'X';             -- export
			clk_wire_export    : out   std_logic;                                        -- export
			posx_export        : out   std_logic_vector(9 downto 0);                     -- export
			posy_export        : out   std_logic_vector(9 downto 0)                      -- export
		);
	end component final;

	u0 : component final
		port map (
			clk_clk            => CONNECTED_TO_clk_clk,            --         clk.clk
			key_wire_export    => CONNECTED_TO_key_wire_export,    --    key_wire.export
			led_wire_export    => CONNECTED_TO_led_wire_export,    --    led_wire.export
			reset_reset_n      => CONNECTED_TO_reset_reset_n,      --       reset.reset_n
			sdram_clk_clk      => CONNECTED_TO_sdram_clk_clk,      --   sdram_clk.clk
			sdram_wire_addr    => CONNECTED_TO_sdram_wire_addr,    --  sdram_wire.addr
			sdram_wire_ba      => CONNECTED_TO_sdram_wire_ba,      --            .ba
			sdram_wire_cas_n   => CONNECTED_TO_sdram_wire_cas_n,   --            .cas_n
			sdram_wire_cke     => CONNECTED_TO_sdram_wire_cke,     --            .cke
			sdram_wire_cs_n    => CONNECTED_TO_sdram_wire_cs_n,    --            .cs_n
			sdram_wire_dq      => CONNECTED_TO_sdram_wire_dq,      --            .dq
			sdram_wire_dqm     => CONNECTED_TO_sdram_wire_dqm,     --            .dqm
			sdram_wire_ras_n   => CONNECTED_TO_sdram_wire_ras_n,   --            .ras_n
			sdram_wire_we_n    => CONNECTED_TO_sdram_wire_we_n,    --            .we_n
			switch_wire_export => CONNECTED_TO_switch_wire_export, -- switch_wire.export
			rgb_export         => CONNECTED_TO_rgb_export,         --         rgb.export
			inx_export         => CONNECTED_TO_inx_export,         --         inx.export
			iny_export         => CONNECTED_TO_iny_export,         --         iny.export
			vs_export          => CONNECTED_TO_vs_export,          --          vs.export
			clk_wire_export    => CONNECTED_TO_clk_wire_export,    --    clk_wire.export
			posx_export        => CONNECTED_TO_posx_export,        --        posx.export
			posy_export        => CONNECTED_TO_posy_export         --        posy.export
		);
