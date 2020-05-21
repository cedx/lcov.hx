export declare class BranchCoverage {
	readonly data: BranchData[];
	found: number;
	hit: number;
	constructor(found?: number, hit?: number, data?: BranchData[]);
	toString(): string;
}

export declare class BranchData {
	blockNumber: number;
	branchNumber: number;
	lineNumber: number;
	taken: number;
	constructor(lineNumber: number, blockNumber: number, branchNumber: number, taken?: number);
	toString(): string;
}

export declare class FunctionCoverage {
	readonly data: FunctionData[];
	found: number;
	hit: number;
	constructor(found?: number, hit?: number, data?: FunctionData[]);
	toString(): string;
}

export declare class FunctionData {
	executionCount: number;
	functionName: string;
	lineNumber: number;
	constructor(functionName: string, lineNumber: number, executionCount?: number);
	toString(asDefinition?: boolean): string;
}

export declare class LcovError extends Error {
	readonly offset: number;
	readonly previous?: Error;
	readonly source: string;
	constructor(message?: string, source?: string, offset?: number, previous?: Error);
	details(): string;
}

export declare class LineCoverage {
	data: LineData[];
	found: number;
	hit: number;
	constructor(found?: number, hit?: number, data?: LineData[]);
	toString(): string;
}

export declare class LineData {
	checksum: string;
	executionCount: number;
	lineNumber: number;
	constructor(lineNumber: number, executionCount?: number, checksum?: string);
	toString(): string;
}

export declare class Record {
	branches?: BranchCoverage;
	functions?: FunctionCoverage;
	lines?: LineCoverage;
	sourceFile: string;
	constructor(sourceFile: string, options?: Partial<RecordOptions>);
	toString(): string;
}

export interface RecordOptions {
	branches: BranchCoverage;
	functions: FunctionCoverage;
	lines: LineCoverage;
}

export declare class Report {
	readonly records: Record[];
	testName: string;
	constructor(testName?: string, records?: Record[]);
	static fromCoverage(coverage: string): Report;
	toString(): string;
}
