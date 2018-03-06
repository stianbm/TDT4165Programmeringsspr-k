functor
import
	System
define
	fun {OpLeq Pushing Top}
		if Top == operator(type:'*') then
			true
		elseif Top == operator(type:'/') then
			true
		else
			if Pushing == operator(type:'*') then
				false
			elseif Pushing == operator(type:'/') then
				false
			else
				true
			end
		end
	end
	{System.show {OpLeq operator(type:'/') operator(type:'-')}}
end