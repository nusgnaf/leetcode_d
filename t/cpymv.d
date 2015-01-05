module t.cpymv;

struct S
{
	// payload!
	int[] data;

	this(string s) {
		data.length = 42;
	}

	this(this) {
		// postblit your data
		data = data.dup;
	}

	this(S rhs) {
	}

	this(ref const(S) rhs) {
	}

	ref S opAssign(S rhs) {
	}

	ref S opAssign(ref const(S) rhs) {
	}

}