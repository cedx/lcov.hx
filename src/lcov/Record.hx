package lcov;

/** Provides the coverage data of a source file. **/
@:jsonParse(json -> new lcov.Record(json))
@:jsonStringify(record -> {
	branches: record.branches,
	functions: record.functions,
	lines: record.lines,
	sourceFile: record.sourceFile
})
class Record implements Model {

	/** The branch coverage. **/
	@:editable var branches: Null<BranchCoverage> = @byDefault null;

	/** The function coverage. **/
	@:editable var functions: Null<FunctionCoverage> = @byDefault null;

	/** The line coverage. **/
	@:editable var lines: Null<LineCoverage> = @byDefault null;

	/** The path to the source file. **/
	@:editable var sourceFile: String;

	/** Returns a string representation of this object. **/
	public function toString() {
		final output = ['${Token.SourceFile}:$sourceFile'];
		if (functions != null) output.push(functions.toString());
		if (branches != null) output.push(branches.toString());
		if (lines != null) output.push(lines.toString());
		output.push(Token.EndOfRecord);
		return output.join("\n");
	}
}
