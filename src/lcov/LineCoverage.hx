package lcov;

import coconut.data.List;
import coconut.data.Model;

/** Provides the coverage data of lines. **/
@:jsonParse(json -> new lcov.LineCoverage(json))
@:jsonStringify(coverage -> {data: coverage.data, found: coverage.found, hit: coverage.hit})
class LineCoverage implements Model {

	/** The coverage data. **/
	@:editable var data: List<LineData> = @byDefault new List();

	/** The number of lines found. **/
	@:editable var found: Int = @byDefault 0;

	/** The number of lines hit. **/
	@:editable var hit: Int = @byDefault 0;

	/** Returns a string representation of this object. **/
	public function toString() {
		final lines = data.toArray().map(item -> item.toString());
		lines.push('${Token.LinesFound}:$found');
		lines.push('${Token.LinesHit}:$hit');
		return lines.join("\n");
	}
}
