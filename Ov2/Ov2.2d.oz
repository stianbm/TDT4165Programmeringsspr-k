functor
import
	System
define
	\insert List.oz
	
	%Keep track of previously used variables in Savestack
	fun {Interpret2 Tokens SaveStack}
		case Tokens of number(Top)|Tail then
			{System.show 'Case1'}
			{Interpret2 Tail number(Top)|SaveStack}
		[] operator(type:Type)|Tail then
			{System.show 'Case2'}
			Top|NextToTop|Rest = SaveStack in
			%Find correct operator and uptade returnStack and Savestack
			if Type == '+' then
				{Interpret2 Tail number(NextToTop.1 + Top.1)|Rest}
			elseif Type == '*' then
				{Interpret2 Tail number(NextToTop.1 * Top.1)|Rest}
			elseif Type == '-' then
				{Interpret2 Tail number(NextToTop.1 - Top.1)|Rest}
			elseif Type == '/' then
				{Interpret2 Tail number(NextToTop.1 / Top.1)|Rest}
			else
				nil
			end
		[] command(type:Type)|Tail then
			{System.show 'Case3'}
			if Type == 'p' then
				{System.show {List.reverse SaveStack}}
			else
				{System.show nil}
			end
			{Interpret2 Tail SaveStack}
		else
			{System.show 'Ending'}
			{List.reverse SaveStack}
		end
	end
	
	%Start the recursion
	fun {Interpret Tokens}
		{System.show Tokens}
		{Interpret2 Tokens nil}
	end
	
	{System.show {Interpret {Tokenize {Lex "1 2 3 p +"}}}}
end