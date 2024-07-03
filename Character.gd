extends CharacterBody3D
class_name Character

const MOVE_SPEED = 3
const ROT_SPEED = 0.5

@export var is_player : bool = false
@export var camera : Camera3D
	
func _ready():
	%Attackable.attacked.connect(_handle_attack)
	
func _process(delta):
	if not is_player:
		return

	camera.make_current()
	velocity = Vector3.ZERO
	
	if Input.is_key_pressed(KEY_W):
		velocity += transform.basis.z * MOVE_SPEED
	elif Input.is_key_pressed(KEY_S):
		velocity -= transform.basis.z * MOVE_SPEED
	
	if Input.is_key_pressed(KEY_D):
		global_rotate(transform.basis.y, -ROT_SPEED * PI * delta)
	elif Input.is_key_pressed(KEY_A):
		global_rotate(transform.basis.y, ROT_SPEED * PI * delta)
	
	move_and_slide()

func _handle_attack():
	print(name + ": Ouch! I've been attacked! Mercy!")


func _on_hurt_box_area_3d_body_entered(body):
	var attackable : Attackable = body.get_node_or_null("%Attackable")
	
	if attackable == null:
		return
	
	attackable.attack()
