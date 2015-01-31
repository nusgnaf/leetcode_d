module main;

import std.range,std.array,std.algorithm;
import std.stdio;

short[4] smallPrimes = [2,3,5,7];
/***
 * factor out a small num
 */
int[] factor(int num, in short[] smallPrimes)
{
	int[] res;
//	short i;
	foreach(i, p; smallPrimes) {
		if((num % p) == 0 && (num != p)) {
			res ~= p;
			res ~= factor(num/p, smallPrimes[i..$]);
			return res;
		}
	}
	res ~= num; // num is prime!
	return res;
}

/***
 * check some num is a prime or not
 * since we only care small int: [2,99], we use short for everything
 */
bool isprime(int num)
in {
	assert(num >1);
}

body {
	foreach(i; smallPrimes) {
		if( num % i == 0) {
			if (num == i) {return true;} else {return false;}
		}
	}
	return true;
}

///
unittest {
	assert(isprime(2));
	assert(isprime(31));
	assert(isprime(37));
	assert(!isprime(99));
	assert(!isprime(4));
}
short[4] small = [2,3,5,7];

struct Factor {
	int[] facts;
	size_t count;
	int num;
	
	this(int num)
	{
		this.num = num;
		this.facts = factor(num, smallPrimes);
		this.count = this.facts.length;
	}

	string toString()
	{
		import std.string:format;
		return format("%s can have %s factors", this.num, this.count);
	}
}

void main(string[] args)
{
	Factor[int] result;
	foreach(int i; 2 .. 99){
		result[i] = Factor(i);
	}
	writeln(result);
	// select prime numbers that are less than 55
	auto r1 = filter!("a < 55")( filter!isprime(iota(2, 100)) );
	// select odd prime numbers that are less than 55
	auto r2 = filter!isprime(iota(3, 55, 2));
	// select all odd number in range (4,55)
	auto r4 = iota(5, 55, 2);
	// use map to add up 2 to r2
	auto r3 = map!("a+2")(r2);
	// r2 intersec r3
	writeln(setIntersection(r4, r3));
	// r2\r3
	writeln(setDifference(r4,r3));
//	remove(r2, r3);
//	foreach(e; r3) { writeln(e);}
	writeln(r4);
//	writeln(filter!("a < 55")( filter!isprime(iota(2, 100)) ));
//	writeln(filter!(q{a%2 == 0	})(iota(2, 100)));
}

