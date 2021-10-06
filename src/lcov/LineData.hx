package lcov;

/** Provides details for line coverage. **/
#if tink_json
@:jsonParse(json -> new lcov.LineData(json))
@:jsonStringify(data -> {
	checksum: data.checksum,
	executionCount: data.executionCount,
	lineNumber: data.lineNumber
})
#end
class LineData implements Model {

	/** The data checksum. **/
	@:editable var checksum: String = @byDefault "";

	/** The execution count. **/
	@:editable var executionCount: Int = @byDefault 0;

	/** The line number. **/
	@:editable var lineNumber: Int;

	/** Returns a string representation of this object. **/
	public function toString() {
		final value = '${Token.LineData}:$lineNumber,$executionCount';
		return checksum.length > 0 ? '$value,$checksum' : value;
	}
}
