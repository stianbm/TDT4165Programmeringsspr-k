functor
import
	System
define
	fun {ShuntInternal Tokens OperatorStack OutputStack}
		case Tokens of number(Head)|Tail then
			{System.show 'ShuntInternal number'}
			{ShuntInternal Tail OperatorStack number(Head)|OutputStack}
		[] operator(type:Type)|Tail then
			{System.show 'ShuntInternal operator'}
			{ShuntInternal Tail operator(type:Type)|OperatorStack OutputStack}
		else
			{System.show 'ShuntInternal End'}
			OutputStack
		end
	end
end