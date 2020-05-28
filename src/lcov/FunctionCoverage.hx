package lcov;

/** Provides the coverage data of functions. **/
@:expose class FunctionCoverage {

	/** The coverage data. **/
	public final data: Array<FunctionData>;

	/** The number of functions found. **/
	public var found: Int;

	/** The number of functions hit. **/
	public var hit: Int;

	/** Creates a new function coverage. **/
	public function new(found: Int = 0, hit: Int = 0, ?data: #if php NativeIndexedArray<FunctionData> #else Array<FunctionData> #end) {
		this.data = data != null ? #if php cast toHaxeArray(data) #else data #end : [];
		this.found = found;
		this.hit = hit;
	}

	/** Returns a string representation of this object. **/
	public function toString(): String {
		final lines = data.map(item -> item.toString(true));
		for (line in data.map(item -> item.toString(false))) lines.push(line);
		lines.push('${Token.functionsFound}:$found');
		lines.push('${Token.functionsHit}:$hit');
		return lines.join("\n");
	}
}
