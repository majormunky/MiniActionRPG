extends Node2D

enum {
	PLAYER,
	ENEMY,
}

var turn = PLAYER
var player_max_hp = 100
var player_hp = 100

var enemy_max_hp = 80
var enemy_hp = 80

var enemy_name = "Bird"
var player_name = "Torin"

onready var player_list = $MarginContainer/Panel/VBoxContainer/InfoArea/FightInfo/HBoxContainer/PlayersList
onready var enemy_list = $MarginContainer/Panel/VBoxContainer/InfoArea/FightInfo/HBoxContainer/EnemiesList

func _ready():
	player_list.add_item(player_name)
	enemy_list.add_item(enemy_name)
