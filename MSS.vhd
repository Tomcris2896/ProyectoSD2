library ieee;
use ieee.std_logic_1164.all;


entity MSS is
port(	clock,resetn, Start, Comprar, Recargar, Agregar, Pagar, Tec_on, Usu_on, Dinero_on, Igual_1, Igual_2, Igual_3, Igual_4, Saldo_Insuficiente, Saldo_Correcto, Falta_Dinero, Placa_Coincide: in std_logic;
		PASAR, CUPO_INSUFICIENTE, LLENO, En_Rs_Usu, En_Rs_Tecl, En_Rs_Car, En_Rs_Din, En_Rs_Saldo, Ld_Cnt_Placas, En_Cnt_Placas, RW_Placas, RW_Datos, RW_Saldo, RW_Carros, Sel_saldo, Sel_deco: out std_logic);
end MSS;


--Arquitectura 
architecture solucion of MSS is

type estado is (Ta,Tb,Tc,Td,Te,Tf,Tg,Tg1,Th,Th1,Th2,Th3,Th4,Th5,Th6,Ti,Ti1,Ti2,Ti3,Ti4,Ti5,Ti6,Ti7,Tj,Tj1,Tj2,Tj3,Tj4,Tj5,Tj6,Tj7,Tj8,Tk,Tk1,Tk2,Tk3,Tk4,Tl,Tl1,Tl2,Tl3,Tm,Tn,To0,To1,To2,To3,Tp,Tq,Tr,Ts,Tt,Tu,Tv,Tw,Tx);
signal y: estado;
signal estados:std_logic_vector(5 downto 0);



--Declaracion de Componentes 

begin
	process(clock, resetn) 
		begin
		if resetn='0' then y<=Ta;
			elsif(clock'event and clock='1') then
			case y is
			
				when Ta=> if Start='1' then y<=Tb; else y<=Ta;end if;
				when Tb=> if Start='0' then y<=Tc; else y<=Tb;end if;
				when Tc=> if Usu_On='1' then y<=Td; else y<=Tt;end if;
				when Td=> y<=Te;
				when Te=> if Agregar='1' then y<=Tf; else y<=Tl;end if;
				when Tf=> if Tec_On='1' then y<=Tg; else y<=Tf;end if;
				when Tg=> if Igual_3='1' then y<=Tg1; else y<=Th;end if;
				when Tg1=> y<=Te;
				When Th=> if Igual_1='1' then y<=Th1; else y<=Ti;end if;
				When Th1=> y<=Th2;
				When Th2=> y<=Th3;
				When Th3=> y<=Th4;
				When Th4=> y<=Th5;
				When Th5=> if Tec_On='1' then y<=Th6; else y<=Th5;end if;
				When Th6=> y<=Te;
				When Ti=> if Igual_2='1' then y<=Ti1; else y<=Tj;end if;
				When Ti1=> y<=Ti2;
				When Ti2=> y<=Ti3;
				When Ti3=> y<=Ti4;
				When Ti4=> y<=Ti5;
				When Ti5=> y<=Ti6;
				When Ti6=> if Tec_On='1' then y<=Ti7; else y<=Ti6;end if;
				When Ti7=> y<=Te;
				When Tj=> if Igual_3='1' then y<=Tj1; else y<=Tk;end if;
				When Tj1=> y<=Tj2;
				When Tj2=> y<=Tj3;
				When Tj3=> y<=Tj4;
				When Tj4=> y<=Tj5;
				When Tj5=> y<=Tj6;
				When Tj6=> y<=Tj7;
				When Tj7=> if Tec_On='1' then y<=Tj8; else y<=Tj7;end if;
				When Tj8=> y<=Te;
				when Tk=> y<=Tk1;
				when Tk1=> y<=Tk2;
				when Tk2=> y<=Tk3;
				when Tk3=> if Tec_On='1' then y<=Tk4; else y<=Tk3;end if;
				when Tk4=> y<=Te;
				when Tl=> if Recargar='1' then y<=Tl1; else y<=Tm;end if;
				when Tl1=> if Dinero_On='1' then y<=Tl2; else y<=Tl1;end if;
				when Tl2=> y<=Tl3;
				when Tl3=> y<=Te;
				When Tm=> if Pagar='1' then y<=Tn; else y<=Te;end if;
				When Tn=> if Tec_On='1' then y<=To0; else y<=Tn;end if;
				When To0=> if Placa_coincide='1' then y<=Tp; else y<=To1;end if;
				When To1=> if Placa_coincide='1' then y<=Tp; else y<=To2;end if;
				When To2=> if Placa_coincide='1' then y<=Tp; else y<=To3;end if;
				When To3=> if Placa_coincide='1' then y<=Tp; else y<=Tn;end if;
				When Tp=> if Saldo_Insuficiente='1' then y<=Ts; else y<=Tq;end if;
				When Tq=> y<=Tr;
				When Tr=> y<=Tc;
				when Ts=> y<=Te;
				When Tt=> if Comprar='1' then y<=Tu; else y<=Tc;end if;
				When Tu=> if Dinero_On='1' then y<=Tv; else y<=Tu;end if;
				When Tv=> if Falta_Dinero='1' then y<=Tw; else y<=Tx;end if;
				When Tw=> y<=Tu;
				When Tx=> y<=Tc;
			end case;
		end if;
	end process;
	
	
	process(y) 
	begin
	PASAR<='0'; CUPO_INSUFICIENTE<='0'; LLENO<='0'; En_Rs_Usu<='0'; En_Rs_Tecl<='0'; En_Rs_Car<='0'; En_Rs_Din<='0'; En_Rs_Saldo<='0';
	Ld_Cnt_Placas<='0'; En_Cnt_Placas<='0'; RW_Placas<='0'; RW_Datos<='0'; RW_Saldo<='0'; RW_Carros<='0'; Sel_saldo<='0'; Sel_deco<='0';
		
		case y is
		
				when Ta=>estados<="000001";
				when Tb=>estados<="000010";
				when Tc=>estados<="000011";
				when Td=>estados<="000100"; En_Rs_Usu<='1';
				when Te=>estados<="000101"; Sel_deco<='1';
				when Tf=>estados<="000110";
				when Tg=>estados<="000111"; En_Rs_Tecl<='1';
				when Tg1=>estados<="001000"; LLENO<='1';
				When Th=>estados<="001001"; Ld_Cnt_Placas<='1';
				When Th1=>estados<="001010"; En_Rs_Car<='1';
				When Th2=>estados<="001011"; RW_Carros<='1';
				When Th3=>estados<="001100"; En_Cnt_Placas<='1';
				When Th4=>estados<="001101"; RW_Placas<='1';
				When Th5=>estados<="001110";
				When Th6=>estados<="001111"; En_Rs_Tecl<='1'; RW_Datos<='1';
				When Ti=>estados<="010000";
				When Ti1=>estados<="010001"; En_Rs_Car<='1';
				When Ti2=>estados<="010010"; RW_Carros<='1';
				When Ti3=>estados<="010011"; En_Cnt_Placas<='1';
				When Ti4=>estados<="010100"; En_Cnt_Placas<='1';
				When Ti5=>estados<="010101"; RW_Placas<='1';
				When Ti6=>estados<="010110";
				When Ti7=>estados<="010111"; En_Rs_Tecl<='1'; RW_Datos<='1';
				When Tj=>estados<="011000";
				When Tj1=>estados<="011001"; En_Rs_Car<='1';
				When Tj2=>estados<="011010"; RW_Carros<='1';
				When Tj3=>estados<="011011"; En_Cnt_Placas<='1';
				When Tj4=>estados<="011100"; En_Cnt_Placas<='1';
				When Tj5=>estados<="011101"; En_Cnt_Placas<='1';
				When Tj6=>estados<="011110"; RW_Placas<='1';
				When Tj7=>estados<="011111";
				When Tj8=>estados<="100000"; En_Rs_Tecl<='1'; RW_Datos<='1';
				when Tk=>estados<="100001"; RW_Placas<='1';
				when Tk1=>estados<="100010"; En_Rs_Car<='1';
				when Tk2=>estados<="100011"; RW_Carros<='1';
				when Tk3=>estados<="100100";
				when Tk4=>estados<="100101"; En_Rs_Tecl<='1'; RW_Datos<='1';
				when Tl=>estados<="100110"; Sel_deco<='1';
				when Tl1=>estados<="100111";
				when Tl2=>estados<="101000"; En_Rs_Din<='1'; Sel_Saldo<='1'; En_Rs_saldo<='1';
				when Tl3=>estados<="101001"; RW_Saldo<='1'; Sel_Saldo<='1';
				When Tm=>estados<="101010"; Sel_deco<='1';
				When Tn=>estados<="101011";
				When To0=>estados<="101100";En_Rs_Tecl<='1'; Ld_Cnt_Placas<='1';
				When To1=>estados<="101101"; En_Cnt_Placas<='1';
				When To2=>estados<="101110"; En_Cnt_Placas<='1';
				When To3=>estados<="101111"; En_Cnt_Placas<='1';
				When Tp=>estados<="110000"; RW_Saldo<='0';
				When Tq=>estados<="110001"; En_Rs_saldo<='1';
				When Tr=>estados<="110010"; PASAR<='1'; RW_Saldo<='1';
				when Ts=>estados<="110011"; CUPO_INSUFICIENTE<='1';
				When Tt=>estados<="110100";
				When Tu=>estados<="110101";
				When Tv=>estados<="110110";
				When Tw=>estados<="110111"; CUPO_INSUFICIENTE<='1';
				When Tx=>estados<="111000";
			
		end case;
	end process;
end solucion;