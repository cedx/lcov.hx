package lcov;

/** Provides the list of tokens supported by the parser. **/
enum abstract Token(String) from String to String {

	/** The coverage data of a branch. **/
	var BranchData = "BRDA";

	/** The number of branches found. **/
	var BranchesFound = "BRF";

	/** The number of branches hit. **/
	var BranchesHit = "BRH";

	/** The end of a section. **/
	var EndOfRecord = "end_of_record";

	/** The coverage data of a function. **/
	var FunctionData = "FNDA";

	/** A function name. **/
	var FunctionName = "FN";

	/** The number of functions found. **/
	var FunctionsFound = "FNF";

	/** The number of functions hit. **/
	var FunctionsHit = "FNH";

	/** The coverage data of a line. **/
	var LineData = "DA";

	/** The number of lines found. **/
	var LinesFound = "LF";

	/** The number of lines hit. **/
	var LinesHit = "LH";

	/** The path to a source file. **/
	var SourceFile = "SF";

	/** A test name. **/
	var TestName = "TN";
}
