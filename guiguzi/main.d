module main;

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
{
	assert(num > 1 && num <100); // never call isprime(1)!

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
void fun(){
	writeln(small);
}

void main(string[] args)
{
	int[][int] result;
	foreach(int i; 2 .. 99){
		result[i] = factor(i, smallPrimes);
	}
	writeln(result);
}

