extends CharacterBody3D

#speed related variables
const SPEED = 5.0
const JUMP_VELOCITY = 4.5
const SENSETIVITY = 0.001
#var sprint_speed = SPEED + SPEED * 0.5

# head bob variables
const BOB_FREQ = 2.2
const BOB_AMP = 0.2
var t_bob = 0.0

# camera variables
@onready var head = $body/head_pivot
@onready var camera = $body/head_pivot/Camera3D


func _ready():
	#sets mouse to be captured
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)



func _unhandled_input(event) :
	
	if event is InputEventMouseMotion: #checks for mouse motioin event

		
		head.rotate_y( -event.relative.x * SENSETIVITY) #rotate cam around x axis
		camera.rotate_x( -event.relative.y * SENSETIVITY) #rotate cam around y axis
		camera.rotation.x = clamp(camera.rotation.x , deg_to_rad(-40), deg_to_rad(80)) #clamps the up and down rotation


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("strafe_left", "strafe_right", "forward", "backward")
	var direction = (head.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = 0.0
		velocity.z = 0.0
	
	# head bob 
	t_bob += delta * velocity.length() * float(is_on_floor()) 
	camera.transform.origin = _headbob(t_bob)
	
	move_and_slide()


func _headbob(time) -> Vector3:
	var pos = Vector3.ZERO
	pos.y = sin(time * BOB_FREQ) * BOB_AMP  # adds up and down head bob
	#pos.x = cos(time * BOB_FREQ / 2) * BOB_AMP  #adds side to side head bob
	return pos
	
