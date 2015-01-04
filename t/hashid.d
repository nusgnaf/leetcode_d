module t.hashid;


import std.stdio;

unittest {
	string bs10 = "0123456789";
	string bs16 = "0123456789abcdef";
	string bs62 = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
	assert(encode(7,bs10) == "7");
	assert(encode(7,bs16) == "7");
	assert(encode(12, bs16) == "c");
	assert(encode(255, bs16) == "ff");
	assert(encode(1234, bs16) == "4d2");
}


string encode(uint input, ref string alps)
{
	string hash = "";
	uint l = cast(uint) alps.length;
	do {
		hash = alps[input % l] ~ hash;
		input = input/l ;
	} while(input);
	return hash;
}

