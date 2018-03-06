functor
import
	System
define
	local
		A
		D
		C
		Pi = {IntToFloat 355} / {IntToFloat 113}
	in
		proc {Circle R}
			A = Pi * R * R
			D = {IntToFloat 2} * R
			C = D * Pi
			{System.showInfo A}
			{System.showInfo D}
			{System.showInfo C}
		end
	end
	{Circle {IntToFloat 12}}
end