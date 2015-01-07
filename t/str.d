module t.str;

import std.ascii, std.string, std.utf, std.stdio;

unittest {
	string u = "hahaha";
	string v = u_change(u);
	assert(u == v);
}

string u_change(ref string s)
{
	s = s[0..$/2];
	return s;
}


unittest {
	// indexOf|indexOfAny
	auto k = indexOfAny("helloWorld", "wr");
	auto j = indexOfAny("helloWorld", "wr", CaseSensitive.no);
	assert(k == 7);
	assert(j == 5);
}


void main()
{
	string u = "hahaha";
	string v = u_change(u);
	writeln(u, ":", v);
	auto k = indexOfAny("helloWorld", "wr");
	auto j = indexOfAny("helloWorld", "wr", CaseSensitive.no);
	writeln(k,":",j);
	static string[] list = [ "food", "foxy" ,"fuck","ford", "foo", "faint", "fang"];
	
	auto abbrevs = std.string.abbrev(list);
	
	foreach (key, value; abbrevs)
	{
		writefln("%s => %s", key, value);
	}
}
