<?php
/**
 * Generated by Haxe 4.1.0
 */

namespace lcov;

use \php\_Boot\HxAnon;
use \php\Boot;

/**
 * Provides the coverage data of a source file.
 */
class Record implements \JsonSerializable {
	/**
	 * @var BranchCoverage
	 * The branch coverage.
	 */
	public $branches;
	/**
	 * @var FunctionCoverage
	 * The function coverage.
	 */
	public $functions;
	/**
	 * @var LineCoverage
	 * The line coverage.
	 */
	public $lines;
	/**
	 * @var string
	 * The path to the source file.
	 */
	public $sourceFile;

	/**
	 * Creates a new record with the specified source file.
	 * 
	 * @param string $sourceFile
	 * @param mixed $options
	 * 
	 * @return void
	 */
	public function __construct ($sourceFile, $options = null) {
		$this->lines = null;
		$this->functions = null;
		$this->branches = null;
		$this->sourceFile = $sourceFile;
		if ($options !== null) {
			if (isset($options["branches"])) {
				$this->branches = $options["branches"];
			}
			if (isset($options["functions"])) {
				$this->functions = $options["functions"];
			}
			if (isset($options["lines"])) {
				$this->lines = $options["lines"];
			}
		}
	}

	/**
	 * An alias for the `toJson()` method.
	 * 
	 * @return object
	 */
	public function jsonSerialize () {
		return $this->toJson();
	}

	/**
	 * Converts this object to a map in JSON format.
	 * 
	 * @return object
	 */
	public function toJson () {
		return new HxAnon([
			"branches" => ($this->branches !== null ? $this->branches : null),
			"functions" => ($this->functions !== null ? $this->functions : null),
			"lines" => ($this->lines !== null ? $this->lines : null),
			"sourceFile" => $this->sourceFile,
		]);
	}

	/**
	 * Returns a string representation of this object.
	 * 
	 * @return string
	 */
	public function toString () {
		$output = \Array_hx::wrap(["SF" . ":" . ($this->sourceFile??'null')]);
		if ($this->functions !== null) {
			$x = $this->functions->toString();
			$output->arr[$output->length++] = $x;
		}
		if ($this->branches !== null) {
			$x = $this->branches->toString();
			$output->arr[$output->length++] = $x;
		}
		if ($this->lines !== null) {
			$x = $this->lines->toString();
			$output->arr[$output->length++] = $x;
		}
		$output->arr[$output->length++] = "end_of_record";
		return $output->join("\x0A");
	}

	public function __toString() {
		return $this->toString();
	}
}

Boot::registerClass(Record::class, 'lcov.Record');
