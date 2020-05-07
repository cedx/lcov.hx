<?php
/**
 * Generated by Haxe 4.0.5
 */

namespace lcov;

use \php\_Boot\HxAnon;
use \php\Boot;

/**
 * Provides details for line coverage.
 */
class LineData implements \JsonSerializable {
	/**
	 * @var string
	 * The data checksum.
	 */
	public $checksum;
	/**
	 * @var int
	 * The execution count.
	 */
	public $executionCount;
	/**
	 * @var int
	 * The line number.
	 */
	public $lineNumber;

	/**
	 * Creates a new line data from the specified JSON object.
	 * @param map A JSON object representing a line data.
	 * @return The instance corresponding to the specified JSON object.
	 * 
	 * @param mixed $map
	 * 
	 * @return LineData
	 */
	public static function fromJson ($map) {
		$tmp = (Boot::is(\Reflect::field($map, "lineNumber"), Boot::getClass('Int')) ? \Reflect::field($map, "lineNumber") : 0);
		$tmp1 = (Boot::is(\Reflect::field($map, "executionCount"), Boot::getClass('Int')) ? \Reflect::field($map, "executionCount") : 0);
		return new LineData($tmp, $tmp1, (Boot::is(\Reflect::field($map, "checksum"), Boot::getClass('String')) ? \Reflect::field($map, "checksum") : ""));
	}

	/**
	 * Creates a new line data.
	 * @param lineNumber The line number.
	 * @param executionCount The execution count.
	 * @param checksum The data checksum.
	 * 
	 * @param int $lineNumber
	 * @param int $executionCount
	 * @param string $checksum
	 * 
	 * @return void
	 */
	public function __construct ($lineNumber, $executionCount = 0, $checksum = "") {
		if ($executionCount === null) {
			$executionCount = 0;
		}
		if ($checksum === null) {
			$checksum = "";
		}
		$this->checksum = $checksum;
		$this->executionCount = $executionCount;
		$this->lineNumber = $lineNumber;
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
	 * @return The map in JSON format corresponding to this object.
	 * 
	 * @return object
	 */
	public function toJson () {
		return new HxAnon([
			"checksum" => $this->checksum,
			"executionCount" => $this->executionCount,
			"lineNumber" => $this->lineNumber,
		]);
	}

	/**
	 * Returns a string representation of this object.
	 * @return The string representation of this object.
	 * 
	 * @return string
	 */
	public function toString () {
		$value = "" . ("DA"??'null') . ":" . ($this->lineNumber??'null') . "," . ($this->executionCount??'null');
		if (mb_strlen($this->checksum) > 0) {
			return "" . ($value??'null') . "," . ($this->checksum??'null');
		} else {
			return $value;
		}
	}

	public function __toString() {
		return $this->toString();
	}
}

Boot::registerClass(LineData::class, 'lcov.LineData');
