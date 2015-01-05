module t.hashid;


import std.stdio, std.exception;

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


string encode(uint input, string alps)
{
	string hash = "";
	uint l = cast(uint) alps.length;
	do {
		hash = alps[input % l] ~ hash;
		input = input/l ;
	} while(input);
	return hash;
}

unittest {
}

string FYshuffle(string alps, string salt)
in {
	assert(alps.length < 128);
}

body {
	uint j,v,p;
	char tmp, charCode;
	char[] wkstr = alps.dup;
	ulong i = cast(uint) alps.length-1;
	for(; i>0; i--, p++) {
		v %= salt.length;
		p += charCode = salt[v];
		j = (charCode+v+p)%i;

		tmp = wkstr[j];
		wkstr = wkstr[0..j] ~ wkstr[i] ~ wkstr[j+1..$];
		wkstr = wkstr[0..i] ~ tmp ~ wkstr[i+1..$];
	}
	return assumeUnique(wkstr);
}

struct Hashids
{
	static string ALPHABET = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
	static int minAlphabetLength = 16;


private:
	string salt;
	uint minHashLength;
	string alphabet;

	this(string salt, uint minHashLength, string alphabet)
	{
		enforce(alphabet.length > minAlphabetLength, "error: alphabet must contain at least 16 unique characters");
		salt = salt;
		minHashLength = minHashLength;
		alphabet = alphabet;
	}

	this(string salt)
	{
		this(salt, 0, Hashids.ALPHABET);
	}
}