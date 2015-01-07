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

void main()
{
	auto s = [1,2,3];
	size_t i = s.length;
	std.stdio.writeln(typeof(i).stringof);
}
