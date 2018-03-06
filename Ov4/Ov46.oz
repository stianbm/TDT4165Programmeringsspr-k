functor import Application System define
% Your code here
	fun {MakeRC R C Dt}
		local fun {RC S V0}
			% X1 = {StreamScale S R}
			% X2 = {StreamScale S 1.0/C}
			% X3 = {StreamIntegrate Init X2 Dt}
			% X4 = {StreamAdd X1 X3}
			{StreamAdd {StreamIntegrate V0 {StreamScale S 1.0/C} Dt} {StreamScale S R}}
		end in
			RC
		end
	end
%StreamIntegrate
	fun lazy {StreamIntegrate Init S Dt}
		Init|{StreamIntegrate Init+S.1*Dt S.2 Dt}
	end
%StreamScale
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
%StreamAdd
	fun lazy {StreamAdd S1 S2}
		{StreamZip S1 S2 fun {$ X Y} X+Y end}
	end
	fun lazy {StreamZip S1 S2 F}
		{F S1.1 S2.1}|{StreamZip S1.2 S2.2 F}
	end
%Tests
	local
		Ones = 1.0|Ones
		RC = {MakeRC 5.0 1.0 0.2}
		V = {RC Ones 2.0}
	in
		if {Nth V 5} > 0.0 then skip end {System.show V}
	end
	{Application.exit 0}
end