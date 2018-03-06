functor
import
	System
define
	Browse = System.showInfo
	fun {Interpret Tokens}
		fun {Iterate Stack Tokens}
			case Tokens of nil then
				nil
			[] number(Integer)|Tokens then
				{Iterate Integer|Stack Tokens}
			[] command(type:Command)|Tokens then
				{Iterate Stack Tokens}
			[] operator(type:Operator)|Tokens then
				if Operator == '+' then
					Top|NextToTop|Rest = Stack in
					{Iterate {NextToTop + Top}|Rest Tokens}
				else
					nil
				end
			else
				nil
			end
	   end
	in
		{Iterate nil Tokens}
	end
	{System.show {Interpret [number(1) number(2) number(3) command(type:p) operator(type:'+')]}}
end