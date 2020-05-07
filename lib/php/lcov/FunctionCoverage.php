<?php
/**
 * Generated by Haxe 4.0.5
 */

namespace lcov;

use \php\_Boot\HxAnon;
use \php\Boot;

/**
 * Provides the coverage data of functions.
 */
class FunctionCoverage implements \JsonSerializable {
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
	 * Creates a new function coverage from the specified `map` in JSON format.
	 * 
	 * @param mixed $map
	 * 
	 * @return FunctionCoverage
	 */
	public static function fromJson ($map) {
		$tmp = (Boot::is(\Reflect::field($map, "found"), Boot::getClass('Int')) ? \Reflect::field($map, "found") : 0);
		$tmp1 = (Boot::is(\Reflect::field($map, "hit"), Boot::getClass('Int')) ? \Reflect::field($map, "hit") : 0);
		$tmp2 = null;
		if ((\Reflect::field($map, "data") instanceof \Array_hx)) {
			$_this = \Reflect::field($map, "data");
			$result = [];
			$data = $_this->arr;
			$_g_current = 0;
			$_g_length = count($data);
			$_g_data = $data;
			while ($_g_current < $_g_length) {
				$item = $_g_data[$_g_current++];
				$result[] = FunctionData::fromJson($item);
			}

			$tmp2 = \Array_hx::wrap($result)->arr;
		} else {
			$tmp2 = (new \Array_hx())->arr;
		}
		return new FunctionCoverage($tmp, $tmp1, $tmp2);
	}

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
		$_this = $this->data;
		$result = [];
		$data = $_this->arr;
		$_g_current = 0;
		$_g_length = count($data);
		$_g_data = $data;
		while ($_g_current < $_g_length) {
			$item = $_g_data[$_g_current++];
			$result[] = $item->toJson();
		}

		$tmp = \Array_hx::wrap($result)->arr;
		return new HxAnon([
			"data" => $tmp,
			"found" => $this->found,
			"hit" => $this->hit,
		]);
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
		$_g_data = $data;
		while ($_g_current < $_g_length) {
			$item = $_g_data[$_g_current++];
			$result[] = $item->toString(true);
		}

		$lines = \Array_hx::wrap($result);
		$_g = 0;
		$_this1 = $this->data;
		$result1 = [];
		$data1 = $_this1->arr;
		$_g_current1 = 0;
		$_g_length1 = count($data1);
		$_g_data1 = $data1;
		while ($_g_current1 < $_g_length1) {
			$item1 = $_g_data1[$_g_current1++];
			$result1[] = $item1->toString(false);
		}

		$_g1 = \Array_hx::wrap($result1);
		while ($_g < $_g1->length) {
			$line = ($_g1->arr[$_g] ?? null);
			++$_g;
			$lines->arr[$lines->length] = $line;
			++$lines->length;

		}

		$lines->arr[$lines->length] = "" . ("FNF"??'null') . ":" . ($this->found??'null');
		++$lines->length;

		$lines->arr[$lines->length] = "" . ("FNH"??'null') . ":" . ($this->hit??'null');
		++$lines->length;

		return $lines->join("\x0A");
	}

	public function __toString() {
		return $this->toString();
	}
}

Boot::registerClass(FunctionCoverage::class, 'lcov.FunctionCoverage');
