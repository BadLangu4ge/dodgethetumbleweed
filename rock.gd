extends Area2D

# How fast the rock falls
@export var speed: float = 250.0

func _process(delta: float) -> void:
	# Move the rock downward each frame
	position.y += speed * delta
	
	# Delete the rock once it falls off the bottom of the screen
	if position.y > 720:
		queue_free()


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		print("Player was hit!")
		
		# Find the main scene and call reset_score()
		var main_node = get_tree().current_scene
		if main_node.has_method("reset_score"):
			main_node.reset_score()
			
		queue_free()
