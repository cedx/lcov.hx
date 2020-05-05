<?php
/**
 * Generated by Haxe 4.0.5
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
	 * Creates a new record from the specified JSON object.
	 * @param map A JSON object representing a record.
	 * @return The instance corresponding to the specified JSON object.
	 * 
	 * @param mixed $map
	 * 
	 * @return Record
	 */
	public static function fromJson ($map) {
		#src/lcov/Record.hx:45: characters 78-136
		$tmp = (Boot::is(\Reflect::field($map, "sourceFile"), Boot::getClass('String')) ? \Reflect::field($map, "sourceFile") : "");
		#src/lcov/Record.hx:46: characters 15-98
		$tmp1 = (\Reflect::isObject(\Reflect::field($map, "branches")) ? BranchCoverage::fromJson(\Reflect::field($map, "branches")) : null);
		#src/lcov/Record.hx:47: characters 16-103
		$tmp2 = (\Reflect::isObject(\Reflect::field($map, "functions")) ? FunctionCoverage::fromJson(\Reflect::field($map, "functions")) : null);
		#src/lcov/Record.hx:45: lines 45-49
		return new Record($tmp, new HxAnon([
			"branches" => $tmp1,
			"functions" => $tmp2,
			"lines" => (\Reflect::isObject(\Reflect::field($map, "lines")) ? LineCoverage::fromJson(\Reflect::field($map, "lines")) : null),
		]));
	}

	/**
	 * Creates a new record.
	 * @param sourceFile The path to the source file.
	 * @param options An object specifying values used to initialize this instance.
	 * 
	 * @param string $sourceFile
	 * @param object $options
	 * 
	 * @return void
	 */
	public function __construct ($sourceFile, $options = null) {
		#src/lcov/Record.hx:29: characters 5-100
		$this->branches = (($options !== null) && isset($options->branches) ? $options->branches : null);
		#src/lcov/Record.hx:30: characters 5-103
		$this->functions = (($options !== null) && isset($options->functions) ? $options->functions : null);
		#src/lcov/Record.hx:31: characters 5-91
		$this->lines = (($options !== null) && isset($options->lines) ? $options->lines : null);
		#src/lcov/Record.hx:37: characters 5-33
		$this->sourceFile = $sourceFile;
	}

	/**
	 * An alias for the `toJson()` method.
	 * 
	 * @return object
	 */
	public function jsonSerialize () {
		#src/lcov/Record.hx:80: characters 34-49
		return $this->toJson();
	}

	/**
	 * Converts this object to a map in JSON format.
	 * @return The map in JSON format corresponding to this object.
	 * 
	 * @return object
	 */
	public function toJson () {
		#src/lcov/Record.hx:56: characters 15-58
		$tmp = ($this->branches !== null ? $this->branches->toJson() : null);
		#src/lcov/Record.hx:57: characters 16-61
		$tmp1 = ($this->functions !== null ? $this->functions->toJson() : null);
		#src/lcov/Record.hx:58: characters 12-49
		$tmp2 = ($this->lines !== null ? $this->lines->toJson() : null);
		#src/lcov/Record.hx:55: lines 55-60
		return new HxAnon([
			"branches" => $tmp,
			"functions" => $tmp1,
			"lines" => $tmp2,
			"sourceFile" => $this->sourceFile,
		]);
	}

	/**
	 * Returns a string representation of this object.
	 * @return The string representation of this object.
	 * 
	 * @return string
	 */
	public function toString () {
		#src/lcov/Record.hx:67: characters 5-56
		$output = \Array_hx::wrap(["" . ("SF"??'null') . ":" . ($this->sourceFile??'null')]);
		#src/lcov/Record.hx:68: characters 5-61
		if ($this->functions !== null) {
			#src/lcov/Record.hx:68: characters 28-61
			$x = $this->functions->toString();
			$output->arr[$output->length] = $x;
			++$output->length;
		}
		#src/lcov/Record.hx:69: characters 5-59
		if ($this->branches !== null) {
			#src/lcov/Record.hx:69: characters 27-59
			$x1 = $this->branches->toString();
			$output->arr[$output->length] = $x1;
			++$output->length;
		}
		#src/lcov/Record.hx:70: characters 5-53
		if ($this->lines !== null) {
			#src/lcov/Record.hx:70: characters 24-53
			$x2 = $this->lines->toString();
			$output->arr[$output->length] = $x2;
			++$output->length;
		}
		#src/lcov/Record.hx:71: characters 5-35
		$output->arr[$output->length] = "end_of_record";
		++$output->length;

		#src/lcov/Record.hx:72: characters 5-29
		return $output->join("\x0A");
	}

	public function __toString() {
		return $this->toString();
	}
}

Boot::registerClass(Record::class, 'lcov.Record');
