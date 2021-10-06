package lcov;

/** Provides the coverage data of functions. **/
#if tink_json
@:jsonParse(json -> new lcov.FunctionCoverage(json))
@:jsonStringify(coverage -> {
	data: coverage.data,
	found: coverage.found,
	hit: coverage.hit
})
#end
class FunctionCoverage implements Model {

	/** The coverage data. **/
	@:editable var data: List<FunctionData> = @byDefault [];

	/** The number of functions found. **/
	@:editable var found: Int = @byDefault 0;

	/** The number of functions hit. **/
	@:editable var hit: Int = @byDefault 0;

	/** Returns a string representation of this object. **/
	public function toString() {
		final lines = data.toArray().map(item -> item.toString(true));
		for (line in data.map(item -> item.toString(false))) lines.push(line);
		lines.push('${Token.FunctionsFound}:$found');
		lines.push('${Token.FunctionsHit}:$hit');
		return lines.join("\n");
	}
}
