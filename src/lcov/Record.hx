package lcov;

#if php
import php.Global.isset;
import php.NativeStructArray;
#end

/** Provides the coverage data of a source file. **/
@:expose class Record {

	/** The branch coverage. **/
	public var branches: Null<BranchCoverage> = null;

	/** The function coverage. **/
	public var functions: Null<FunctionCoverage> = null;

	/** The line coverage. **/
	public var lines: Null<LineCoverage> = null;

	/** The path to the source file. **/
	public var sourceFile: String;

	/** Creates a new record with the specified source file. **/
	public function new(sourceFile: String, ?options: #if php NativeStructArray<RecordOptions> #else RecordOptions #end) {
		this.sourceFile = sourceFile;
		if (options != null) {
			#if php
			if (isset(options["branches"])) branches = options["branches"];
			if (isset(options["functions"])) functions = options["functions"];
			if (isset(options["lines"])) lines = options["lines"];
			#else
			if (options.branches != null) branches = options.branches;
			if (options.functions != null) functions = options.functions;
			if (options.lines != null) lines = options.lines;
			#end
		}
	}

	/** Returns a string representation of this object. **/
	public function toString(): String {
		final output = ['${Token.sourceFile}:$sourceFile'];
		if (functions != null) output.push(functions.toString());
		if (branches != null) output.push(branches.toString());
		if (lines != null) output.push(lines.toString());
		output.push(Token.endOfRecord);
		return output.join("\n");
	}
}

/** Defines the options of a `Record` instance. **/
typedef RecordOptions = {

	/** The branch coverage. **/
	var ?branches: BranchCoverage;

	/** The function coverage. **/
	var ?functions: FunctionCoverage;

	/** The line coverage. **/
	var ?lines: LineCoverage;
}
