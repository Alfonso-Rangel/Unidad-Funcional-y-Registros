library IEEE;
use IEEE.std_logic_1164.all;

--FFD con se�ales de control de: escritura (W) y borrado (C)
--
--Note que: el Flip-Flip solo se actualiza si W = 1, y se borra
--si C = 1. Considere las prioridades de las se�ales.

entity FFDwc is
port (D, W, C, clk: in std_logic; Q: out std_logic);
end FFDwc;

architecture funcional of FFDwc is
begin
  process (D, W, C, clk)
  begin
    if (clk'event and clk = '1') then
  	  if (W = '1') then 
        Q <= D;
      end if;
	  if (C = '1') then
	    Q <= '0';
	  end if;
    end if;
  end process;
end funcional;