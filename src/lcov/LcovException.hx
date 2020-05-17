package lcov;

/** An exception caused by a parsing error. **/
@:expose
class LcovException #if js extends js.lib.Error.SyntaxError #elseif php extends php.UnexpectedValueException #end {

	#if (!js && !php)
	/** A message describing the error. **/
	public final message: String;
	#end

	/** The offset in `source` where the error was detected. **/
	public final offset: Int;

	/** The actual source input which caused the error. **/
	public final source: String;

	/** Creates a new LCOV exception. **/
	public function new(message: String = "", source: String = "", offset: Int = 0) {
		#if js
		super(message);
		name = "LcovException";
		#elseif php
		super(message);
		#else
		this.message = message;
		#end

		this.offset = offset;
		this.source = source;
	}
}
