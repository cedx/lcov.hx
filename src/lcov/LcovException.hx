package lcov;

/** An exception caused by a parsing error. **/
@:expose class LcovException {

  /** A message describing the error. **/
  public var message(default, null): String;

  /** The offset in `source` where the error was detected. **/
  public var offset(default, null): Int;

  /** The actual source input which caused the error. **/
  public var source(default, null): String;

  /**
    Creates a new LCOV error.
    @param message A message describing the error.
    @param source The actual source input which caused the error.
    @param offset The offset in `source` where the error was detected.
  **/
  public function new(message: String, source: String = '', offset: Int = 0) {
    this.message = message;
    this.offset = offset;
    this.source = source;
  }
}
