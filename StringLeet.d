module StringLeet;
import std.string;
import std.algorithm: reverse;


/**
 * testing is the input strins is palindrome form.
 */
bool isPalindrome(string input)
{
	// remove nonletter->lowercase->check the reverse form 
	string normalized = removechars(input, "^a-zA-Z");
	string lowerit = toLower(normalized);
	char[] lastone = lowerit.dup;
	reverse(lastone);
	return lastone.idup == lowerit;
}

///
unittest {
	assert(isPalindrome("A man, a plan, a canal: Panama"));
	assert(!isPalindrome("race a car!"));
	assert(isPalindrome("aoIOa"));
	assert(isPalindrome("ant is si tn a"));
}

