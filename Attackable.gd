@tool
extends Node
class_name Attackable

signal attacked()

static func find(node : Node) -> Attackable:
	return node.get_node_or_null("%Attackable") as Attackable
	
static func register(node : Node, handler : Callable):
	node.get_node("%Attackable").attacked.connect(handler)

func _process(delta):
	if Engine.is_editor_hint():
		update_configuration_warnings()

func attack():
	attacked.emit()

func _get_configuration_warnings():
	return [] if unique_name_in_owner and name == "Attackable" else ["Must have the unique name \"Attackable\""]
