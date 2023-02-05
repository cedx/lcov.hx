package lcov;

import coconut.data.Model;

/** Provides the coverage data of a source file. **/
@:jsonParse(json -> new lcov.SourceFile(json))
@:jsonStringify(sourceFile -> {
	branches: sourceFile.branches,
	functions: sourceFile.functions,
	lines: sourceFile.lines,
	path: sourceFile.path
})
class SourceFile implements Model {

	/** The branch coverage. **/
	@:editable var branches: Null<BranchCoverage> = @byDefault null;

	/** The function coverage. **/
	@:editable var functions: Null<FunctionCoverage> = @byDefault null;

	/** The line coverage. **/
	@:editable var lines: Null<LineCoverage> = @byDefault null;

	/** The path to the source file. **/
	@:editable var path: String;

	/** Returns a string representation of this object. **/
	public function toString() {
		final output = ['${Token.SourceFile}:$path'];
		if (functions != null) output.push(functions.toString());
		if (branches != null) output.push(branches.toString());
		if (lines != null) output.push(lines.toString());
		output.push(Token.EndOfRecord);
		return output.join("\n");
	}
}
