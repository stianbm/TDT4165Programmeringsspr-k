functor
import
	System
define
	
	fun {Member List Element} Out in
		if List == nil then
			Out = false
		elseif List.1 == Element then
			Out = true
		else
			Out = {Member List.2 Element}
		end
	end
	
	{System.showInfo {Member 1|2|3|4|5|nil 6}}
end

/*
Expects virtual string if using true/false statement, why? Fixed by using 1/0
*/