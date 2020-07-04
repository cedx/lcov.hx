package lcov;

#if php
import php.NativeIndexedArray;
#end

/** Provides the coverage data of lines. **/
@:expose class LineCoverage {

	/** The coverage data. **/
	public final data: Array<LineData>;

	/** The number of lines found. **/
	public var found: Int;

	/** The number of lines hit. **/
	public var hit: Int;

	/** Creates a new line coverage. **/
	public function new(found = 0, hit = 0, ?data: #if php NativeIndexedArray<LineData> #else Array<LineData> #end) {
		this.data = data != null ? data : [];
		this.found = found;
		this.hit = hit;
	}

	/** Returns a string representation of this object. **/
	public function toString(): String {
		final lines = data.map(item -> item.toString());
		lines.push('${Token.LinesFound}:$found');
		lines.push('${Token.LinesHit}:$hit');
		return lines.join("\n");
	}
}
