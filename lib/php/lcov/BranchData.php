<?php
/**
 * Generated by Haxe 4.1.0
 */

namespace lcov;

use \php\_Boot\HxAnon;
use \php\Boot;

/**
 * Provides details for branch coverage.
 */
class BranchData implements \JsonSerializable {
	/**
	 * @var int
	 * The block number.
	 */
	public $blockNumber;
	/**
	 * @var int
	 * The branch number.
	 */
	public $branchNumber;
	/**
	 * @var int
	 * The line number.
	 */
	public $lineNumber;
	/**
	 * @var int
	 * A number indicating how often this branch was taken.
	 */
	public $taken;

	/**
	 * Creates a new branch data.
	 * 
	 * @param int $lineNumber
	 * @param int $blockNumber
	 * @param int $branchNumber
	 * @param int $taken
	 * 
	 * @return void
	 */
	public function __construct ($lineNumber, $blockNumber, $branchNumber, $taken = 0) {
		if ($taken === null) {
			$taken = 0;
		}
		$this->blockNumber = $blockNumber;
		$this->branchNumber = $branchNumber;
		$this->lineNumber = $lineNumber;
		$this->taken = $taken;
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
			"blockNumber" => $this->blockNumber,
			"branchNumber" => $this->branchNumber,
			"lineNumber" => $this->lineNumber,
			"taken" => $this->taken,
		]);
	}

	/**
	 * Returns a string representation of this object.
	 * 
	 * @return string
	 */
	public function toString () {
		$value = "BRDA" . ":" . ($this->lineNumber??'null') . "," . ($this->blockNumber??'null') . "," . ($this->branchNumber??'null');
		if ($this->taken > 0) {
			return "" . ($value??'null') . "," . ($this->taken??'null');
		} else {
			return "" . ($value??'null') . ",-";
		}
	}

	public function __toString() {
		return $this->toString();
	}
}

Boot::registerClass(BranchData::class, 'lcov.BranchData');
