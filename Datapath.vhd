library IEEE;
use IEEE.std_logic_1164.all;

entity Datapath is
    port (
        clk : in std_logic;
        N : in std_logic_vector(7 downto 0);
        W, C : in std_logic;
        SR, SA, SB : in std_logic_vector(2 downto 0);
        S : in std_logic_vector(4 downto 0);
        R : out std_logic_vector(7 downto 0);
        carry, v, z, sig : out std_logic
    );
end Datapath;

architecture arch of Datapath is
    component Unidad_Funcional is
        port(
            A, B : in std_logic_vector(7 downto 0);
            S : in std_logic_vector(4 downto 0);
            R : out std_logic_vector(7 downto 0);
            carry, v, z, sig : out std_logic
        );
    end component Unidad_Funcional;

    component Unidad_Registros is
        port (
            N : in std_logic_vector(7 downto 0);
            W, clk, C : in std_logic;
            SR, SA, SB : in std_logic_vector(2 downto 0);
            A, B : out std_logic_vector(7 downto 0)
        );
    end component Unidad_Registros;

    -- Declaración de señales internas para la conexión
    signal A_reg, B_reg : std_logic_vector(7 downto 0);


begin
    -- Instancia la Unidad_Registros y conecta sus puertos
    UReg : Unidad_Registros port map (N, W, clk, C, SR, SA, SB, A_reg, B_reg);

    -- Instancia la Unidad_Funcional y conecta sus puertos
    UFunc : Unidad_Funcional port map (A_reg, B_reg, S, R, carry, v, z, sig);

end arch;
