package lcov;

#if php
import php.NativeIndexedArray;
#end

/** Provides the coverage data of functions. **/
@:expose class FunctionCoverage {

	/** The coverage data. **/
	public final data: Array<FunctionData>;

	/** The number of functions found. **/
	public var found: Int;

	/** The number of functions hit. **/
	public var hit: Int;

	/** Creates a new function coverage. **/
	public function new(found = 0, hit = 0, ?data: #if php NativeIndexedArray<FunctionData> #else Array<FunctionData> #end) {
		this.data = data != null ? data : [];
		this.found = found;
		this.hit = hit;
	}

	/** Returns a string representation of this object. **/
	public function toString(): String {
		final lines = data.map(item -> item.toString(true));
		for (line in data.map(item -> item.toString(false))) lines.push(line);
		lines.push('${Token.FunctionsFound}:$found');
		lines.push('${Token.FunctionsHit}:$hit');
		return lines.join("\n");
	}
}
