library IEEE;
use IEEE.std_logic_1164.all;

entity Unidad_Logica_tb is
end Unidad_Logica_tb;

architecture arch of Unidad_Logica_tb is
    component Unidad_Logica is
        port (
            A, B: in std_logic_vector(7 downto 0);
            S: in std_logic_vector(2 downto 0);
            R: out std_logic_vector(7 downto 0)
        );
    end component;

    signal A_tb, B_tb: std_logic_vector(7 downto 0);
    signal S_tb: std_logic_vector(2 downto 0);
    signal R_tb: std_logic_vector(7 downto 0);

begin
    test: Unidad_Logica port map (A => A_tb, B => B_tb, S => S_tb, R => R_tb);

    -- Estímulos
    stim_process: process
    begin
        A_tb <= "01010101";
        B_tb <= "00110011";
        S_tb <= "000";
        wait for 10 ns;

        A_tb <= "11111111";
        B_tb <= "00000000";
        S_tb <= "001";
        wait for 10 ns;

        A_tb <= "01010101";
        B_tb <= "00110011";
        S_tb <= "010";
        wait for 10 ns;

        A_tb <= "01010101";
        B_tb <= "00110011";
        S_tb <= "011";
        wait for 10 ns;

        A_tb <= "01010101";
        B_tb <= "00110011";
        S_tb <= "100";
        wait for 10 ns;

        A_tb <= "01010101";
        B_tb <= "00110011";
        S_tb <= "101";
        wait for 10 ns;

        A_tb <= "01010101";
        B_tb <= "00110011";
        S_tb <= "110";

        A_tb <= "01010101";
        B_tb <= "00110011";
        S_tb <= "111";
        wait for 10 ns;
        wait;
    end process;

end arch;
