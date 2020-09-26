<?php
/**
 * Generated by Haxe 4.1.4
 */

namespace lcov;

use \php\Boot;

/**
 * Provides the coverage data of lines.
 */
class LineCoverage {
	/**
	 * @var \Array_hx
	 * The coverage data.
	 */
	public $data;
	/**
	 * @var int
	 * The number of lines found.
	 */
	public $found;
	/**
	 * @var int
	 * The number of lines hit.
	 */
	public $hit;

	/**
	 * Creates a new line coverage.
	 * 
	 * @param int $found
	 * @param int $hit
	 * @param mixed $data
	 * 
	 * @return void
	 */
	public function __construct ($found = 0, $hit = 0, $data = null) {
		if ($found === null) {
			$found = 0;
		}
		if ($hit === null) {
			$hit = 0;
		}
		$this->data = ($data !== null ? \Array_hx::wrap($data) : new \Array_hx());
		$this->found = $found;
		$this->hit = $hit;
	}

	/**
	 * Returns a string representation of this object.
	 * 
	 * @return string
	 */
	public function toString () {
		$_this = $this->data;
		$result = [];
		$data = $_this->arr;
		$_g_current = 0;
		$_g_length = \count($data);
		while ($_g_current < $_g_length) {
			$result[] = $data[$_g_current++]->toString();
		}
		$lines = \Array_hx::wrap($result);
		$lines->arr[$lines->length++] = "LF" . ":" . ($this->found??'null');
		$lines->arr[$lines->length++] = "LH" . ":" . ($this->hit??'null');
		return $lines->join("\x0A");
	}

	public function __toString() {
		return $this->toString();
	}
}

Boot::registerClass(LineCoverage::class, 'lcov.LineCoverage');
