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
}

struct S2
{
	int[] data;
}