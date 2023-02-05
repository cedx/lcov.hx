package lcov;

import coconut.data.Model;

/** Provides details for function coverage. **/
@:jsonParse(json -> new lcov.FunctionData(json))
@:jsonStringify(data -> {
	executionCount: data.executionCount,
	functionName: data.functionName,
	lineNumber: data.lineNumber
})
class FunctionData implements Model {

	/** The execution count. **/
	@:editable var executionCount: Int = @byDefault 0;

	/** The function name. **/
	@:editable var functionName: String = @byDefault "";

	/** The line number of the function start. **/
	@:editable var lineNumber: Int = @byDefault 0;

	/** Returns a string representation of this object. **/
	public function toString(asDefinition: Bool = false) {
		final token: Token = asDefinition ? FunctionName : FunctionData;
		final number = asDefinition ? lineNumber : executionCount;
		return '$token:$number,$functionName';
	}
}
