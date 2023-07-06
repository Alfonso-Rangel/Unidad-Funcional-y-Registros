library IEEE;
use IEEE.std_logic_1164.all;

entity shifter is 
    port (
        A : in std_logic_vector(7 downto 0);
        S : in std_logic_vector(1 downto 0);
        R : out std_logic_vector(7 downto 0)
    );
end shifter;

architecture arch of shifter is
    component mux4x1 is
        port (
            entrada0, entrada1, entrada2, entrada3 : in std_logic;
            selector : in std_logic_vector(1 downto 0);
            salida : out std_logic
        );
    end component;

begin
    mux7: mux4x1 port map('0' , A(6), A(0), A(6), S, R(7));
    mux6: mux4x1 port map(A(7), A(5), A(7), A(5), S, R(6));
    mux5: mux4x1 port map(A(6), A(4), A(6), A(4), S, R(5));
    mux4: mux4x1 port map(A(5), A(3), A(5), A(3), S, R(4));
    mux3: mux4x1 port map(A(4), A(2), A(4), A(2), S, R(3));
    mux2: mux4x1 port map(A(3), A(1), A(3), A(1), S, R(2));
    mux1: mux4x1 port map(A(2), A(0), A(2), A(0), S, R(1));
    mux0: mux4x1 port map(A(1), '0' , A(1), A(7), S, R(0));
end arch;