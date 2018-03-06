functor
import
	System
define
	\insert List.oz
	
	%Keep track of previously used variables in Savestack
	fun {Interpret2 Tokens SaveStack}
		case Tokens of number(Top)|Tail then
			{Interpret2 Tail number(Top)|SaveStack}
		[] operator(type:Type)|Tail then
			Top|NextToTop|Rest = SaveStack in
			%Find correct operator and update returnStack and Savestack
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
				{Interpret2 Tail SaveStack}
			elseif Type == 'd' then
				{Interpret2 Tail SaveStack.1|SaveStack}
			elseif Type == 'i' then
				Top|Rest = SaveStack in
				{Interpret2 Tail number(0 - Top.1)|Rest}
			elseif Type == '^' then
				Top|Rest = SaveStack in
				{Interpret2 Tail number(1.0 / {Int.toFloat Top.1})|Rest}
			else
				{System.show nil}
				{Interpret2 Tail SaveStack}
			end
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
	
	{System.show {Interpret {Tokenize {Lex "1 2 3 + ^"}}}}
end