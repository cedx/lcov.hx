import {strict as assert} from 'assert';
import {LineData} from '../../lib/js/lcov.mjs';

/** Tests the features of the `LineData` class. */
describe('LineData', () => {
  describe('.fromJson()', () => {
    it('should return an instance with default values for an empty map', () => {
      const data = LineData.fromJson({});
      assert.equal(data.checksum.length, 0);
      assert.equal(data.executionCount, 0);
      assert.equal(data.lineNumber, 0);
    });

    it('should return an initialized instance for a non-empty map', () => {
      const data = LineData.fromJson({
        checksum: 'ed076287532e86365e841e92bfc50d8c',
        executionCount: 3,
        lineNumber: 127
      });

      assert.equal(data.checksum, 'ed076287532e86365e841e92bfc50d8c');
      assert.equal(data.executionCount, 3);
      assert.equal(data.lineNumber, 127);
    });
  });

  describe('.toJSON()', () => {
    it('should return a map with default values for a newly created instance', () => {
      const map = new LineData(0).toJSON();
      assert.equal(Object.keys(map).length, 3);
      assert.equal(map.checksum.length, 0);
      assert.equal(map.executionCount, 0);
      assert.equal(map.lineNumber, 0);
    });

    it('should return a non-empty map for an initialized instance', () => {
      const map = new LineData(127, 3, 'ed076287532e86365e841e92bfc50d8c').toJSON();
      assert.equal(Object.keys(map).length, 3);
      assert.equal(map.checksum, 'ed076287532e86365e841e92bfc50d8c');
      assert.equal(map.executionCount, 3);
      assert.equal(map.lineNumber, 127);
    });
  });

  describe('.toString()', () => {
    it('should return a format like "DA:<lineNumber>,<executionCount>[,<checksum>]"', () => {
      assert.equal(String(new LineData(0)), 'DA:0,0');
      assert.equal(String(new LineData(127, 3, 'ed076287532e86365e841e92bfc50d8c')), 'DA:127,3,ed076287532e86365e841e92bfc50d8c');
    });
  });
});
