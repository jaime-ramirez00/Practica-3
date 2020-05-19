  
library ieee;
use ieee.std_logic_1164.all;
entity updown is
    Port ( clk, sel: in bit; u, d: out bit_vector(3 downto 0));
end updown;

architecture behavior of updown is
component jk is 
port(clk, en,j,k: in bit; q, qn: out bit);
end component;
    signal selN,clka : bit;
    signal Q,Qn,J,K,Qa,Qan,Ja,Ka: bit_vector(3 downto 0);
begin
selN <= not sel;
K(0)<= '1';
J(0)<='1';
K(1)<=(selN and Q(0)) or (sel and Qn(0));
J(1)<=(selN and Q(0) and Qn(3)) or (sel and Q(2) and Qn(0)) or (sel and Qn(0) and Q(3));
K(2)<=(selN and Q(1) and Q(0)) or (sel and Qn(1) and Qn(0));
J(2)<=(selN and Q(1) and Q(0)) or (sel and Q(3) and Qn(0));
K(3)<=(selN and Q(0)) or (sel and Qn(0));
J(3)<= (selN and Q(0) and Q(1) and Q(2)) or (sel and Qn(0) and Qn(1) and Qn(2));
jk1: jk port map(clk,'1',J(0),K(0),Q(0),Qn(0));
jk2: jk port map(clk,'1',J(1),K(1),Q(1),Qn(1));
jk3: jk port map(clk,'1',J(2),K(2),Q(2),Qn(2));
jk4: jk port map(clk,'1',J(3),K(3),Q(3),Qn(3));
u(0) <= Q(0);
u(1) <= Q(1);
u(2) <= Q(2);
u(3) <= Q(3);
 clka <= (Q(0) and Qn(1) and Qn(2) and Q(3) and selN) or (Qn(0) and Qn(1) and Qn(2) and Qn(3) and sel);
Ka(0)<='1';
Ja(0)<='1';
Ka(1)<=(selN and Qa(0)) or (sel and Qan(0));
Ja(1)<=(selN and Qan(3) and Qa(0)) or (sel and Qa(2) and Qan(0)) or (sel and Qa(3) and Qan(0));
Ka(2)<=(selN and Qa(1) and Qa(0)) or (sel and Qan(1) and Qan(0));
Ja(2)<=(selN and Qa(1) and Qa(0)) or (sel and Qa(3) and Qan(0));
Ka(3)<=(selN and Qa(0)) or (sel and Qan(0));
Ja(3)<=(selN and Qa(0) and Qa(1) and Qa(2)) or (sel and Qan(2) and Qan(1) and Qan(0));
 jk1a : jk port map(clk,clka,Ja(0),Ka(0),Qa(0),Qan(0));
 jk2a : jk port map(clk,clka,Ja(1),Ka(1),Qa(1),Qan(1));
 jk3a : jk port map(clk,clka,Ja(2),Ka(2),Qa(2),Qan(2));
 jk4a : jk port map(clk,clka,Ja(3),Ka(3),Qa(3),Qan(3));
 d(0) <= Qa(0);
 d(1) <= Qa(1);
 d(2) <= Qa(2);
 d(3) <= Qa(3);
end behavior;