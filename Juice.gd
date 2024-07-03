extends StaticBody3D
class_name Juice

# Called when the node enters the scene tree for the first time.
func _ready():
	%Attackable.attacked.connect(_handle_attack)

func _handle_attack():
	print(name + ": Oh no, I've been drank!")
