<?php
/**
 * Generated by Haxe 4.0.5
 */

namespace lcov;

use \php\_Boot\HxAnon;
use \php\Boot;

/**
 * Provides the coverage data of lines.
 */
class LineCoverage implements \JsonSerializable {
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
	 * Creates a new line coverage from the specified JSON object.
	 * @param map A JSON object representing a line coverage.
	 * @return The instance corresponding to the specified JSON object.
	 * 
	 * @param mixed $map
	 * 
	 * @return LineCoverage
	 */
	public static function fromJson ($map) {
		#src/lcov/LineCoverage.hx:42: characters 5-49
		$tmp = (Boot::is(\Reflect::field($map, "found"), Boot::getClass('Int')) ? \Reflect::field($map, "found") : 0);
		#src/lcov/LineCoverage.hx:43: characters 5-45
		$tmp1 = (Boot::is(\Reflect::field($map, "hit"), Boot::getClass('Int')) ? \Reflect::field($map, "hit") : 0);
		#src/lcov/LineCoverage.hx:44: characters 5-101
		$tmp2 = null;
		if ((\Reflect::field($map, "data") instanceof \Array_hx)) {
			#src/lcov/LineCoverage.hx:44: characters 34-96
			$_this = \Reflect::field($map, "data");
			$result = [];
			$data = $_this->arr;
			$_g_current = 0;
			$_g_length = count($data);
			$_g_data = $data;
			while ($_g_current < $_g_length) {
				$item = $_g_data[$_g_current++];
				$result[] = LineData::fromJson($item);
			}

			#src/lcov/LineCoverage.hx:44: characters 5-101
			$tmp2 = \Array_hx::wrap($result)->arr;
		} else {
			$tmp2 = (new \Array_hx())->arr;
		}
		#src/lcov/LineCoverage.hx:41: lines 41-45
		return new LineCoverage($tmp, $tmp1, $tmp2);
	}

	/**
	 * Creates a new line coverage.
	 * @param found The number of lines found.
	 * @param hit The number of lines found.
	 * @param data The coverage data.
	 * 
	 * @param int $found
	 * @param int $hit
	 * @param mixed $data
	 * 
	 * @return void
	 */
	public function __construct ($found = 0, $hit = 0, $data = null) {
		#src/lcov/LineCoverage.hx:26: lines 26-34
		if ($found === null) {
			$found = 0;
		}
		if ($hit === null) {
			$hit = 0;
		}
		#src/lcov/LineCoverage.hx:27: characters 5-67
		$this->data = ($data !== null ? \Array_hx::wrap($data) : new \Array_hx());
		#src/lcov/LineCoverage.hx:32: characters 5-23
		$this->found = $found;
		#src/lcov/LineCoverage.hx:33: characters 5-19
		$this->hit = $hit;
	}

	/**
	 * An alias for the `toJson()` method.
	 * 
	 * @return object
	 */
	public function jsonSerialize () {
		#src/lcov/LineCoverage.hx:73: characters 34-49
		return $this->toJson();
	}

	/**
	 * Converts this object to a map in JSON format.
	 * @return The map in JSON format corresponding to this object.
	 * 
	 * @return object
	 */
	public function toJson () {
		#src/lcov/LineCoverage.hx:52: characters 11-42
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

		$tmp = \Array_hx::wrap($result);
		#src/lcov/LineCoverage.hx:51: lines 51-55
		return new HxAnon([
			"data" => $tmp,
			"found" => $this->found,
			"hit" => $this->hit,
		]);
	}

	/**
	 * Returns a string representation of this object.
	 * @return The string representation of this object.
	 * 
	 * @return string
	 */
	public function toString () {
		#src/lcov/LineCoverage.hx:62: characters 19-52
		$_this = $this->data;
		$result = [];
		$data = $_this->arr;
		$_g_current = 0;
		$_g_length = count($data);
		$_g_data = $data;
		while ($_g_current < $_g_length) {
			$item = $_g_data[$_g_current++];
			$result[] = $item->toString();
		}

		#src/lcov/LineCoverage.hx:62: characters 5-53
		$lines = \Array_hx::wrap($result);
		#src/lcov/LineCoverage.hx:63: characters 5-45
		$lines->arr[$lines->length] = "" . ("LF"??'null') . ":" . ($this->found??'null');
		++$lines->length;

		#src/lcov/LineCoverage.hx:64: characters 5-41
		$lines->arr[$lines->length] = "" . ("LH"??'null') . ":" . ($this->hit??'null');
		++$lines->length;

		#src/lcov/LineCoverage.hx:65: characters 5-28
		return $lines->join("\x0A");
	}

	public function __toString() {
		return $this->toString();
	}
}

Boot::registerClass(LineCoverage::class, 'lcov.LineCoverage');
