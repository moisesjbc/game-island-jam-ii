extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed: int = 1500
var target_position = Vector2.ZERO
var velocity: Vector2 = Vector2.ZERO
var damage: int = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	velocity = (target_position - global_position).normalized()
	look_at(target_position)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var collision = move_and_collide(speed * velocity * delta)
	if is_instance_valid(collision):
		collision.collider.apply_damage(damage)
		queue_free()


func _on_visibility_notifier_viewport_exited(viewport):
	queue_free()
