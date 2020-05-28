import haxe.Exception;
import tink.unit.AssertionBuffer;

/** Provides helper methods for assertions. **/
class AssertionTools {

	/** Expects the function `func` to throw an error. **/
	public static function throws(asserts: AssertionBuffer, func: () -> Void, exceptionClass: Class<Exception>): Void {
		try {
			func();
			asserts.fail("Exception not thrown");
		}

		catch (e) {
			asserts.assert(Std.isOfType(e, exceptionClass));
		}
	}
}
