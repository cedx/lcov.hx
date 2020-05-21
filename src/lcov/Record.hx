package lcov;

#if php
import php.Global.isset;
import php.NativeStructArray;
#end

/** Provides the coverage data of a source file. **/
@:expose
class Record #if php implements JsonSerializable<Dynamic> #end {
	
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
			if (isset(options["branches"])) this.branches = options["branches"];
			if (isset(options["functions"])) this.functions = options["functions"];
			if (isset(options["lines"])) this.lines = options["lines"];
			#else
			if (options.branches != null) this.branches = options.branches;
			if (options.functions != null) this.functions = options.functions;
			if (options.lines != null) this.lines = options.lines;
			#end
		}
	}

	/** Converts this object to a map in JSON format. **/
	public function toJson() return {
		branches: branches != null ? branches.toJson() : null,
		functions: functions != null ? functions.toJson() : null,
		lines: lines != null ? lines.toJson() : null,
		sourceFile: sourceFile
	};

	/** Returns a string representation of this object. **/
	public function toString(): String {
		final output = ['${Token.sourceFile}:$sourceFile'];
		if (functions != null) output.push(functions.toString());
		if (branches != null) output.push(branches.toString());
		if (lines != null) output.push(lines.toString());
		output.push(Token.endOfRecord);
		return output.join("\n");
	}

	#if js
	/** An alias for the `toJson()` method. **/
	public function toJSON() return toJson();
	#elseif php
	/** An alias for the `toJson()` method. **/
	public function jsonSerialize() return toJson();
	#end
}

/** Defines the options of a `Record` instance. */
typedef RecordOptions = {

	/** The branch coverage. */
	@:optional var branches: BranchCoverage;

	/** The function coverage. */
	@:optional var functions: FunctionCoverage;

	/** The line coverage. */
	@:optional var lines: LineCoverage;
}
