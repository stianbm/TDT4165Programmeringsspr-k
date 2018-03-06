functor
import
	System
define
	fun {Tokenize Lexemes}
		local
			Operators = ["+" "-" "*" "/"]
			Commands = ["p" "d" "i"]
		in
			{Map Lexemes
			fun {$ Lexeme}
				if {Member Operators Lexeme} then
					operator(type:{String.toAtom Lexeme})
				elseif {Member Commands Lexeme} then
					command(type:{String.toAtom Lexeme})
				else
					try number({String.toInt Lexeme})
					catch _ then raise "invalid lexeme ’"#Lexeme#"’" end
					end
				end
			end}
		end
	end
	{System.show {Tokenize [[49] [50] [51] [43]]}}
end