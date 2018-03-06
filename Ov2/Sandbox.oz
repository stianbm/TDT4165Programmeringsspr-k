functor
import
	System
define
	\insert List.oz
	%Returns the created stack
	fun {PrintStack Stack}
		local
			Out
		in
			case Stack of Head|Tail then
				Out = Head|{PrintStack Tail}
			else
				Out = nil
			end
		end
	end
	
	%Keeps track of Top|NextToTop|Tail of Tokens, returns Tokens if operator with less than two ints prior
	fun {Interpret2 Tokens Stack}
		local
			Out
		in
			case Tokens of number(Top)|Tail then
				case Tail of number(NextToTop)|Tail2 then
					case Tail2 of operator(type:Type)|Tail3 then
						%Find correct operator and uptade returnStack and PrintStack (Tokens and Stack)
						if Type == '+' then
							Out = number(NextToTop + Top)|{Interpret2 Tail3 number(NextToTop + Top)|Stack}
						elseif Type == '*' then
							Out = number(NextToTop * Top)|{Interpret2 Tail3 number(NextToTop * Top)|Stack}
						elseif Type == '-' then
							Out = number(NextToTop - Top)|{Interpret2 Tail3 number(NextToTop - Top)|Stack}
						elseif Type == '/' then
							Out = number(NextToTop / Top)|{Interpret2 Tail3 number(NextToTop / Top)|Stack}
						else
							Out = nil
						end
					[] number(N)|Tail3 then
						Out = number(Top)|{Interpret2 Tail number(Top)|Stack}
					[] command(Type)|Tail3 then
						{System.show Type}
						if Type == 'p' then
							{System.show {PrintStack Stack}}
							Out = {Interpret2 Tail Stack}
						else
							{System.show nil}
						end
					else
						Out = Tokens
					end
				else
					Out = Tokens
				end
			else
				Out = Tokens
			end
		end
	end
	
	%Checks if the second value in Tokens is print, if the first is, nothing will be printed, if the second is the first value of Tokens will be printed
	fun {Interpret Tokens}
		local
			Out
		in
			case Tokens.2 of command(Type)|Tail then
				if Type == 'p' then
					{System.show Tokens.1}
				else
					{System.show nil}
				end
			else
				{System.show nil}
			end
			Out = {Interpret2 Tokens nil}
		end
	end
	
	{System.show {Interpret {Tokenize {Lex "1 2 3 p +"}}}}
end