package lcov;

/** Provides details for function coverage. **/
@:expose class FunctionData {
	
	/** The execution count. **/
	public var executionCount: Int;

	/** The function name. **/
	public var functionName: String;

	/** The line number of the function start. **/
	public var lineNumber: Int;

	/** Creates a new function data. **/
	public function new(functionName: String, lineNumber: Int, executionCount: Int = 0) {
		this.executionCount = executionCount;
		this.functionName = functionName;
		this.lineNumber = lineNumber;
	}

	/** Returns a string representation of this object. **/
	public function toString(asDefinition: Bool = false): String {
		final token = asDefinition ? Token.functionName : Token.functionData;
		final count = asDefinition ? lineNumber : executionCount;
		return '$token:$count,$functionName';
	}
}
