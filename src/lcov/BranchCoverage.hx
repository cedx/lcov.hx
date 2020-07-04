package lcov;

#if php
import php.NativeIndexedArray;
#end

/** Provides the coverage data of branches. **/
@:expose class BranchCoverage {

	/** The coverage data. **/
	public final data: Array<BranchData>;

	/** The number of branches found. **/
	public var found: Int;

	/** The number of branches hit. **/
	public var hit: Int;

	/** Creates a new branch coverage. **/
	public function new(found = 0, hit = 0, ?data: #if php NativeIndexedArray<BranchData> #else Array<BranchData> #end) {
		this.data = data != null ? data : [];
		this.found = found;
		this.hit = hit;
	}

	/** Returns a string representation of this object. **/
	public function toString(): String {
		final lines = data.map(item -> item.toString());
		lines.push('${Token.BranchesFound}:$found');
		lines.push('${Token.BranchesHit}:$hit');
		return lines.join("\n");
	}
}
