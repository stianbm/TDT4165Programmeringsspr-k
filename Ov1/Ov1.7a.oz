functor
import
	System
define
	fun {Length List} L in
		if List == nil then
			L = 0
		else
			L = 1 + {Length List.2}
		end
	end
	
	{System.showInfo {Length 1|2|3|nil}}
end