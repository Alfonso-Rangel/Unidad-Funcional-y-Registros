library IEEE;
use IEEE.std_logic_1164.all;

entity FFDwc_tb is
end entity FFDwc_tb;

architecture a_FFDwc_tb of FFDwc_tb is
    component FFDwc is
        port (
            D, W, C, clk: in std_logic; 
            Q: out std_logic
        );
    end component FFDwc;

    signal D, clk, Q, W, C: std_logic;

begin
    uut: FFDwc
        port map (
            D => D,
            W => W,
            C => C,
            clk => clk,
            Q => Q
        );

    -- Prueba 1: D = '0' durante todo el ciclo de reloj
    stimulus_process: process
    begin
        -- Configuración inicial
        D <= '0';
        clk <= '0';
        W <= '1';
        C <= '0';
        wait for 10 ns;

        -- Ciclo de reloj positivo
        clk <= '1';
        W <= '1';
        C <= '0';
        wait for 10 ns;

        -- Ciclo de reloj negativo
        clk <= '0';
        W <= '1';
        C <= '0';
        wait for 10 ns;

        -- Ciclo de reloj positivo
        clk <= '1';
        W <= '1';
        C <= '0';
        wait for 10 ns;

        -- Ciclo de reloj negativo
        clk <= '0';
        wait for 10 ns;

        -- Verificación del resultado
        assert Q = '0' report "Error en prueba 1" severity error;

        wait;
    end process stimulus_process;

end architecture a_FFDwc_tb;
