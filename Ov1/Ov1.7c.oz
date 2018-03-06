functor
import
	System
define
	\insert List.oz
	
	fun {Drop List Count} Out in
		if Count > {Length List} then
			Out = nil
		elseif Count < 1 then
			Out = List
		else
			Out = {Drop List.2 Count-1}
		end
	end
	
	{System.showInfo {Drop 1|2|3|4|5|nil 4}}
end

/*
Assume correct on account of number of outputs
*/