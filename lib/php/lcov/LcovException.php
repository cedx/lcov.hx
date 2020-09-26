<?php
/**
 * Generated by Haxe 4.1.4
 */

namespace lcov;

use \php\Boot;
use \haxe\Exception;

/**
 * An exception caused by a parsing error.
 */
class LcovException extends Exception {
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
	 * Creates a new LCOV exception.
	 * 
	 * @param string $message
	 * @param string $source
	 * @param int $offset
	 * @param Exception $previous
	 * 
	 * @return void
	 */
	public function __construct ($message = "", $source = "", $offset = 0, $previous = null) {
		if ($message === null) {
			$message = "";
		}
		if ($source === null) {
			$source = "";
		}
		if ($offset === null) {
			$offset = 0;
		}
		parent::__construct($message, $previous);
		$this->offset = $offset;
		$this->source = $source;
	}
}

Boot::registerClass(LcovException::class, 'lcov.LcovException');
