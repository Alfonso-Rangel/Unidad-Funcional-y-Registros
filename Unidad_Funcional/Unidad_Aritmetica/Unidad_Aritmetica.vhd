library IEEE;
use IEEE.std_logic_1164.all;

entity Unidad_Aritmetica is
	port (
		A, B: in std_logic_vector(7 downto 0);
		S : in std_logic_vector(2 downto 0);
		R: out std_logic_vector(7 downto 0);
		c, v, z, sig: out std_logic
	);
end Unidad_Aritmetica;

architecture arch of Unidad_Aritmetica is
	component Sumador8Bits is
		port (
			A, B: in std_logic_vector (7 downto 0);
			cin: in std_logic;
			R: out std_logic_vector (7 downto 0);
			cout: out std_logic;
			v: out std_logic
		);
	end component Sumador8Bits;

	signal Ap, Bp: std_logic_vector(7 downto 0);
	signal cin: std_logic;
	signal R_aux: std_logic_vector(7 downto 0);

	begin

	-- Ap = AS2’S1’ + AS0’ + S2S1’S0
	Ap(0) <= (A(0) and not(S(2)) and not(S(1))) or (A(0) and not(S(0))) or (S(2) and not(S(1)) and S(0));
    Ap(1) <= (A(1) and not(S(2)) and not(S(1))) or (A(1) and not(S(0))) or (S(2) and not(S(1)) and S(0));
    Ap(2) <= (A(2) and not(S(2)) and not(S(1))) or (A(2) and not(S(0))) or (S(2) and not(S(1)) and S(0));
    Ap(3) <= (A(3) and not(S(2)) and not(S(1))) or (A(3) and not(S(0))) or (S(2) and not(S(1)) and S(0));
    Ap(4) <= (A(4) and not(S(2)) and not(S(1))) or (A(4) and not(S(0))) or (S(2) and not(S(1)) and S(0));
    Ap(5) <= (A(5) and not(S(2)) and not(S(1))) or (A(5) and not(S(0))) or (S(2) and not(S(1)) and S(0));
    Ap(6) <= (A(6) and not(S(2)) and not(S(1))) or (A(6) and not(S(0))) or (S(2) and not(S(1)) and S(0));
    Ap(7) <= (A(7) and not(S(2)) and not(S(1))) or (A(7) and not(S(0))) or (S(2) and not(S(1)) and S(0));

	-- Bp = BS2’S1’S0’ + B’S2’S1’S0 + BS1S0 + S2S1’S0’ + BS2S0
	Bp(0) <= ((B(0) and not(S(2)) and not(S(1)) and not(S(0))) or (not(B(0)) and not(S(2)) and not(S(1)) and S(0)) or (B(0) and S(1) and S(0)) or (S(2) and not(S(1)) and not(S(0))) or (B(0) and S(2) and S(0)));
	Bp(1) <= ((B(1) and not(S(2)) and not(S(1)) and not(S(0))) or (not(B(1)) and not(S(2)) and not(S(1)) and S(0)) or (B(1) and S(1) and S(0)) or (S(2) and not(S(1)) and not(S(0))) or (B(1) and S(2) and S(0)));
	Bp(2) <= ((B(2) and not(S(2)) and not(S(1)) and not(S(0))) or (not(B(2)) and not(S(2)) and not(S(1)) and S(0)) or (B(2) and S(1) and S(0)) or (S(2) and not(S(1)) and not(S(0))) or (B(2) and S(2) and S(0)));
	Bp(3) <= ((B(3) and not(S(2)) and not(S(1)) and not(S(0))) or (not(B(3)) and not(S(2)) and not(S(1)) and S(0)) or (B(3) and S(1) and S(0)) or (S(2) and not(S(1)) and not(S(0))) or (B(3) and S(2) and S(0)));
	Bp(4) <= ((B(4) and not(S(2)) and not(S(1)) and not(S(0))) or (not(B(4)) and not(S(2)) and not(S(1)) and S(0)) or (B(4) and S(1) and S(0)) or (S(2) and not(S(1)) and not(S(0))) or (B(4) and S(2) and S(0)));
	Bp(5) <= ((B(5) and not(S(2)) and not(S(1)) and not(S(0))) or (not(B(5)) and not(S(2)) and not(S(1)) and S(0)) or (B(5) and S(1) and S(0)) or (S(2) and not(S(1)) and not(S(0))) or (B(5) and S(2) and S(0)));
	Bp(6) <= ((B(6) and not(S(2)) and not(S(1)) and not(S(0))) or (not(B(6)) and not(S(2)) and not(S(1)) and S(0)) or (B(6) and S(1) and S(0)) or (S(2) and not(S(1)) and not(S(0))) or (B(6) and S(2) and S(0)));
	Bp(7) <= ((B(7) and not(S(2)) and not(S(1)) and not(S(0))) or (not(B(7)) and not(S(2)) and not(S(1)) and S(0)) or (B(7) and S(1) and S(0)) or (S(2) and not(S(1)) and not(S(0))) or (B(7) and S(2) and S(0)));

	--S2’S0 + S2’S1
	cin <= (not(S(2)) and S(0)) or (not(S(2)) and S(1));

	Sum: Sumador8Bits port map (Ap, Bp, cin, R_aux, c, v);


	R <= R_aux; -- Asignamos el resultado a la salida R

	-- Asignamos las señales de salida
	z <= '1' when R_aux = "00000000" else '0'; -- Z es '1' si R_internal es 0, '0' en caso contrario
	sig <= R_aux(7); -- El bit más significativo de R_internal es el bit de signo

end arch;

