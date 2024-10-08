package lcov;

import coconut.data.Model;

/** Provides details for line coverage. **/
@:jsonParse(json -> new lcov.LineData(json))
@:jsonStringify(data -> {
	checksum: data.checksum,
	executionCount: data.executionCount,
	lineNumber: data.lineNumber
})
class LineData implements Model {

	/** The data checksum. **/
	@:editable var checksum: String = @byDefault "";

	/** The execution count. **/
	@:editable var executionCount: Int = @byDefault 0;

	/** The line number. **/
	@:editable var lineNumber: Int = @byDefault 0;

	/** Returns a string representation of this object. **/
	public function toString(): String {
		final value = '${Token.LineData}:$lineNumber,$executionCount';
		return checksum.length > 0 ? '$value,$checksum' : value;
	}
}
