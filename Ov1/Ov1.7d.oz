functor
import
	System
define
	\insert List.oz
	
	fun {Append List1 List2} Out in
		if List1 == nil then
			if List2 == nil then
				Out = nil
			else
				Out = List2.1 | {Append List1 List2.2}
			end
		else
			Out = List1.1 | {Append List1.2 List2}
		end
	end
	
	{System.showInfo {Append 1|2|3|4|5|nil 5|4|3|2|1|nil}}
end

/*
Assume correct on account of number of outputs, how do you display them in
Command Promt? Make a print func? Don't have time
*/