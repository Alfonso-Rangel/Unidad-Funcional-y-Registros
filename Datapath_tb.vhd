library IEEE;
use IEEE.std_logic_1164.all;

entity Datapath_tb is
end Datapath_tb;

architecture arch of Datapath_tb is
    component Datapath is
        port (
            clk : in std_logic;
            N : in std_logic_vector(7 downto 0);
            W, C : in std_logic;
            SR, SA, SB : in std_logic_vector(2 downto 0);
            S : in std_logic_vector(4 downto 0);
            R : out std_logic_vector(7 downto 0);
            carry, v, z, sig : out std_logic
        );
    end component Datapath;

    -- Señales de entrada
    signal clk_tb : std_logic;
    signal N_tb : std_logic_vector(7 downto 0);
    signal W_tb, C_tb : std_logic;
    signal SR_tb, SA_tb, SB_tb : std_logic_vector(2 downto 0);
    signal S_tb : std_logic_vector(4 downto 0);

    -- Señales de salida
    signal R_tb : std_logic_vector(7 downto 0);
    signal carry_tb, v_tb, z_tb, sig_tb : std_logic;
    constant clk_period : time := 10 ns;


begin
    -- Instanciar el componente Datapath
    test: Datapath port map (
        clk => clk_tb, 
        N => N_tb, 
        W => W_tb, 
        C => C_tb, 
        SR => SR_tb, 
        SA => SA_tb, 
        SB => SB_tb, 
        S => S_tb, 
        R => R_tb, 
        carry => carry_tb, 
        v => v_tb,
        z => z_tb,
        sig => sig_tb
    );

    clk_process: process
    begin
        while now < 1000 ns loop
            clk_tb <= '0';
            wait for clk_period / 2;
            clk_tb <= '1';
            wait for clk_period / 2;
        end loop;
        wait;
    end process;

    process
    begin

        -- Inicialización
        N_tb <= "00000000";
        W_tb <= '0';
        C_tb <= '0';
        SR_tb <= "000";
        SA_tb <= "000";
        SB_tb <= "000";
        S_tb <= "00000";
        wait for 10 ns;

        -- Guarda un 7 en el registro 001
        N_tb <= "00000111";
        W_tb <= '1';
        SR_tb <= "001";
        SA_tb <= "000";
        SB_tb <= "000";
        S_tb <= "00000";
        wait for 10 ns;

        -- Guarda un 8 en el registro 010
        N_tb <= "00001000";
        W_tb <= '1';
        SR_tb <= "010";
        SA_tb <= "000";
        SB_tb <= "000";
        S_tb <= "00000";
        wait for 10 ns;

        -- Suma A + B, carga los registros 001 y 010
        N_tb <= "00000000";
        W_tb <= '0';
        SR_tb <= "000";
        SA_tb <= "001";
        SB_tb <= "010";
        S_tb <= "00000";
        wait for 10 ns;

        -- Guarda un 255 en el registro 011
        N_tb <= "11111111";
        W_tb <= '1';
        SR_tb <= "011";
        SA_tb <= "000";
        SB_tb <= "000";
        S_tb <= "00000";
        wait for 10 ns;

        -- Incrementa el contenido del registro 011 lo cual provoca un desbordamiento
        N_tb <= "00000000";
        W_tb <= '0';
        SR_tb <= "000";
        SA_tb <= "011";
        SB_tb <= "000";
        S_tb <= "00010";
        wait for 10 ns;

        -- Guarda 11001100 en el registro 100
        N_tb <= "11001100";
        W_tb <= '1';
        SR_tb <= "100";
        SA_tb <= "000";
        SB_tb <= "000";
        S_tb <= "00000";
        wait for 10 ns;

        -- Realiza laoperación NOT A sobre el registro 100
        N_tb <= "00000000";
        W_tb <= '0';
        SR_tb <= "000";
        SA_tb <= "100";
        SB_tb <= "000";
        S_tb <= "01000";
        wait for 10 ns;

        -- Realiza laoperación A AND B  sobre el registro 100 y 011
        N_tb <= "00000000";
        W_tb <= '0';
        SR_tb <= "000";
        SA_tb <= "100";
        SB_tb <= "011";
        S_tb <= "01010";
        wait for 10 ns;

        -- Realiza desplazamiento derecha sobre 011
        N_tb <= "00000000";
        W_tb <= '0';
        SR_tb <= "000";
        SA_tb <= "011";
        SB_tb <= "000";
        S_tb <= "10000";
        wait for 10 ns;

        -- Realiza desplazamiento izquierda sobre 011
        N_tb <= "00000000";
        W_tb <= '0';
        SR_tb <= "000";
        SA_tb <= "011";
        SB_tb <= "000";
        S_tb <= "10001";
        wait for 10 ns;

        -- Realiza rotación derecha sobre 100
        N_tb <= "00000000";
        W_tb <= '0';
        SR_tb <= "000";
        SA_tb <= "100";
        SB_tb <= "000";
        S_tb <= "10010";
        wait for 10 ns;

        -- Realiza rotación izquierda sobre 100
        N_tb <= "00000000";
        W_tb <= '0';
        SR_tb <= "000";
        SA_tb <= "100";
        SB_tb <= "000";
        S_tb <= "10011";
        wait for 10 ns;

        wait;
    end process;

end arch;
