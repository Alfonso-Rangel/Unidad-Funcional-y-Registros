library IEEE;
use IEEE.std_logic_1164.all;

entity Unidad_Registros_TB is
end Unidad_Registros_TB;

architecture arch of Unidad_Registros_TB is
    -- Componente a probar
    component Unidad_Registros is
        port (
            N : in std_logic_vector(7 downto 0);
            W, clk, C: in std_logic;
            SR, SA, SB: in std_logic_vector(2 downto 0);
            A, B : out std_logic_vector(7 downto 0)
        );
    end component;

    -- Señales de prueba
    signal N_tb : std_logic_vector(7 downto 0);
    signal clk_tb, W_tb, C_tb : std_logic;
    signal SR_tb, SA_tb, SB_tb : std_logic_vector(2 downto 0);
    signal A_tb, B_tb : std_logic_vector(7 downto 0);
    constant clk_period : time := 10 ns;

begin
    test: Unidad_Registros port map (N => N_tb, W => W_tb, clk => clk_tb, C => C_tb, SR => SR_tb, SA => SA_tb, SB => SB_tb, A => A_tb, B => B_tb);

    clk_process: process
    begin
        while now < 1000 ns loop
            clk_tb <= '0';
            wait for clk_period / 2;
            clk_tb <= '1';
            wait for clk_period / 2;
        end loop;
        wait;
    end process;

    process
    begin
        N_tb <= "00000000";
        W_tb <= '0';
        C_tb <= '0';
        SR_tb <= "000";
        SA_tb <= "000";
        SB_tb <= "000";
        wait for 20 ns;

        N_tb <= "11111111";
        W_tb <= '1';
        C_tb <= '0';
        SR_tb <= "000";
        SA_tb <= "000";
        SB_tb <= "000";
        wait for 10 ns;

        N_tb <= "11110000";
        W_tb <= '1';
        C_tb <= '0';
        SR_tb <= "001";
        SA_tb <= "001";
        SB_tb <= "001";
        wait for 10 ns;

        
        wait for 10 ns;

        wait;
    end process;
end arch;
