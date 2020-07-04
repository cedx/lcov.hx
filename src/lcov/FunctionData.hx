package lcov;

/** Provides details for function coverage. **/
@:expose
@:structInit
class FunctionData {

	/** The execution count. **/
	public var executionCount: Int;

	/** The function name. **/
	public var functionName: String;

	/** The line number of the function start. **/
	public var lineNumber: Int;

	/** Creates a new function data. **/
	public function new(functionName: String, lineNumber: Int, executionCount = 0) {
		this.executionCount = executionCount;
		this.functionName = functionName;
		this.lineNumber = lineNumber;
	}

	/** Returns a string representation of this object. **/
	public function toString(asDefinition: Bool = false): String {
		final token: Token = asDefinition ? FunctionName : FunctionData;
		final number = asDefinition ? lineNumber : executionCount;
		return '$token:$number,$functionName';
	}
}
