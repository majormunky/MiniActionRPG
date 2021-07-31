extends KinematicBody2D

var velocity = Vector2.ZERO
var speed = 250
var roll_vector = Vector2.ZERO

onready var anim_player = $AnimationPlayer
onready var anim_tree = $AnimationTree
onready var anim_state = anim_tree.get("parameters/playback")
onready var sword_hitbox = $HitboxPivot/SwordHitbox
onready var interact_hitbox = $HitboxPivot/InteractHitbox
onready var interact_hitbox_shape = $HitboxPivot/InteractHitbox/CollisionShape2D

enum {
	MOVE,
	ROLL,
	ATTACK,
}
var state = MOVE

signal player_interacted

func _ready():
	anim_tree.active = true


func _physics_process(delta):
	match state:
		MOVE:
			move_state(delta)
		ATTACK:
			attack_state()
		ROLL:
			pass


func attack_state():
	velocity = Vector2.ZERO
	anim_state.travel("Attack")


func move_state(delta):
	var input = Vector2.ZERO
	input.x = Input.get_action_strength("walk_right") - Input.get_action_strength("walk_left")
	input.y = Input.get_action_strength("walk_down") - Input.get_action_strength("walk_up")
	input = input.normalized()
	if input != Vector2.ZERO:
		velocity = input * speed * delta
		anim_state.travel("Walk")
		anim_tree.set("parameters/Walk/blend_position", input)
		anim_tree.set("parameters/Idle/blend_position", input)
		anim_tree.set("parameters/Attack/blend_position", input)
		sword_hitbox.knockback_vector = input
	else:
		anim_state.travel("Idle")
		velocity = Vector2.ZERO
	
	if Input.is_action_just_pressed("attack"):
		state = ATTACK
	
	if Input.is_action_just_pressed("interact"):
		print("Interact!")
		interact_hitbox_shape.disabled = false
		emit_signal("player_interacted")
		yield(get_tree().create_timer(0.1), "timeout")
		interact_hitbox_shape.disabled = true
	move_and_collide(velocity)


func attack_animation_complete():
	state = MOVE

