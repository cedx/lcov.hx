import mod from './lcov.cjs';

export const {
	BranchCoverage,
	BranchData,
	FunctionCoverage,
	FunctionData,
  LcovException,
	LineCoverage,
	LineData,
	Record,
	Report,
	Token // TODO: remove it ? Not in the final JS output!
} = mod.lcov;
