functor
import
	System
define
	fun {IncUntil Start Stop} A in
		if Start < Stop then
			if Start == 0 then
				A = {IncUntil Start+1 Stop}
			else
				if (Stop mod Start) == 0 then
					{System.showInfo Start}
				end
				A = {IncUntil Start+1 Stop}
			end
		else
			A = Stop
		end
		A
	end
	
	fun {Factorial N} B in
		B = {IncUntil 0 N}
		B
	end
	{System.showInfo {Factorial 12}}
end