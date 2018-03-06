functor import Application System define
% Your code here
	fun lazy {StreamIntegrate Init S Dt}
		Init|{StreamIntegrate Init+S.1*Dt S.2 Dt}
	end
%Tests
	local A = 1.0|0.0|A X in
		X = {StreamIntegrate 5.0 A 1.0}
		if {Nth X 10} > 0.0 then skip end
		{System.show X}
	end
	local A = 5.0|6.0|7.0|A X in
		X = {StreamIntegrate 2.0 A 3.0}
		if {Nth X 10} > 0.0 then skip end
		{System.show X}
	end
	{Application.exit 0}
end