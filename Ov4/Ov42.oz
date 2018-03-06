functor import Application System define
	% Your code here
	%Assume to know both lists are recursively defined
	fun lazy {StreamZip S1 S2 F}
		{F S1.1 S2.1}|{StreamZip S1.2 S2.2 F}
	end
	local A = 2|3|4|A B = 9|~3|B X in
		X = {StreamZip A B fun {$ X Y} X*Y end}
		if {Nth X 10} > 0 then skip end
		{System.show X}
	end
	{Application.exit 0}
end