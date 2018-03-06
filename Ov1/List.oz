fun {Length List} L in
	if List == nil then
		L = 0
	else
		L = 1 + {Length List.2}
	end
end

fun {Take List Count} Out in
	if Count > {Length List} then
		Out = List
	elseif Count < 1 then
		Out = nil
	else
		Out = List.1 | {Take List.2 Count-1}
	end
end

fun {Drop List Count} Out in
	if Count > {Length List} then
		Out = nil
	elseif Count < 1 then
		Out = List
	else
		Out = {Drop List.2 Count-1}
	end
end

fun {Append List1 List2} Out in
	if List1 == nil then
		if List2 == nil then
			Out = nil
		else
			Out = List2.1 | {Append List1 List2.2}
		end
	else
		Out = List1.1 | {Append List1.2 List2}
	end
end

fun {Member List Element} Out in
	if List == nil then
		Out = 0
	elseif List.1 == Element then
		Out = 1
	else
		Out = {Member List.2 Element}
	end
end

fun {Position List Element} Out in
	if List.1 == Element then
		Out = 1
	else
		Out = 1 + {Position List.2 Element}
	end
end