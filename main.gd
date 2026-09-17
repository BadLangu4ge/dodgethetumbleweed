extends Node

# Drag your rock.tscn file into this slot in the Inspector panel
@export var rock_scene: PackedScene 

# Boundaries for where rocks can drop (in pixels across your screen)
var min_x: float = -138.0
var max_x: float = 762.0
var spawn_y: float = -130.0 # Just above the top edge of the screen

var score: int = 0

@onready var score_label: Label =$CanvasLayer2/ScoreLabel

func _on_rock_timer_timeout() -> void:
	if rock_scene:
		# Spawn an instance of the rock
		var rock = rock_scene.instantiate()
		
		# Pick a random X coordinate between min_x and max_x
		var random_x = randf_range(min_x, max_x)
		rock.position = Vector2(random_x, spawn_y)
		
		# Add the rock to the scene
		add_child(rock)


func _on_score_timer_timeout() -> void:
	score += 10
	print("Score: ", score)
	update_score_display() # <-- Add this line here!

# Function to reset the score when hit
func reset_score() -> void:
	score = 0
	print("--- Score Reset to 0! ---")
	update_score_display() # <-- Add this line here too!
	
func update_score_display() -> void:
	if score_label:
		score_label.text = "Score: " + str(score)
