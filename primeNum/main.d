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

struct PrimeChecker
{
private:
	immutable(int)[] primes;
	int lower;
	int upper;
	immutable(int)[] loadPrimeNumber(string filename)
	{
		enforce(exists(filename));
		auto s = slurp!(int)(filename, "%s");
		return assumeUnique(s);
	}


public:
	/***
	 * Loading from file that are loads of prime numbers,
	 */
	this(string filename)
	{
		this.primes = loadPrimeNumber(filename);
		this.lower = this.primes[0];
		this.upper = this.primes[$-1];
	}

	bool checking(int num)
	{
		auto r = assumeSorted(this.primes);
		return r.contains(num);
	}
}

immutable(int)[] loadPrimeNumber(string filename)
{
	enforce(exists(filename));
	auto s = slurp!(int)(filename, "%s");
	return assumeUnique(s);
}

void BenchReport(in int[] nums)
{
	auto r = assumeSorted(nums);
	void f0()
	{
		r.contains(9999937);
	}


	// for large prime that at the end of prime list, find/canFind is really slow
	// it has to move many steps to check the primarity of it.
	void f1()
	{
		r.canFind(9999937);
	}

	auto result = benchmark!(f0,f1)(1_000);
	auto s = comparingBenchmark!(f0,f1, 1_000);
	writeln(s.point());
}

void main(string[] args)
{
	string filename, changeFile;
	int[] nums; 
	arraySep = ",";
	getopt(args, "file|f", &filename, "outfile|o", &changeFile, "nums|n", &nums);
//	writeln(nums);
	auto F = PrimeChecker(filename);
	//writeln(F.checking(9999937));
	auto somePrimes = loadPrimeNumber(filename);
	auto r = assumeSorted(somePrimes);
//	BenchReport(somePrimes);
	if (!nums.empty)
	{
		bool[] rs = new bool[nums.length];
		foreach(i, ele; nums) {
			rs[i] = F.checking(ele);
		}

		writeln(rs);
	}
}