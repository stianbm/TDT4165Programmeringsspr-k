functor
import
	System
define
	fun {Lex Input}
			{String.tokens Input & }
	end
	{System.show {Lex "1 2 3 +"}}
end