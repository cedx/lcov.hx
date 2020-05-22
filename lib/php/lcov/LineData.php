<?php
/**
 * Generated by Haxe 4.1.1
 */

namespace lcov;

use \php\Boot;

/**
 * Provides details for line coverage.
 */
class LineData {
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
	 * Creates a new line data.
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
	 * Returns a string representation of this object.
	 * 
	 * @return string
	 */
	public function toString () {
		$value = "DA" . ":" . ($this->lineNumber??'null') . "," . ($this->executionCount??'null');
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
