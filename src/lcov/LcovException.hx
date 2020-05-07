package lcov;

#if js
import js.lib.Error.SyntaxError;
#end

/** An exception caused by a parsing error. **/
@:expose
class LcovException #if js extends SyntaxError #elseif php extends UnexpectedValueException #end {

  #if (!js && !php)
  /** A message describing the error. **/
  public var message(default, null): String;
  #end

  /** The offset in `source` where the error was detected. **/
  public var offset(default, null): Int;

  /** The actual source input which caused the error. **/
  public var source(default, null): String;

  /** Creates a new LCOV exception. **/
  public function new(message: String = '', source: String = '', offset: Int = 0) {
    #if js
    super(message);
    this.name = 'LcovException';
    #elseif php
    super(message);
    #else
    this.message = message;
    #end

    this.offset = offset;
    this.source = source;
  }
}
