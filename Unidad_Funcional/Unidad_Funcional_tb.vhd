library IEEE;
use IEEE.std_logic_1164.all;

entity Unidad_Funcional_tb is
end Unidad_Funcional_tb;

architecture arch of Unidad_Funcional_tb is
    component Unidad_Funcional
        port(
            A, B : in std_logic_vector(7 downto 0);
            S : in std_logic_vector(4 downto 0);
            R : out std_logic_vector(7 downto 0);
            carry, v, z, sig: out std_logic
        );
    end component;


    
    signal A_tb, B_tb: std_logic_vector(7 downto 0);
    signal S_tb: std_logic_vector(4 downto 0);
    signal R_tb: std_logic_vector(7 downto 0);
    signal carry_tb, v_tb, z_tb, sig_tb: std_logic;

begin
    test: Unidad_Funcional port map (A => A_tb, B => B_tb, S => S_tb, R => R_tb, carry => carry_tb, v => v_tb, z => z_tb, sig => sig_tb);
    
    process
    begin
        A_tb <= (others => '0');
        B_tb <= (others => '0');
        S_tb <= (others => '0');
        
        -- Test case 1: SUMA A B
        A_tb <= "00000001";
        B_tb <= "00000010";
        S_tb <= "00000";
        wait for 10 ns;
        
        -- Test case 2: RESTA A B 
        A_tb <= "01010101";
        B_tb <= "10101010";
        S_tb <= "00001";
        wait for 10 ns;
        
        -- Test case 3: INC A
        A_tb <= "11001100";
        B_tb <= "00000000";
        S_tb <= "00010";
        wait for 10 ns;
        
        -- Test case 4: INC B
        A_tb <= "11111111";
        B_tb <= "00000000";
        S_tb <= "00011";
        wait for 10 ns;
        
        -- Test case 5: DEC A
        A_tb <= "00000001";
        B_tb <= "11111110";
        S_tb <= "00100";
        wait for 10 ns;
        
        -- Test case 6: DEC B
        A_tb <= "10101010";
        B_tb <= "01010101";
        S_tb <= "00101";
        wait for 10 ns;
        
        -- Test case 7: TRANSF A
        A_tb <= "01010101";
        B_tb <= "10101010";
        S_tb <= "00110";
        wait for 10 ns;
        
        -- Test case 8: TRANSF B
        A_tb <= "11110000";
        B_tb <= "00001111";
        S_tb <= "00111";
        wait for 10 ns;
        
        -- Test case 9: NOT A
        A_tb <= "11001100";
        B_tb <= "00110011";
        S_tb <= "01000";
        wait for 10 ns;
        
        -- Test case 10: NOT B
        A_tb <= "00110011";
        B_tb <= "11001100";
        S_tb <= "01001";
        wait for 10 ns;
        
        -- Test case 11: A AND B
        A_tb <= "11111111";
        B_tb <= "00000001";
        S_tb <= "01010";
        wait for 10 ns;
        
        -- Test case 12: A OR B
        A_tb <= "00000010";
        B_tb <= "11111111";
        S_tb <= "01011";
        wait for 10 ns;
        
        -- Test case 13: A NAND B 
        A_tb <= "10101010";
        B_tb <= "01010101";
        S_tb <= "01100";
        wait for 10 ns;
        
        -- Test case 14: A NOR C
        A_tb <= "01010101";
        B_tb <= "10101010";
        S_tb <= "01101";
        wait for 10 ns;
        
        -- Test case 15: A XOR B
        A_tb <= "00000001";
        B_tb <= "00000010";
        S_tb <= "01110";
        wait for 10 ns;
        
        -- Test case 16: A XNOR B
        A_tb <= "11111111";
        B_tb <= "11111111";
        S_tb <= "01111";
        wait for 10 ns;
        
        -- Test case 17: DES →
        A_tb <= "00000000";
        B_tb <= "00000001";
        S_tb <= "10000";
        wait for 10 ns;
        
        -- Test case 18: DES ←
        A_tb <= "11111111";
        B_tb <= "11111110";
        S_tb <= "10001";
        wait for 10 ns;
        
        -- Test case 19: ROT ⟳
        A_tb <= "00111100";
        B_tb <= "11000011";
        S_tb <= "10010";
        wait for 10 ns;
        
        -- Test case 20: ROT ⟲
        A_tb <= "01010101";
        B_tb <= "01010101";
        S_tb <= "10011";
        wait for 10 ns;
        
        wait;
    end process;

end arch;
