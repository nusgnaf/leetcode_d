module t.str;

import std.ascii, std.string, std.utf, std.stdio;
import std.algorithm, std.array;

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
	assert(!canFind([1,2,3,4,5], [6]));
	// following two cases only work in pre-2.0.67
	// when one needle, don't wrap in array(which has range interface)
	// fix is easy: just list all needles, don't wrap in array!
//	assert(!canFind([1,2,3,4,5], [6]));
	assert(!canFind([1,2,3,4,5], 6));
//	assert(canFind([1,2,3,4,5], [1, 6]));
	assert(canFind([1,2,3,4,5], 1, 6));
	assert(canFind("haha", "ah", "ha"));
	assert(canFind("haha", "aha"));
}


//void main()
//{
//	auto s = [1,2,3];
//	assert(!canFind([1,2,3,4,5], 6));
//	writeln(find(s, 1));
//	writeln(canFind(s, [1,3], [2,3]));
//	writeln(canFind("haha", "ah","ha"));
//	writeln(canFind("haha", "ah"));
//}
