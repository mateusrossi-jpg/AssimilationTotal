extends CharacterBody2D

signal died
signal xp_changed(current_xp: int, xp_to_next_level: int)
signal leveled_up(new_level: int)
signal health_changed(current_health: float, max_health: float)
signal sync_changed(current_sync: float, max_sync: float)

@export var move_speed: float = 260.0
@export var max_health: float = 100.0
@export var max_sync: float = 100.0
@export var contact_damage_cooldown: float = 0.45

var current_health: float
var current_sync: float = 0.0
var level: int = 1
var current_xp: int = 0
var xp_to_next_level: int = 10
var is_dead: bool = false
var _damage_cooldown_timer: float = 0.0

func _ready() -> void:
	add_to_group("player")
	current_health = max_health
	health_changed.emit(current_health, max_health)
	xp_changed.emit(current_xp, xp_to_next_level)
	sync_changed.emit(current_sync, max_sync)

func _physics_process(delta: float) -> void:
	if _damage_cooldown_timer > 0.0:
		_damage_cooldown_timer -= delta

	if is_dead:
		velocity = Vector2.ZERO
		return

	var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * move_speed
	move_and_slide()

func take_damage(amount: float) -> void:
	if is_dead or _damage_cooldown_timer > 0.0:
		return

	_damage_cooldown_timer = contact_damage_cooldown
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

func add_sync(amount: float) -> void:
	current_sync = clamp(current_sync + amount, 0.0, max_sync)
	sync_changed.emit(current_sync, max_sync)

func level_up() -> void:
	level += 1
	xp_to_next_level = int(round(float(xp_to_next_level) * 1.25))
	add_sync(4.0)
	leveled_up.emit(level)

func die() -> void:
	if is_dead:
		return

	is_dead = true
	died.emit()
