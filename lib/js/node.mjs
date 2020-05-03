import module from './browser.cjs';

export const {
	BranchCoverage,
	BranchData,
	FunctionCoverage,
	FunctionData,
	LineCoverage,
	LineData,
	Record,
	Report,
	Token
} = module.lcov;
