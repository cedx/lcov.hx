package php;

/** Objects implementing `JsonSerializable` can customize their JSON representation when encoded with `json_encode()`. **/
@:native('JsonSerializable')
extern interface JsonSerializable {

  /** Serializes this object to a value that can be serialized natively by `json_encode()`. **/
	function jsonSerialize(): Dynamic;
}
