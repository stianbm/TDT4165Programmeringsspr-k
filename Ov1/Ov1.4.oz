functor
import
	System
define
	fun {Max X Y}
		if X > Y then
			X
		else
			Y
		end
	end
	proc {PrintGreater A B}
		{System.showInfo {Max A B}}
	end
end
{PrintGreater 10 89}