package php;

/** Objects implementing `JsonSerializable` can customize their JSON representation when encoded with `json_encode()`. **/
@:native('JsonSerializable')
extern interface JsonSerializable {

  /**
    Serializes the object to a value that can be serialized natively by `json_encode()`.
    @return Data which can be serialized by `json_encode()`, which is a value of any type other than a resource.
  **/
	function jsonSerialize(): Dynamic;
}
