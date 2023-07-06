library IEEE;
use IEEE.std_logic_1164.all;

entity registro_tb is
end registro_tb;

architecture arch of registro_tb is
    -- Component declaration for the D flip-flop (FFD)
    component FFD
        port (
            D, W, C, clk: in  std_logic; 
            Q: out  std_logic
        );
    end component;

    -- Signal declarations
    signal A : std_logic_vector(7 downto 0);
    signal W, clk, C : std_logic;
    signal R : std_logic_vector(7 downto 0);
    
    -- Clock period definition
    constant clk_period : time := 10 ns;

begin
    -- Instantiate the register
    DUT: entity work.registro
        port map (
            A => A,
            W => W,
            clk => clk,
            C => C,
            R => R
        );
    
    -- Clock generation process
    clk_process: process
    begin
        while now < 1000 ns loop
            clk <= '0';
            wait for clk_period / 2;
            clk <= '1';
            wait for clk_period / 2;
        end loop;
        wait;
    end process;
    
    -- Stimulus process
    stimulus_process: process
    begin
        -- Initialize inputs
        A <= (others => '0');
        W <= '0';
        C <= '0';
        
        -- Apply stimulus
        wait for 20 ns; -- Wait for initial conditions
        
        -- Test case 1
        A <= "11001100";
        W <= '1';
        C <= '0';
        wait for 10 ns;
        W <= '0';
        wait for 10 ns;
        
        -- Test case 2
        A <= "00110011";
        W <= '1';
        C <= '1';
        wait for 10 ns;
        W <= '0';
        wait for 10 ns;
        
        wait;
    end process;
end arch;
