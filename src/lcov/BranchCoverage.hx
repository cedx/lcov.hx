package lcov;

/** Provides the coverage data of branches. **/
@:expose class BranchCoverage {

	/** The coverage data. **/
	public final data: Array<BranchData>;

	/** The number of branches found. **/
	public var found: Int;

	/** The number of branches hit. **/
	public var hit: Int;

	/** Creates a new branch coverage. **/
	public function new(found: Int = 0, hit: Int = 0, ?data: #if php NativeIndexedArray<BranchData> #else Array<BranchData> #end) {
		this.data = data != null ? #if php cast toHaxeArray(data) #else data #end : [];
		this.found = found;
		this.hit = hit;
	}

	/** Returns a string representation of this object. **/
	public function toString(): String {
		final lines = data.map(item -> item.toString());
		lines.push('${Token.branchesFound}:$found');
		lines.push('${Token.branchesHit}:$hit');
		return lines.join("\n");
	}
}
