extends Node

var savedScores: SaveData

func _ready() -> void:
	savedScores = SaveData.loadOrCreate()
