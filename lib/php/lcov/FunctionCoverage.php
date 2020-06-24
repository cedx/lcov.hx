<?php
/**
 * Generated by Haxe 4.1.2
 */

namespace lcov;

use \php\Boot;

/**
 * Provides the coverage data of functions.
 */
class FunctionCoverage {
	/**
	 * @var \Array_hx
	 * The coverage data.
	 */
	public $data;
	/**
	 * @var int
	 * The number of functions found.
	 */
	public $found;
	/**
	 * @var int
	 * The number of functions hit.
	 */
	public $hit;

	/**
	 * Creates a new function coverage.
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
		$_g_length = count($data);
		while ($_g_current < $_g_length) {
			$result[] = $data[$_g_current++]->toString(true);
		}
		$lines = \Array_hx::wrap($result);
		$_g = 0;
		$_this = $this->data;
		$result = [];
		$data = $_this->arr;
		$_g_current = 0;
		$_g_length = count($data);
		while ($_g_current < $_g_length) {
			$result[] = $data[$_g_current++]->toString(false);
		}
		$_g1 = \Array_hx::wrap($result);
		while ($_g < $_g1->length) {
			$line = ($_g1->arr[$_g++] ?? null);
			$lines->arr[$lines->length++] = $line;
		}
		$lines->arr[$lines->length++] = "FNF" . ":" . ($this->found??'null');
		$lines->arr[$lines->length++] = "FNH" . ":" . ($this->hit??'null');
		return $lines->join("\x0A");
	}

	public function __toString() {
		return $this->toString();
	}
}

Boot::registerClass(FunctionCoverage::class, 'lcov.FunctionCoverage');
