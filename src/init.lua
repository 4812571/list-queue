local ListQueue = {}
ListQueue.__index = ListQueue

function ListQueue.new()
	local self = setmetatable({}, ListQueue)
    self._count = 0
	self._first = nil
	self._last = nil
	return self
end

function ListQueue:Push(value)
	if self._first == nil then
		self._first = {value, nil}
		self._last = self._first
	else
		self._last[2] = {value, nil}
		self._last = self._last[2]
	end

    self._count += 1
end

function ListQueue:Pop()
	local value = self._first[1]

	if self._first == self._last then
		self._first = nil
		self._last = nil
	else
		self._first = self._first[2]
	end

    self._count -= 1

	return value
end

function ListQueue:Peek()
    return if self._first then self._first[1] else nil
end

function ListQueue:Count()
    return self._count
end

return ListQueue