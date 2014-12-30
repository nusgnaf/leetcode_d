module t.arr;

import std.array;

unittest {
	auto a = array([1,2,3,4,5][]);
	assert(a == [1,2,3,4,5]);
	//std.stdio.writeln(a);
}

bool leapYear(uint digi)
{
	return true;
}