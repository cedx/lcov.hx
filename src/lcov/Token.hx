package lcov;

/** Provides the list of tokens supported by the parser. **/
enum abstract Token(String) {

  /** The coverage data of a branch. **/
  var branchesFound = 'BRF';

  /** The number of branches found. **/
  var branchesHit = 'BRH';

  /** The number of branches hit. **/
  var branchData = 'BRDA';

  /** The end of a section. **/
  var endOfRecord = 'end_of_record';

  /** The coverage data of a function. **/
  var functionData = 'FNDA';

  /** A function name. **/
  var functionName = 'FN';

  /** The number of functions found. **/
  var functionsFound = 'FNF';

  /** The number of functions hit. **/
  var functionsHit = 'FNH';

  /** The coverage data of a line. **/
  var lineData = 'DA';

  /** The number of lines found. **/
  var linesFound = 'LF';

  /** The number of lines hit. **/
  var linesHit = 'LH';

  /** The path to a source file. **/
  var sourceFile = 'SF';

  /** A test name. **/
  var testName = 'TN';
}
