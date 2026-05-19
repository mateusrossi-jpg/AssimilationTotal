extends Area2D

@export var speed: float = 720.0
@export var damage: float = 10.0
@export var max_distance: float = 1200.0
@export var lifetime: float = 3.0

var direction: Vector2 = Vector2.RIGHT
var start_position: Vector2

func _ready() -> void:
	start_position = global_position
	body_entered.connect(_on_body_entered)

func _physics_process(delta: float) -> void:
	global_position += direction * speed * delta

	if global_position.distance_to(start_position) >= max_distance:
		queue_free()

func _process(delta: float) -> void:
	lifetime -= delta

	if lifetime <= 0.0:
		queue_free()

func _on_body_entered(body: Node) -> void:
	if body.has_method("take_damage"):
		body.take_damage(damage)
		queue_free()
