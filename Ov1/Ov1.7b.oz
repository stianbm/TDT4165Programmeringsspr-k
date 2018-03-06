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
	
	fun {Take List Count} Out in
		if Count > {Length List} then
			Out = List
		elseif Count < 1 then
			Out = nil
		else
			Out = List.1 | {Take List.2 Count-1}
		end
	end
	
	{System.showInfo {Take 1|2|3|4|5|nil 3}}
end

/*
Command promt won't show values in list, but number of elements is correct
*/