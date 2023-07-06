library IEEE;
use IEEE.std_logic_1164.all;

entity Unidad_Registros is
    port (
        N : in std_logic_vector(7 downto 0);
        W, clk, C: in std_logic;
        SR, SA, SB: in std_logic_vector(2 downto 0);
        A, B : out std_logic_vector(7 downto 0)
    );
end Unidad_Registros;

architecture arch of Unidad_Registros is
    component registro is
        port (
            A : in std_logic_vector (7 downto 0);
            W, clk, C : in std_logic;
            R : out std_logic_vector(7 downto 0)
        );    
    end component;

    signal reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7 : std_logic_vector(7 downto 0);
    signal w0, w1, w2, w3, w4, w5, w6, w7 : std_logic;
     

begin

    w0 <= W and not(SR(2)) and not(SR(1)) and not(SR(0));
    w1 <= W and not(SR(2)) and not(SR(1)) and     SR(0);
    w2 <= W and not(SR(2)) and     SR(1)  and not(SR(0));
    w3 <= W and not(SR(2)) and     SR(1)  and     SR(0);
    w4 <= W and     SR(2)  and not(SR(1)) and not(SR(0));
    w5 <= W and     SR(2)  and not(SR(1)) and     SR(0);
    w6 <= W and     SR(2)  and     SR(1)  and not(SR(0));
    w7 <= W and     SR(2)  and     SR(1)  and     SR(0);

    -- Instancias de los registros
    registro0: registro port map (N, w0, clk, C, reg0);
    registro1: registro port map (N, w1, clk, C, reg1);
    registro2: registro port map (N, w2, clk, C, reg2);
    registro3: registro port map (N, w3, clk, C, reg3);
    registro4: registro port map (N, w4, clk, C, reg4);
    registro5: registro port map (N, w5, clk, C, reg5);
    registro6: registro port map (N, w6, clk, C, reg6);
    registro7: registro port map (N, w7, clk, C, reg7);

    -- Asignación de salidas según los selectores, esto es equivalente a usar MUX
    A <= reg0 when SA = "000" else
         reg1 when SA = "001" else
         reg2 when SA = "010" else
         reg3 when SA = "011" else
         reg4 when SA = "100" else
         reg5 when SA = "101" else
         reg6 when SA = "110" else
         reg7;

    B <= reg0 when SB = "000" else
         reg1 when SB = "001" else
         reg2 when SB = "010" else
         reg3 when SB = "011" else
         reg4 when SB = "100" else
         reg5 when SB = "101" else
         reg6 when SB = "110" else
         reg7;
end arch;