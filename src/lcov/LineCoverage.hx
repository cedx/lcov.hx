package lcov;

/** Provides the coverage data of lines. **/
@:expose
class LineCoverage #if php implements JsonSerializable #end {

	/** The coverage data. **/
	public final data: Array<LineData>;

	/** The number of lines found. **/
	public var found: Int;

	/** The number of lines hit. **/
	public var hit: Int;

	/** Creates a new line coverage. **/
	public function new(found: Int = 0, hit: Int = 0, ?data: #if php NativeIndexedArray<LineData> #else Array<LineData> #end) {
		this.data = data != null ? #if php cast toHaxeArray(data) #else data #end : [];
		this.found = found;
		this.hit = hit;
	}

	/** Converts this object to a map in JSON format. **/
	public function toJson() return {
		data: #if php toPhpArray(data.map(item -> item.toJson())) #else data.map(item -> item.toJson()) #end,
		found: found,
		hit: hit
	};

	/** Returns a string representation of this object. **/
	public function toString(): String {
		final lines = data.map(item -> item.toString());
		lines.push('${Token.linesFound}:$found');
		lines.push('${Token.linesHit}:$hit');
		return lines.join("\n");
	}

	#if js
	/** An alias for the `toJson()` method. **/
	public function toJSON() return toJson();
	#elseif php
	/** An alias for the `toJson()` method. **/
	public function jsonSerialize() return toJson();
	#end
}
