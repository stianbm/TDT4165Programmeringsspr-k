functor
import
	System
define
	\insert List.oz
	fun {Interpret Tokens}
		local
			Out
		in
			case Tokens of number(Top)|Tail then
				case Tail of number(NextToTop)|Tail2 then
					case Tail2 of operator(type:Type)|Tail3 then
						if Type == '+' then
							Out = number(NextToTop + Top)|{Interpret Tail3}
						elseif Type == '*' then
							Out = number(NextToTop * Top)|{Interpret Tail3}
						elseif Type == '-' then
							Out = number(NextToTop - Top)|{Interpret Tail3}
						elseif Type == '/' then
							Out = number(NextToTop / Top)|{Interpret Tail3}
						else
							Out = nil
						end
					[] number(N)|Tail3 then
						Out = number(Top)|{Interpret Tail}
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
	{System.show {Interpret {Tokenize {Lex "1 2 3 p +"}}}}
end