extends Node

@export var Team_Name : String = ""
@export var Team_Score : int = 0
@export var Bag_Present : bool = true
@export var Team_Color : Color

@export var Spawners : Array

var Team_List : Array 
var DeathPool : Array

signal Update_Score

func _update_Score() -> void:
	Team_Score += 1
	print("Team_Score: ", Team_Score)
	emit_signal("Update_Score")

"""
var Players : array/list
Kills : int = all player kills combined
Score : int = all team score combined
"""

func _new_color(new_hue) -> void:
	Team_Color = new_hue

func _ready() -> void:
	Team_Name = self.name
	for Spawner in $"Spawns/".get_children():
		Spawners.append(Spawner)
		
func _enter_limbo(Player):
	
	pass
