module main;

import std.algorithm;
import std.array;
import std.exception;
import std.file;
import std.getopt;
import std.range;
import std.stdio;
import std.string;
import std.traits;
import std.datetime;

immutable(int)[] loadPrimeNumber(string filename)
{
	enforce(exists(filename));
	auto s = slurp!(int)(filename, "%s");
	return assumeUnique(s);
}

void main(string[] args)
{
	string filename, changeFile;
	getopt(args, "file|f", &filename, "outfile|o", &changeFile);
	writeln(filename);
	auto bytes = cast(ubyte[]) read(filename);
	auto somePrimes = loadPrimeNumber(filename);
	auto r = assumeSorted(somePrimes);
	assert(r.contains(3));
	assert(r.contains(31));
	assert(!r.contains(32));
	void f0()
	{
		r.contains(16229);
	}

	void f1()
	{
		r.canFind(16229);
	}
	auto result = benchmark!(f0,f1)(1_000);
	auto s = comparingBenchmark!(f0,f1, 1_000);
	foreach(TickDuration ele; result) {
		writeln(ele.to!("usecs", float));
	}
	writeln(s.targetTime);
}