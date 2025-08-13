extends Node

var Bag_Path : Node 

@export var Score_Goal : int = 10
@export var Winner : String = ""

@export var Red_Team : Node
@export var Green_Team : Node
@export var Blue_Team : Node
@export var Yellow_Team : Node

@export var Red_Score : int
@export var Green_Score : int
@export var Blue_Score : int
@export var Yellow_Score : int

"""
Color_Team : Node Base.gd
	-> Team Color Bag : Node3D Bagjective.gd
	-> Players : Node
		-> Player Stats
		-> More Player Stats
	-> Spawns : Node
		-> Spawner1 : Node3D Spawner.gd
		-> Spawner2 : Node3D Spawner.gd
		-> Spawner3 : Node3D Spawner.gd
"""
#func _winner(winner) -> void:
#	open end card
#	pass in winner
#	pass in game state info

func _end_match() -> void:
	pass
	
func _ready() -> void:
	pass

func _process(delta: float) -> void:
	Red_Score = Red_Team.Team_Score
	Green_Score = Green_Team.Team_Score
	Blue_Score = Blue_Team.Team_Score
	Yellow_Score = Yellow_Team.Team_Score
	
	
	if Red_Score == Score_Goal:
		Winner = "Red Team"
		print(Winner, " Wins")
	if Green_Score == Score_Goal:
		Winner = "Green Team"
		print("Green Wins")
	if Blue_Score == Score_Goal:
		Winner = "Blue Team"
		print("Blue Wins")
	if Yellow_Score == Score_Goal:
		Winner = "Yellow Team"
		print("Yellow Wins")
		
	#if winner:
	#	_winner(Winner)
