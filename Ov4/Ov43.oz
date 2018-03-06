functor import Application System define
	% Your code here
	fun lazy {StreamScale S Factor}
		{StreamMap S fun {$ X} Factor*X end}
	end
	fun lazy {StreamMap S F}
		case S of Head|Tail then
			{F Head}|{StreamMap Tail F}
		else
			{F StreamMap}
		end
	end
	local A = 2|3|4|A X in
		X = {StreamScale A 5}
		if {Nth X 10} > 0 then skip end
		{System.show X}
	end
	{Application.exit 0}
end