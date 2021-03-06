<?php declare(strict_types=1);
use lcov\{FunctionCoverage, LcovException, LineCoverage, LineData, Record, Report};

/** Formats coverage data as LCOV report. */
function formatReport(): void {
	$lineCoverage = new LineCoverage(2, 2, [
		new LineData(6, 2, "PF4Rz2r7RTliO9u6bZ7h6g"),
		new LineData(7, 2, "yGMB6FhEEAd8OyASe3Ni1w")
	]);

	$record = new Record("/home/cedx/lcov.hx/fixture.php", [
		"functions" => new FunctionCoverage(1, 1),
		"lines" => $lineCoverage
	]);

	$report = new Report("Example", [$record]);
	print $report;
}

/** Parses a LCOV report to coverage data. */
function parseReport(): void {
	try {
		$coverage = file_get_contents("/path/to/lcov.info");
		$report = Report::fromCoverage($coverage);

		$count = count($report->records);
		print "The coverage report contains $count records:" . PHP_EOL;
		print json_encode($report, JSON_PRETTY_PRINT);
	}

	catch (LcovException $e) {
		print "An error occurred: '{$e->getMessage()}' at offset {$e->offset}.";
	}
}
