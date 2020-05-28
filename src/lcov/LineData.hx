package lcov;

/** Provides details for line coverage. **/
@:expose class LineData {

	/** The data checksum. **/
	public var checksum: String;

	/** The execution count. **/
	public var executionCount: Int;

	/** The line number. **/
	public var lineNumber: Int;

	/** Creates a new line data. **/
	public function new(lineNumber: Int, executionCount: Int = 0, checksum: String = "") {
		this.checksum = checksum;
		this.executionCount = executionCount;
		this.lineNumber = lineNumber;
	}

	/** Returns a string representation of this object. **/
	public function toString(): String {
		final value = '${Token.lineData}:$lineNumber,$executionCount';
		return checksum.length > 0 ? '$value,$checksum' : value;
	}
}
