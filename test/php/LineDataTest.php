<?php declare(strict_types=1);
namespace cedx\lcov;

use PHPUnit\Framework\{TestCase};
use function PHPUnit\Framework\{assertThat, countOf, equalTo, isEmpty};

/** @testdox Lcov\LineData */
class LineDataTest extends TestCase {

  /** @testdox ::fromJson() */
  function testFromJson(): void {
    // It should return an instance with default values for an empty map.
    $data = LineData::fromJson(new \stdClass);
    assertThat($data->getChecksum(), isEmpty());
    assertThat($data->getExecutionCount(), equalTo(0));
    assertThat($data->getLineNumber(), equalTo(0));

    // It should return an initialized instance for a non-empty map.
    $data = LineData::fromJson((object) ['checksum' => 'ed076287532e86365e841e92bfc50d8c', 'executionCount' => 3, 'lineNumber' => 127]);
    assertThat($data->getChecksum(), equalTo('ed076287532e86365e841e92bfc50d8c'));
    assertThat($data->getExecutionCount(), equalTo(3));
    assertThat($data->getLineNumber(), equalTo(127));
  }

  /** @testdox ->jsonSerialize() */
  function testJsonSerialize(): void {
    // It should return a map with default values for a newly created instance.
    $data = (new LineData(0))->jsonSerialize();
    assertThat(get_object_vars($data), countOf(3));
    assertThat($data->checksum, isEmpty());
    assertThat($data->executionCount, equalTo(0));
    assertThat($data->lineNumber, equalTo(0));

    // It should return a non-empty map for an initialized instance.
    $data = (new LineData(127, 3, 'ed076287532e86365e841e92bfc50d8c'))->jsonSerialize();
    assertThat(get_object_vars($data), countOf(3));
    assertThat($data->checksum, equalTo('ed076287532e86365e841e92bfc50d8c'));
    assertThat($data->executionCount, equalTo(3));
    assertThat($data->lineNumber, equalTo(127));
  }

  /** @testdox ->__toString() */
  function testToString(): void {
    // It should return a format like "DA:<lineNumber>,<executionCount>[,<checksum>]".
    assertThat((string) new LineData(0), equalTo('DA:0,0'));
    assertThat((string) new LineData(127, 3, 'ed076287532e86365e841e92bfc50d8c'), equalTo('DA:127,3,ed076287532e86365e841e92bfc50d8c'));
  }
}
