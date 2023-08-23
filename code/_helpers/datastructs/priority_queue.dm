/**
 * array-backed priority heap
 *
 * not written in house, cloned from oldish polaris/bay (?)
 */
/datum/priority_queue
	var/list/queue
	var/comparison_function

/datum/priority_queue/New(compare)
	queue = list()
	comparison_function = compare

/datum/priority_queue/proc/is_empty()
	return !queue.len

/datum/priority_queue/proc/enqueue(data)
	queue.Add(data)
	var/index = queue.len

	//From what I can tell, this automagically sorts the added data into the correct location.
	while(index > 2 && call(comparison_function)(queue[index / 2], queue[index]) > 0)
		queue.Swap(index, index / 2)
		index /= 2

/datum/priority_queue/proc/dequeue()
	if(!queue.len)
		return 0
	return remove(1)

/datum/priority_queue/proc/remove(index)
	if(index > queue.len)
		return 0

	var/thing = queue[index]
	queue.Swap(index, queue.len)
	--queue.len
	if(index < queue.len)
		fix_queue(index)
	return thing

/datum/priority_queue/proc/fix_queue(index)
	var/child = 2 * index
	var/item = queue[index]

	while(child <= queue.len)
		if(child < queue.len && call(comparison_function)(queue[child], queue[child + 1]) > 0)
			child++
		if(call(comparison_function)(item, queue[child]) > 0)
			queue[index] = queue[child]
			index = child
		else
			break
		child = 2 * index
	queue[index] = item

/datum/priority_queue/proc/clone_list()
	return queue.Copy()

/datum/priority_queue/proc/length()
	return queue.len

/datum/priority_queue/proc/remove_item(data)
	var/index = queue.Find(data)
	if(index)
		return remove(index)
