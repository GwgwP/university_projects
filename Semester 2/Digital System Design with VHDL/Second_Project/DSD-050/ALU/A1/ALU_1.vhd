library ieee;
use ieee.std_logic_1164.all;
package Basic is

	component ALU_1 
		port (a,b, sa, sb, cin: in std_logic; -- sa = select a & sb= select b
            operation : in std_logic_vector ( 1 downto 0);
            result, cout : out std_logic);
	end component;
			
end package Basic;
--****************************************************

--andGate
library ieee;
use ieee.std_logic_1164.all;
ENTITY andGate IS
    PORT( ain, bin: in std_logic; -- ain = a inverted, bin=b inverted 
        f_and : out std_logic);
END andGate;

ARCHITECTURE structure OF andGate IS
BEGIN
    f_and <= ain AND bin;
END structure;
--************************************************

--orGate
library ieee;
use ieee.std_logic_1164.all;
ENTITY orGate IS
    PORT( ain, bin: in std_logic;
        f_or: out std_logic);
END orGate;

ARCHITECTURE structure OF orGate IS
BEGIN
    f_or <= ain OR bin;
END structure;
--************************************************

--xorGate
library ieee;
use ieee.std_logic_1164.all;
ENTITY xorGate IS
    PORT( ain, bin: in std_logic;
        f_xor: out std_logic);
END xorGate;

ARCHITECTURE structure OF xorGate IS
BEGIN
    f_xor <= ain XOR bin;
END structure;
--************************************************

--FULL ADDER 
LIBRARY ieee ;
USE ieee.std_logic_1164.all ;

ENTITY fullAdder IS
	PORT ( cin, ain, bin : IN STD_LOGIC ;
			ff, cout : OUT STD_LOGIC ) ; -- ff= to apotelesma tou full adder 
END fullAdder;

ARCHITECTURE LogicFunc OF fullAdder IS
BEGIN
	ff <= (ain and not bin and not cin) or (not ain and bin and not cin) or (not ain and not bin and cin) or (ain and bin and cin) ; 
	cout <= (bin AND cin) OR (ain AND cin) OR (ain AND bin) ; 
END LogicFunc ;
--************************************************

--A/B INVERT
LIBRARY ieee ;
USE ieee.std_logic_1164.all ;

ENTITY mux2to1 IS
	PORT ( x, y, s : IN STD_LOGIC ;
			f :OUT STD_LOGIC ) ;
END mux2to1;

ARCHITECTURE beh of mux2to1 is
begin 
	with s select
	f <= x when '0',
		  y when others;
end beh;
--************************************************

--MULTIPLEXER4to1
library ieee;
use ieee.std_logic_1164.all;

entity my_mux4to1 is
	port (f_and, f_or, ff, f_xor: in std_logic;
			s: in std_logic_vector(1 downto 0);
			f4: out std_logic);		
end my_mux4to1;

architecture mux of my_mux4to1 is
begin
	with s select
	f4 <= f_and WHEN "00",
			f_or WHEN "01",
		   ff  WHEN "10",
		   f_xor WHEN OTHERS ;
END mux ;
--************************************************

--COMBINATION
library ieee;
use ieee.std_logic_1164.all;

entity ALU_1 is 
    port (a,b, sa, sb, cin: in std_logic;
            operation : in std_logic_vector ( 1 downto 0);
            result, cout : out std_logic);
end ALU_1;

architecture structural of ALU_1 is 

	component mux2to1
		port ( x, y, s : in std_logic; 
				f: out std_logic);
	end component;
	--Gate And 
	component andGate
		port (ain, bin: in std_logic;  -- a inverted and b inverted
				f_and: out std_logic);
	end component;
	
	
	-- Gate OR 
	component orGate 
		port (ain, bin: in std_logic;  
				f_or: out std_logic);
	end component;
	
	
	-- FULL ADDER
	component fullAdder 
		port (cin, ain, bin : in std_logic;
				ff, cout : out std_logic);
	end component;
	
	
	--Gate xor
	component xorGate
		port (ain, bin: in std_logic;
				f_xor: out std_logic);
	end component;	
	
	
	-- MULTIPLEXER 4 SE 1
	component my_mux4to1
		PORT (f_and, f_or, ff, f_xor : IN STD_LOGIC ;
				s : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
				f4 : OUT STD_LOGIC ) ;
	end component;


   signal f_and, f_or, f_xor, ff, f_a, f_b : std_logic;
	begin 
		stage0 : mux2to1 port map (a, not a, sa, f_a);
		stage1 : mux2to1 port map (b, not b, sb, f_b);
		stage2 : andGate port map (f_a, f_b, f_and);
		stage3 : orGate port map (f_a, f_b, f_or);
		stage4 : fullAdder port map (cin , f_a , f_b , ff, cout);
		stage5 : xorGate port map (f_a, f_b, f_xor);
		stage6 : my_mux4to1 port map (f_and, f_or, ff, f_xor, operation(1 downto 0), result );
	
end structural; 