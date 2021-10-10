import haxe.Exception;
import tink.unit.AssertionBuffer;

/** Provides helper methods for handling assertions. **/
abstract class AssertionTools {

	/** Expects the specified function to throw an exception. **/
	public static function throws(asserts: AssertionBuffer, func: () -> Void, ?exceptionClass: Class<Exception>)
		try { func(); asserts.fail("Exception not thrown."); }
		catch (e) asserts.assert(Std.isOfType(e, exceptionClass != null ? exceptionClass : Exception));
}
