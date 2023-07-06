library IEEE;
use IEEE.std_logic_1164.all;

entity Unidad_Funcional is 
    port(
        A, B : in std_logic_vector(7 downto 0);
        S : in std_logic_vector(4 downto 0);
        R : out std_logic_vector(7 downto 0);
        carry, v, z, sig: out std_logic
    );
end Unidad_Funcional;

architecture arch of Unidad_Funcional is
    component Unidad_Aritmetica is 
        port (
            A, B: in std_logic_vector(7 downto 0);
            S : in std_logic_vector(2 downto 0);
            R: out std_logic_vector(7 downto 0);
            c, v, z, sig: out std_logic
        );
    end component;

    component Unidad_Logica is
        port (
            A, B: in std_logic_vector(7 downto 0);
            S: in std_logic_vector(2 downto 0);
            R: out std_logic_vector(7 downto 0)
        );
    end component;

    component shifter is
        port (
            A : in std_logic_vector(7 downto 0);
            S : in std_logic_vector(1 downto 0);
            R : out std_logic_vector(7 downto 0)
        );
    end component;

    signal arith_R : std_logic_vector(7 downto 0);
    signal logic_R : std_logic_vector(7 downto 0);
    signal shift_R : std_logic_vector(7 downto 0);
    signal selector : std_logic_vector(1 downto 0);

begin

    -- Instancias de los componentes
    UA: Unidad_Aritmetica port map(A, B, S(2 downto 0), arith_R, carry, v, z, sig);
    UL: Unidad_Logica port map(A, B, S(2 downto 0), logic_R);
    US: shifter port map(A, S(1 downto 0), shift_R);
    selector <= S(4 downto 3);

    R <= arith_R when selector = "00" else
         logic_R when selector = "01" else 
         shift_R when selector = "10" else 
         "00000000";

end arch;
