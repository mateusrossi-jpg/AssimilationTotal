extends Node2D

@export var projectile_scene: PackedScene
@export var fire_rate: float = 0.22
@export var damage: float = 10.0
@export var detection_radius: float = 700.0

var fire_timer: float = 0.0

func _physics_process(delta: float) -> void:
	fire_timer -= delta

	if fire_timer > 0.0:
		return

	var target := get_nearest_enemy()

	if target == null:
		return

	shoot(target)
	fire_timer = fire_rate

func get_nearest_enemy() -> Node2D:
	var enemies := get_tree().get_nodes_in_group("enemies")
	var nearest_enemy: Node2D = null
	var nearest_distance := detection_radius

	for enemy in enemies:
		if not enemy is Node2D:
			continue

		var distance := global_position.distance_to(enemy.global_position)

		if distance < nearest_distance:
			nearest_distance = distance
			nearest_enemy = enemy

	return nearest_enemy

func shoot(target: Node2D) -> void:
	if projectile_scene == null:
		return

	var projectile = projectile_scene.instantiate()
	get_tree().current_scene.add_child(projectile)

	projectile.global_position = global_position
	projectile.direction = (target.global_position - global_position).normalized()
	projectile.damage = damage
