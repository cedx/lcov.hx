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
		#src/lcov/LineData.hx:37: characters 5-59
		$tmp = (Boot::is(\Reflect::field($map, "lineNumber"), Boot::getClass('Int')) ? \Reflect::field($map, "lineNumber") : 0);
		#src/lcov/LineData.hx:38: characters 5-67
		$tmp1 = (Boot::is(\Reflect::field($map, "executionCount"), Boot::getClass('Int')) ? \Reflect::field($map, "executionCount") : 0);
		#src/lcov/LineData.hx:36: lines 36-40
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
		#src/lcov/LineData.hx:25: lines 25-29
		if ($executionCount === null) {
			$executionCount = 0;
		}
		if ($checksum === null) {
			$checksum = "";
		}
		#src/lcov/LineData.hx:26: characters 5-29
		$this->checksum = $checksum;
		#src/lcov/LineData.hx:27: characters 5-41
		$this->executionCount = $executionCount;
		#src/lcov/LineData.hx:28: characters 5-33
		$this->lineNumber = $lineNumber;
	}

	/**
	 * An alias for the `toJson()` method.
	 * 
	 * @return object
	 */
	public function jsonSerialize () {
		#src/lcov/LineData.hx:66: characters 34-49
		return $this->toJson();
	}

	/**
	 * Converts this object to a map in JSON format.
	 * @return The map in JSON format corresponding to this object.
	 * 
	 * @return object
	 */
	public function toJson () {
		#src/lcov/LineData.hx:46: lines 46-50
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
		#src/lcov/LineData.hx:57: characters 5-67
		$value = "" . ("DA"??'null') . ":" . ($this->lineNumber??'null') . "," . ($this->executionCount??'null');
		#src/lcov/LineData.hx:58: characters 12-60
		if (mb_strlen($this->checksum) > 0) {
			#src/lcov/LineData.hx:58: characters 35-51
			return "" . ($value??'null') . "," . ($this->checksum??'null');
		} else {
			#src/lcov/LineData.hx:58: characters 55-60
			return $value;
		}
	}

	public function __toString() {
		return $this->toString();
	}
}

Boot::registerClass(LineData::class, 'lcov.LineData');