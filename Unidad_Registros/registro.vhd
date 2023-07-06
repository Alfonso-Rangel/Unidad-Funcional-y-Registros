library IEEE;
use IEEE.std_logic_1164.all;

entity registro is
    port (
        A : in std_logic_vector (7 downto 0);
        W, clk, C : in std_logic;
        R : out std_logic_vector(7 downto 0)
    );
end registro;

architecture arch of registro is
    component FFDwc
        port (
            D, W, C, clk: in  std_logic; 
            Q: out  std_logic
        );
    end component;
    begin
        Registro0: FFDwc port map(A(0), W, C, clk, R(0));
        Registro1: FFDwc port map(A(1), W, C, clk, R(1));
        Registro2: FFDwc port map(A(2), W, C, clk, R(2));
        Registro3: FFDwc port map(A(3), W, C, clk, R(3));
        Registro4: FFDwc port map(A(4), W, C, clk, R(4));
        Registro5: FFDwc port map(A(5), W, C, clk, R(5));
        Registro6: FFDwc port map(A(6), W, C, clk, R(6));
        Registro7: FFDwc port map(A(7), W, C, clk, R(7));
end arch;