<?php
/**
 * Generated by Haxe 4.1.5
 */

namespace lcov;

use \php\Boot;

/**
 * Provides details for function coverage.
 */
class FunctionData {
	/**
	 * @var int
	 * The execution count.
	 */
	public $executionCount;
	/**
	 * @var string
	 * The function name.
	 */
	public $functionName;
	/**
	 * @var int
	 * The line number of the function start.
	 */
	public $lineNumber;

	/**
	 * Creates a new function data.
	 * 
	 * @param string $functionName
	 * @param int $lineNumber
	 * @param int $executionCount
	 * 
	 * @return void
	 */
	public function __construct ($functionName, $lineNumber, $executionCount = 0) {
		if ($executionCount === null) {
			$executionCount = 0;
		}
		$this->executionCount = $executionCount;
		$this->functionName = $functionName;
		$this->lineNumber = $lineNumber;
	}

	/**
	 * Returns a string representation of this object.
	 * 
	 * @param bool $asDefinition
	 * 
	 * @return string
	 */
	public function toString ($asDefinition = false) {
		if ($asDefinition === null) {
			$asDefinition = false;
		}
		return "" . ((($asDefinition ? "FN" : "FNDA"))??'null') . ":" . ((($asDefinition ? $this->lineNumber : $this->executionCount))??'null') . "," . ($this->functionName??'null');
	}

	public function __toString() {
		return $this->toString();
	}
}

Boot::registerClass(FunctionData::class, 'lcov.FunctionData');
