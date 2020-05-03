import {strict as assert} from 'assert';
import {BranchData} from '../../lib/js/lcov.mjs';

/** Tests the features of the `BranchData` class. */
describe('BranchData', () => {
  describe('.fromJson()', () => {
    it('should return an instance with default values for an empty map', () => {
      const data = BranchData.fromJson({});
      assert.equal(data.blockNumber, 0);
      assert.equal(data.branchNumber, 0);
      assert.equal(data.lineNumber, 0);
      assert.equal(data.taken, 0);
    });

    it('should return an initialized instance for a non-empty map', () => {
      const data = BranchData.fromJson({
        blockNumber: 3,
        branchNumber: 2,
        lineNumber: 127,
        taken: 1
      });

      assert.equal(data.blockNumber, 3);
      assert.equal(data.branchNumber, 2);
      assert.equal(data.lineNumber, 127);
      assert.equal(data.taken, 1);
    });
  });

  describe('.toJSON()', () => {
    it('should return a map with default values for a newly created instance', () => {
      const map = new BranchData(0, 0, 0).toJSON();
      assert.equal(Object.keys(map).length, 4);
      assert.equal(map.blockNumber, 0);
      assert.equal(map.branchNumber, 0);
      assert.equal(map.lineNumber, 0);
      assert.equal(map.taken, 0);
    });

    it('should return a non-empty map for an initialized instance', () => {
      const map = new BranchData(127, 3, 2, 1).toJSON();
      assert.equal(Object.keys(map).length, 4);
      assert.equal(map.blockNumber, 3);
      assert.equal(map.branchNumber, 2);
      assert.equal(map.lineNumber, 127);
      assert.equal(map.taken, 1);
    });
  });

  describe('.toString()', () => {
    it('should return a format like "BRDA:<lineNumber>,<blockNumber>,<branchNumber>,<taken>"', () => {
      assert.equal(String(new BranchData(0, 0, 0)), 'BRDA:0,0,0,-');
      assert.equal(String(new BranchData(127, 3, 2, 1)), 'BRDA:127,3,2,1');
    });
  });
});
