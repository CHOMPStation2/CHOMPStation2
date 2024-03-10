//TimSort interface
/proc/sortTim(list/L, cmp=/proc/cmp_numeric_asc, associative, fromIndex=1, toIndex=0)
	if(L && L.len >= 2)
		fromIndex = fromIndex % L.len
		toIndex = toIndex % (L.len+1)
		if(fromIndex <= 0)
			fromIndex += L.len
		if(toIndex <= 0)
			toIndex += L.len + 1

		sortInstance.L = L
		sortInstance.cmp = cmp
		sortInstance.associative = associative

<<<<<<< HEAD
		SI.L = L
		SI.cmp = cmp
		SI.associative = associative

		SI.timSort(fromIndex, toIndex)
=======
		sortInstance.timSort(fromIndex, toIndex)

>>>>>>> f6d0f62622... Revert "Garbage collection, asset delivery, icon2html revolution, and general…" (#15815)
	return L
