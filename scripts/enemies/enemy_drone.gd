extends CharacterBody2D

@export var move_speed: float = 120.0
@export var max_health: float = 20.0
@export var contact_damage: float = 10.0
@export var xp_reward: int = 1

var current_health: float
var player: Node2D

func _ready() -> void:
	current_health = max_health
	player = get_tree().get_first_node_in_group("player")

func _physics_process(_delta: float) -> void:
	if player == null:
		return

	var direction := (player.global_position - global_position).normalized()
	velocity = direction * move_speed
	move_and_slide()

func take_damage(amount: float) -> void:
	current_health -= amount

	if current_health <= 0.0:
		die()

func die() -> void:
	queue_free()
