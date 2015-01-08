module t.strct;

struct S
{
	int[] data;
}

unittest {
	S a = S([1,2]);
	S b = a;
	a.data[1] = 1;
	assert(b.data[1] == 1);
	assert(S2!int.I == 1);
	S2!int c = S2!int([1,2,3]);
	assert(c.data == [2,4,6]);
	auto d = c.data;
	assert(d == [2,4,6]);
	auto e = new int[3];
	e[] = d[]/2;
	assert(e == [1,2,3]);
//	assert((d[])/2 == [1,2,3]);
}


//templized struct, super easy
struct S2(T)
{
	static int I = 1;
	T[] data;
	this(T[] rawData)
	{
		data = new T[rawData.length];
		data[] = 2*rawData[];
	}
}