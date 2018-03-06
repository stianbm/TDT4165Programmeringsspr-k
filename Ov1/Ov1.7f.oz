functor
import
	System
define
	\insert List.oz
	
	fun {Position List Element} Out in
		if List.1 == Element then
			Out = 1
		else
			Out = 1 + {Position List.2 Element}
		end
	end
	
	{System.showInfo {Position 1|2|3|4|5|nil 4}}
end

/*
Expects virtual string if using true/false statement, why?
*/