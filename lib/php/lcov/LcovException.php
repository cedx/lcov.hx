<?php
/**
 * Generated by Haxe 4.0.5
 */

namespace lcov;

use \php\Boot;

/**
 * An exception caused by a parsing error.
 */
class LcovException extends \UnexpectedValueException {
	/**
	 * @var int
	 * The offset in `source` where the error was detected.
	 */
	public $offset;
	/**
	 * @var string
	 * The actual source input which caused the error.
	 */
	public $source;

	/**
	 * Creates a new LCOV error.
	 * @param message A message describing the error.
	 * @param source The actual source input which caused the error.
	 * @param offset The offset in `source` where the error was detected.
	 * 
	 * @param string $message
	 * @param string $source
	 * @param int $offset
	 * 
	 * @return void
	 */
	public function __construct ($message = "", $source = "", $offset = 0) {
		#src/lcov/LcovException.hx:29: lines 29-41
		if ($message === null) {
			$message = "";
		}
		if ($source === null) {
			$source = "";
		}
		if ($offset === null) {
			$offset = 0;
		}
		#src/lcov/LcovException.hx:34: characters 5-19
		parent::__construct($message);
		#src/lcov/LcovException.hx:39: characters 5-25
		$this->offset = $offset;
		#src/lcov/LcovException.hx:40: characters 5-25
		$this->source = $source;
	}
}

Boot::registerClass(LcovException::class, 'lcov.LcovException');
