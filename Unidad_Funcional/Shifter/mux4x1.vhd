library IEEE;
use IEEE.std_logic_1164.all;

entity mux4x1 is 
    port(
        entrada0, entrada1, entrada2, entrada3 : in std_logic;
        selector : in std_logic_vector(1 downto 0);
        salida : out std_logic
    );
end mux4x1;

architecture A_mux4x1 of mux4x1 is
begin
    with selector select
        salida <= entrada0 when "00",
                  entrada1 when "01",
                  entrada2 when "10",
                  entrada3 when others;
end A_mux4x1;