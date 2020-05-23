package lcov;

import haxe.Exception;

/** An exception caused by a parsing error. **/
@:expose class LcovException extends Exception {

	/** The offset in `source` where the error was detected. **/
	public final offset: Int;

	/** The actual source input which caused the error. **/
	public final source: String;

	/** Creates a new LCOV exception. **/
	public function new(message: String = "", source: String = "", offset: Int = 0, ?previous: Exception) {
		super(message, previous);
		this.offset = offset;
		this.source = source;
	}
}
