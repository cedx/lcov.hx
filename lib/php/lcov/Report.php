<?php
/**
 * Generated by Haxe 4.1.1
 */

namespace lcov;

use \php\Boot;
use \php\_Boot\HxString;

/**
 * Represents a trace file, that is a coverage report.
 */
class Report {
	/**
	 * @var \Array_hx
	 * The record list.
	 */
	public $records;
	/**
	 * @var string
	 * The test name.
	 */
	public $testName;

	/**
	 * Parses the specified `coverage` data in [LCOV](http://ltp.sourceforge.net/coverage/lcov.php) format.
	 * Throws a `LcovException` if a parsing error occurred.
	 * 
	 * @param string $coverage
	 * 
	 * @return Report
	 */
	public static function fromCoverage ($coverage) {
		$offset = 0;
		$record = null;
		$report = new Report();
		$_g = 0;
		$_g1 = (new \EReg("\x0D?\x0A", "g"))->split($coverage);
		while ($_g < $_g1->length) {
			$line = ($_g1->arr[$_g] ?? null);
			++$_g;
			$offset += mb_strlen($line);
			$line = trim($line);
			if (mb_strlen($line) === 0) {
				continue;
			}
			$parts = HxString::split($line, ":");
			if (($parts->length < 2) && (($parts->arr[0] ?? null) !== "end_of_record")) {
				throw new LcovException("Invalid token format.", $coverage, $offset);
			}
			if ($parts->length > 0) {
				$parts->length--;
			}
			$token = array_shift($parts->arr);
			$data = HxString::split($parts->join(":"), ",");
			if ($token === null) {
				throw new LcovException("Unknown token.", $coverage, $offset);
			} else {
				if ($token === "BRDA") {
					if ($data->length < 4) {
						throw new LcovException("Invalid branch data.", $coverage, $offset);
					}
					$_this = $record->branches->data;
					$x = \Std::parseInt(($data->arr[0] ?? null));
					$x1 = \Std::parseInt(($data->arr[1] ?? null));
					$x2 = \Std::parseInt(($data->arr[2] ?? null));
					$x3 = new BranchData($x, $x1, $x2, (($data->arr[3] ?? null) === "-" ? 0 : \Std::parseInt(($data->arr[3] ?? null))));
					$_this->arr[$_this->length++] = $x3;
				} else if ($token === "BRF") {
					$record->branches->found = \Std::parseInt(($data->arr[0] ?? null));
				} else if ($token === "BRH") {
					$record->branches->hit = \Std::parseInt(($data->arr[0] ?? null));
				} else if ($token === "DA") {
					if ($data->length < 2) {
						throw new LcovException("Invalid line data.", $coverage, $offset);
					}
					$_this1 = $record->lines->data;
					$x4 = \Std::parseInt(($data->arr[0] ?? null));
					$x5 = \Std::parseInt(($data->arr[1] ?? null));
					$x6 = new LineData($x4, $x5, ($data->length >= 3 ? ($data->arr[2] ?? null) : ""));
					$_this1->arr[$_this1->length++] = $x6;
				} else if ($token === "FN") {
					if ($data->length < 2) {
						throw new LcovException("Invalid function name.", $coverage, $offset);
					}
					$_this2 = $record->functions->data;
					$data1 = ($data->arr[1] ?? null);
					$x7 = new FunctionData($data1, \Std::parseInt(($data->arr[0] ?? null)));
					$_this2->arr[$_this2->length++] = $x7;
				} else if ($token === "FNDA") {
					if ($data->length < 2) {
						throw new LcovException("Invalid function data.", $coverage, $offset);
					}
					$_g2 = 0;
					$_g3 = $record->functions->data;
					while ($_g2 < $_g3->length) {
						$item = ($_g3->arr[$_g2] ?? null);
						++$_g2;
						if ($item->functionName === ($data->arr[1] ?? null)) {
							$item->executionCount = \Std::parseInt(($data->arr[0] ?? null));
							break;
						}
					}
				} else if ($token === "FNF") {
					$record->functions->found = \Std::parseInt(($data->arr[0] ?? null));
				} else if ($token === "FNH") {
					$record->functions->hit = \Std::parseInt(($data->arr[0] ?? null));
				} else if ($token === "LF") {
					$record->lines->found = \Std::parseInt(($data->arr[0] ?? null));
				} else if ($token === "LH") {
					$record->lines->hit = \Std::parseInt(($data->arr[0] ?? null));
				} else if ($token === "SF") {
					$data2 = ($data->arr[0] ?? null);
					$record1 = new BranchCoverage();
					$record2 = new FunctionCoverage();
					$record = new Record($data2, [
						"branches" => $record1,
						"functions" => $record2,
						"lines" => new LineCoverage(),
					]);
				} else if ($token === "TN") {
					if (mb_strlen($report->testName) === 0) {
						$report->testName = ($data->arr[0] ?? null);
					}
				} else if ($token === "end_of_record") {
					$_this3 = $report->records;
					$_this3->arr[$_this3->length++] = $record;
				} else {
					throw new LcovException("Unknown token.", $coverage, $offset);
				}
			}
		}
		if ($report->records->length === 0) {
			throw new LcovException("The coverage data is empty or invalid.", $coverage);
		}
		return $report;
	}

	/**
	 * Creates a new report.
	 * 
	 * @param string $testName
	 * @param mixed $records
	 * 
	 * @return void
	 */
	public function __construct ($testName = "", $records = null) {
		if ($testName === null) {
			$testName = "";
		}
		$this->records = ($records !== null ? \Array_hx::wrap($records) : new \Array_hx());
		$this->testName = $testName;
	}

	/**
	 * Returns a string representation of this object.
	 * 
	 * @return string
	 */
	public function toString () {
		$lines = (mb_strlen($this->testName) > 0 ? \Array_hx::wrap(["TN" . ":" . ($this->testName??'null')]) : new \Array_hx());
		$_g = 0;
		$_this = $this->records;
		$result = [];
		$data = $_this->arr;
		$_g_current = 0;
		$_g_length = count($data);
		while ($_g_current < $_g_length) {
			$result[] = $data[$_g_current++]->toString();
		}
		$_g1 = \Array_hx::wrap($result);
		while ($_g < $_g1->length) {
			$record = ($_g1->arr[$_g++] ?? null);
			$lines->arr[$lines->length++] = $record;
		}
		return $lines->join("\x0A");
	}

	public function __toString() {
		return $this->toString();
	}
}

Boot::registerClass(Report::class, 'lcov.Report');
