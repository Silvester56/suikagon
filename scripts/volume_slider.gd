extends Control

@export var busName: String

var busIndex: int

func _ready() -> void:
	busIndex = AudioServer.get_bus_index(busName)
	$HSlider.value = db_to_linear(AudioServer.get_bus_volume_db(busIndex))

func _on_h_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(busIndex, linear_to_db(value))
