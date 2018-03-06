functor import Application System define
	% Your code here
	fun lazy {StreamAdd S1 S2}
		{StreamZip S1 S2 fun {$ X Y} X+Y end}
	end
	fun lazy {StreamZip S1 S2 F}
		{F S1.1 S2.1}|{StreamZip S1.2 S2.2 F}
	end
	local A = 2|3|4|A B = 9|~3|B X in
		X = {StreamAdd A B}
		if {Nth X 10} > 0 then skip end
		{System.show X}
	end
	{Application.exit 0}
end