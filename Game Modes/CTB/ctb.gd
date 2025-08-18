extends Node


var Bag_Path : Node 

@export var Game_Time : Timer
@export var started : bool = false

@export var Score_Goal : int = 10
@export var Winner : Node

@export var Red_Team : Node
@export var Green_Team : Node
@export var Blue_Team : Node
@export var Yellow_Team : Node

@export var Red_Score : int
@export var Green_Score : int
@export var Blue_Score : int
@export var Yellow_Score : int

var RandomNumber = RandomNumberGenerator.new()


var Team_List : Array

enum weapons_enums {WEAPON1, WEAPON2, WEAPON3, WEAPON4, WEAPON5, WEAPON6, WEAPON7, WEAPON8, WEAPON9}
var weapons_list : Array

func _populate_weapons(message) -> void:
	for weapon in message:
		weapons_list.append(weapon)
	pass

"""
Color_Team : Node Base.gd
	-> Team Color Bag : Node3D Bag Base.gd
	-> Players : Node
		-> Player Stats
		-> More Player Stats
	-> Spawns : Node
		-> Spawner1 : Node3D Spawner.gd
		-> Spawner2 : Node3D Spawner.gd
		-> Spawner3 : Node3D Spawner.gd
"""

func _end_match(Winner) -> void:
	if Winner != null:
		print(Winner.Team_Name + " Wins!")
	else:
		print("No one wins!")
	
func _ready() -> void:
	Team_List = [Red_Team, Green_Team, Blue_Team, Yellow_Team]
	print("Get Ready")
	Game_Time.start(5)

func _process(delta: float) -> void:
	pass

func _on_red_team_update_score() -> void:
	Red_Score = Red_Team.Team_Score
	print("Red: ", Red_Score)
	if Red_Score == Score_Goal:
		Winner = Red_Team
		_end_match(Winner)

func _on_green_team_update_score() -> void:
	Green_Score = Green_Team.Team_Score
	print("Green: ", Green_Score)
	if Green_Score == Score_Goal:
		Winner = Green_Team
		_end_match(Winner)

func _on_blue_team_update_score() -> void:
	Blue_Score = Blue_Team.Team_Score
	print("Blue: ", Blue_Score)
	if Blue_Score == Score_Goal:
		Winner = Blue_Team
		_end_match(Winner)

func _on_yellow_team_update_score() -> void:
	Yellow_Score = Yellow_Team.Team_Score
	print("Yellow: ", Yellow_Score)
	if Yellow_Score == Score_Goal:
		Winner = Yellow_Team
		_end_match(Winner)

func _on_timer_timeout() -> void:
	if not started:
		print("Go!")
		Game_Time.start(60)
		started = true
		return
		
	var Current_Score : int = 0
	var temp : int = 0
	for Team in Team_List:
		Current_Score = Team.Team_Score
		if temp < Current_Score:
			Winner = Team
	_end_match(Winner)
