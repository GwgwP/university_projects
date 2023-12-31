library IEEE;
use IEEE.STD_LOGIC_1164.all;

ENTITY Ergasia IS
PORT ( x1, x2, x3, x4 : IN STD_LOGIC ;
		 f				: OUT STD_LOGIC ) ;
END Ergasia;

ARCHITECTURE Behavior OF Ergasia IS 
BEGIN
    f <= (x3 and x4) or (not x1 and x2);
END Behavior; 
	