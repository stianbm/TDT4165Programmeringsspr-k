functor import Application System define
	%Your code here
	fun lazy {StreamMap S F}
		case S of Head|Tail then
			{F Head}|{StreamMap Tail F}
		else
			{F StreamMap}
		end
	end
	local A = 2|3|4|A X in
		X = {StreamMap A fun {$ X} X*X end}
		if {Nth X 10} > 0 then skip end
		{System.show X}
	end
	{Application.exit 0}
end