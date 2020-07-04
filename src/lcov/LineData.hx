package lcov;

/** Provides details for line coverage. **/
@:expose
@:structInit
class LineData {

	/** The data checksum. **/
	public var checksum: String;

	/** The execution count. **/
	public var executionCount: Int;

	/** The line number. **/
	public var lineNumber: Int;

	/** Creates a new line data. **/
	public function new(lineNumber: Int, executionCount = 0, checksum = "") {
		this.checksum = checksum;
		this.executionCount = executionCount;
		this.lineNumber = lineNumber;
	}

	/** Returns a string representation of this object. **/
	public function toString(): String {
		final value = '${Token.LineData}:$lineNumber,$executionCount';
		return checksum.length > 0 ? '$value,$checksum' : value;
	}
}
