--Componente flip flop jk para contador de horas y minutos
library IEEE;
use IEEE.std_logic_1164.all;
entity jk is
port(clk, en,j,k: in bit; q, qn: out bit);
end jk;
architecture behavior of jk is
signal Qaux: bit:='0';
begin
process(clk,j,k)
begin
if clk ='1' and clk'event and en='1' then
if (j='0') and (k='1') then
Qaux<='0';
elsif (j='1') and (k='0') then
Qaux<='1';
elsif (j='1') and (k='1') then
Qaux<= not Qaux;
else Qaux<= Qaux;
end if;
end if;
end process;
q<=Qaux;
qn<= not Qaux;
end behavior;
