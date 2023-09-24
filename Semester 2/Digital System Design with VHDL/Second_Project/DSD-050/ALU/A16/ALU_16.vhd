LIBRARY ieee ;
USE ieee.std_logic_1164.all ;

entity control_circuit is
	port ( opcode : in std_logic_vector(2 downto 0);
			 operation:out std_logic_vector(1 downto 0);
			 ain:out std_logic;
			 bin:out std_logic;
			 carryin:out std_logic);
end control_circuit;

architecture behavioral of control_circuit is
begin 
	process(opcode)
	begin
	case opcode is
	
	--and--
	when "000" =>
		operation <= "00";
		ain <= '0';
		bin <= '0';
		carryin <= '0';
	--or--
	when "001" =>
		operation <= "01";
		ain <= '0';
		bin <= '0';
		carryin <= '0';
	--add--
	when "010" =>
		operation <= "10";
		ain <= '0';
		bin <= '0';
		carryin <= '0';
	--sub--
	when "011" =>
		operation <= "10";
		ain <= '0';
		bin <= '1';
		carryin <= '1';
	--nor--
	when "100" =>
		operation <= "00";
		ain <= '1';
		bin <= '1';
		carryin <= '0';
	--nand--
	when "101" =>
		operation <= "01";
		ain <= '1';
		bin <= '1';
		carryin <= '0';
	--xor--
	when "110" =>
		operation <= "11";
		ain <= '0';
		bin <= '0';
		carryin <= '0';
	--adiaforh timh--
	when others =>
		operation <= "00";
		ain <= '0';
		bin <= '0';
		carryin <= '0';
	end case;
	end process;
end behavioral;

LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
library work;
use work.Basic.all;

-- alu 16*****************************************************************
entity ALU_16 is 
	 port (
			  a:          in  std_logic_vector (15 downto 0);
			  b:          in  std_logic_vector (15 downto 0);
			  opcode:     in  std_logic_vector (2 downto 0);--leitourgia pou 8a pragmatopoih8ei(and, or ,add, sub,nor, nand, xor)--
			  f:     out std_logic_vector (15 downto 0);--result of the ALU_16 
			  overflow:   out std_logic);--overflow an yparxei--
		 
	end ALU_16;

	architecture structural of ALU_16 is 
	component ALU_1 
		port (a,b, sa, sb, cin: in std_logic;
					operation : in std_logic_vector ( 1 downto 0);
					result, cout : out std_logic);
	end component;


	--control circuit**********************************************************
	component control_circuit 
	port ( 	 opcode : in std_logic_vector(2 downto 0);
				 operation:out std_logic_vector(1 downto 0);
				 ain:out std_logic;
				 bin:out std_logic;
				 carryin:out std_logic);
	end component;

	signal ain: std_logic;
	signal bin: std_logic;
	signal operation: std_logic_vector(1 downto 0);
	signal carry: std_logic_vector(16 downto 0);
	
	begin 
		controlcircuit: control_circuit port map (opcode, operation, ain, bin, carry(0)); -- carry (0) = carry in tis 1is alu. 
		G1:for i in 0 to 15 generate
				ALU16: ALU_1 port map (a(i), b(i), ain, bin, carry(i), operation, f(i), carry(i + 1));
			end generate;
		Stage0:with opcode select	
					overflow<=carry(16) xor carry(15) when "010",--vlepw an exw yperxeilish
								 carry(16) xor carry(15) when "011",
								 '0' when others;
end structural;