library IEEE;
use IEEE.std_logic_1164.all;

entity mux4x1_tb is
end entity mux4x1_tb;

architecture arch of mux4x1_tb is
    component mux4x1
        port (   
            entrada0, entrada1, entrada2, entrada3 : in std_logic;
            selector : in std_logic_vector(1 downto 0);
            salida : out std_logic
        );
    end component;

    signal en0: std_logic;
    signal en1: std_logic;
    signal en2: std_logic;
    signal en3: std_logic;
    signal selector_tb: std_logic_vector(1 downto 0);
    signal salida_tb: std_logic;

begin
    test: mux4x1 port map (entrada0 => en0, entrada1 => en1, entrada2 => en2, entrada3 => en3, selector => selector_tb, salida => salida_tb);

    -- Proceso de estímulo
    process
    begin
        -- Valores de entrada de prueba
        en0 <= '1';
        en1 <= '0';
        en2 <= '0';
        en3 <= '0';
        selector_tb <= "00";
        wait for 10 ns;

        en0 <= '0';
        en1 <= '1';
        en2 <= '0';
        en3 <= '0';
        selector_tb <= "01";
        wait for 10 ns;

        en0 <= '0';
        en1 <= '0';
        en2 <= '1';
        en3 <= '0';
        selector_tb <= "10";
        wait for 10 ns;

        en0 <= '0';
        en1 <= '0';
        en2 <= '0';
        en3 <= '1';
        selector_tb <= "11";
        wait for 10 ns;

        wait;
    end process;

end architecture arch;