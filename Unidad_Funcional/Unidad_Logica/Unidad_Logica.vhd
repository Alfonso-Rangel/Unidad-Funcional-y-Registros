library IEEE;
use IEEE.std_logic_1164.all;

entity Unidad_Logica is
    port (
        A, B: in std_logic_vector(7 downto 0);
        S: in std_logic_vector(2 downto 0);
        R: out std_logic_vector(7 downto 0)
    );
end Unidad_Logica;

architecture arch of Unidad_Logica is
begin
    R <= 
        -- NOT A
        not A when S = "000" else
        -- NOT B
        not B when S = "001" else
        -- A AND B 
        (A and B) when S = "010" else
        -- A OR B
        (A or B) when S = "011" else
        -- A NAND B 
        not (A and B) when S = "100" else
        -- A NOR B
        not (A or B) when S = "101" else
        -- A XOR B
        (A xor B) when S = "110" else
        -- A XNOR B
        not (A xor B);
end arch;
