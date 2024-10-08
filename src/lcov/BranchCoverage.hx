package lcov;

import coconut.data.List;
import coconut.data.Model;

/** Provides the coverage data of branches. **/
@:jsonParse(json -> new lcov.BranchCoverage(json))
@:jsonStringify(coverage -> {data: coverage.data, found: coverage.found, hit: coverage.hit})
class BranchCoverage implements Model {

	/** The coverage data. **/
	@:editable var data: List<BranchData> = @byDefault new List();

	/** The number of branches found. **/
	@:editable var found: Int = @byDefault 0;

	/** The number of branches hit. **/
	@:editable var hit: Int = @byDefault 0;

	/** Returns a string representation of this object. **/
	public function toString(): String {
		final lines = data.toArray().map(item -> item.toString());
		lines.push('${Token.BranchesFound}:$found');
		lines.push('${Token.BranchesHit}:$hit');
		return lines.join("\n");
	}
}
