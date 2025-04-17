class_name SaveData extends Resource

@export var scores = []

const PATH_TO_FILE: String = "user://scores.tres"

func save() -> void:
	ResourceSaver.save(self, PATH_TO_FILE)

static func loadOrCreate() -> SaveData:
	var result: SaveData
	if FileAccess.file_exists(PATH_TO_FILE):
		result = load(PATH_TO_FILE) as SaveData
	else:
		result = SaveData.new()
	return result
