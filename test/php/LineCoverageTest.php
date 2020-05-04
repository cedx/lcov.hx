<?php declare(strict_types=1);
namespace cedx\lcov;

use PHPUnit\Framework\{TestCase};
use function PHPUnit\Framework\{assertThat, countOf, equalTo, isEmpty, isInstanceOf};

/** @testdox Lcov\LineCoverage */
class LineCoverageTest extends TestCase {

  /** @testdox ::fromJson() */
  function testFromJson(): void {
    // It should return an instance with default values for an empty map.
    $coverage = LineCoverage::fromJson(new \stdClass);
    assertThat($coverage->getData(), isEmpty());
    assertThat($coverage->getFound(), equalTo(0));
    assertThat($coverage->getHit(), equalTo(0));

    // It should return an initialized instance for a non-empty map.
    $coverage = LineCoverage::fromJson((object) ['data' => [(object) ['lineNumber' => 127]], 'found' => 23, 'hit' => 11]);
    assertThat($coverage->getFound(), equalTo(23));
    assertThat($coverage->getHit(), equalTo(11));

    $entries = $coverage->getData();
    assertThat($entries, countOf(1));

    /** @var LineData $entry */
    [$entry] = $entries;
    assertThat($entry, isInstanceOf(LineData::class));
    assertThat($entry->getLineNumber(), equalTo(127));
  }

  /** @testdox ->jsonSerialize() */
  function testJsonSerialize(): void {
    // It should return a map with default values for a newly created instance.
    $map = (new LineCoverage)->jsonSerialize();
    assertThat(get_object_vars($map), countOf(3));
    assertThat($map->data, isEmpty());
    assertThat($map->found, equalTo(0));
    assertThat($map->hit, equalTo(0));

    // It should return a non-empty map for an initialized instance.
    $map = (new LineCoverage(23, 11, [new LineData(0)]))->jsonSerialize();
    assertThat(get_object_vars($map), countOf(3));
    assertThat($map->data, countOf(1));
    assertThat($map->data[0]->lineNumber, equalTo(0));
    assertThat($map->found, equalTo(23));
    assertThat($map->hit, equalTo(11));
  }

  /** @testdox ->__toString() */
  function testToString(): void {
    // It should return a format like "LF:<found>\\nLH:<hit>".
    assertThat((string) new LineCoverage, equalTo(str_replace('{{eol}}', PHP_EOL, 'LF:0{{eol}}LH:0')));

    $data = new LineData(127, 3);
    $coverage = new LineCoverage(23, 11, [$data]);
    assertThat((string) $coverage, equalTo(str_replace('{{eol}}', PHP_EOL, "$data{{eol}}LF:23{{eol}}LH:11")));
  }
}
