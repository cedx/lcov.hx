package lcov;

import coconut.data.List;
import coconut.data.Model;

/** Provides the coverage data of functions. **/
@:jsonParse(json -> new lcov.FunctionCoverage(json))
@:jsonStringify(coverage -> {data: coverage.data, found: coverage.found, hit: coverage.hit})
class FunctionCoverage implements Model {

	/** The coverage data. **/
	@:editable var data: List<FunctionData> = @byDefault new List();

	/** The number of functions found. **/
	@:editable var found: Int = @byDefault 0;

	/** The number of functions hit. **/
	@:editable var hit: Int = @byDefault 0;

	/** Returns a string representation of this object. **/
	public function toString(): String {
		final lines = data.toArray().map(item -> item.toString(true));
		for (line in data.map(item -> item.toString(false))) lines.push(line);
		lines.push('${Token.FunctionsFound}:$found');
		lines.push('${Token.FunctionsHit}:$hit');
		return lines.join("\n");
	}
}
