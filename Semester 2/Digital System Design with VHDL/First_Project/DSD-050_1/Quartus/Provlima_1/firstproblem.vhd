library IEEE;
use ieee.std_logic_1164.all;

--and me dyo pyles

entity and_2 is 
port (in1, in2 :in std_logic; out1		:out std_logic);
end and_2;

architecture behand of and_2 is
begin 
out1	<= in1 and in2;
end behand;

-- and me treis pyles
library IEEE;
use ieee.std_logic_1164.all;

entity and_3 is 
port (in1, in2, in3 :in std_logic; out2		:out std_logic);
end and_3;

architecture behand of and_3 is
begin 
out2	<= in1 and in2 and in3;
end behand;

--or me treis pyles
library IEEE;
use ieee.std_logic_1164.all;

entity or_5 is 
port (in1, in2, in3, in4, in5 :in std_logic; out3		:out std_logic);
end or_5;

architecture behor of or_5 is
begin 
out3	<= in1 or in2 or in3 or in4 or in5;
end behor;

--first problem

library IEEE;
use ieee.std_logic_1164.all;

entity firstproblem is
	port(x1, x2, x3, x4, x5:in std_logic;
			f:out std_logic);
end firstproblem;

architecture structural of firstproblem is 
		component and_2 
			port(in1,in2:in std_logic;
					out1:out std_logic);
		end component;
		component and_3 
			port(in1,in2,in3:in std_logic;
					out2:out std_logic);
		end component;
		component or_5
			port (in1,in2, in3, in4, in5:in std_logic;
					out3: out std_logic);
		end component;
signal n0, n1, n2, n3, n4:std_logic;
begin 
	I0:and_2 port map (not x5, not x3, n0);
	I1:and_2 port map (not x5, not x4, n1);
	I2:and_3 port map (x2,not x1,not x5, n2);
	I3:and_3 port map (x2, x4, x5, n3);
	I4:and_3 port map (not x2,not x1,not x4, n4);
	I5:or_5 port map (n0, n1, n2, n3, n4, f);
end structural;