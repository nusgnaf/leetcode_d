﻿module t.str;

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
	assert(capitalize("fAnG") == "Fang");
	assert(center("fang", 10) == "   fang   ");
	assert(center("fan", 10) ==  "   fan    ");
	assert(chomp(" hello world  \n\r") == " hello world  \n");
	assert(chomp(" hello world  \r\n") == " hello world  ");
	assert(chomp(" hello world  \n\n") == " hello world  \n");
	assert(chomp(" hello world", "orld") == " hello w");
	assert(chomp(" hello world", " he") == " hello world");
	assert(column("\t") == 8);
	assert(column("\thaha") == 12);
	assert(column("\t", 4) == 4);
	assert(countchars("faint", "fuck") == 1);
	assert(removechars("faint", "fuck") == "aint");
	assert(detab("\tOK") == "        OK");
	assert(detab("\tOK", 4) == "    OK");
	assert(entab("    good") == "    good");
	assert(entab("    good", 4) == "\tgood");
	assert(entab("     good", 4) == "\t good");
	assert(format("k=%s;v=%s", 1, 2) == "k=1;v=2");
	assert(icmp("a","b") == -1);
	assert(icmp("b","a") == 1);
	assert(icmp("a","A") == 0); //  case incensitive!
	assert(inPattern('a', "a-z"));
	assert(!inPattern('A',"a-z"));
	assert(leftJustify("hah",5) == "hah  ");
	assert(rightJustify("hah", 5) == "  hah");
	assert(leftJustify("hah", 5, '!') == "hah!!");
	assert(removechars("123abc", "a-z") == "123");
	assert(removechars("123abc", "^a-z") == "abc");
}


//void main()
//{
//	writeln(leftJustify("haha",10, '!'));
//	writeln(rightJustify("haha",10, '!'));
//}
