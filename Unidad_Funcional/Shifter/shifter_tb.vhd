library IEEE;
use IEEE.std_logic_1164.all;

entity shifter_tb is
end entity shifter_tb;

architecture arch of shifter_tb is
    component shifter
        port (
            A : in std_logic_vector(7 downto 0);
            S : in std_logic_vector(1 downto 0);
            R : out std_logic_vector(7 downto 0)
        );
    end component;

    signal A_tb: std_logic_vector(7 downto 0);
    signal S_tb: std_logic_vector(1 downto 0);
    signal R_tb: std_logic_vector(7 downto 0);

begin
    test: shifter port map (A => A_tb, S => S_tb, R => R_tb);

    process
    begin
        -- Valores de entrada de prueba
        A_tb <= "11111111";
        S_tb <= "00";
        wait for 10 ns;

        A_tb <= "11111111";
        S_tb <= "01";
        wait for 10 ns;

        A_tb <= "10101010";
        S_tb <= "10";
        wait for 10 ns;

        A_tb <= "11001100";
        S_tb <= "11";
        wait for 10 ns;

        wait;
    end process;

end architecture arch;