extends CharacterBody2D

signal died
signal xp_changed(current_xp: int, xp_to_next_level: int)
signal leveled_up(new_level: int)
signal health_changed(current_health: float, max_health: float)

@export var move_speed: float = 260.0
@export var max_health: float = 100.0
@export var pickup_radius: float = 96.0

var current_health: float
var level: int = 1
var current_xp: int = 0
var xp_to_next_level: int = 10
var is_dead: bool = false

func _ready() -> void:
	current_health = max_health
	health_changed.emit(current_health, max_health)
	xp_changed.emit(current_xp, xp_to_next_level)

func _physics_process(_delta: float) -> void:
	if is_dead:
		velocity = Vector2.ZERO
		return

	var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * move_speed
	move_and_slide()

func take_damage(amount: float) -> void:
	if is_dead:
		return

	current_health = max(current_health - amount, 0.0)
	health_changed.emit(current_health, max_health)

	if current_health <= 0.0:
		die()

func heal(amount: float) -> void:
	if is_dead:
		return

	current_health = min(current_health + amount, max_health)
	health_changed.emit(current_health, max_health)

func add_xp(amount: int) -> void:
	if is_dead:
		return

	current_xp += amount

	while current_xp >= xp_to_next_level:
		current_xp -= xp_to_next_level
		level_up()

	xp_changed.emit(current_xp, xp_to_next_level)

func level_up() -> void:
	level += 1
	xp_to_next_level = int(round(float(xp_to_next_level) * 1.25))
	leveled_up.emit(level)

func die() -> void:
	is_dead = true
	died.emit()
