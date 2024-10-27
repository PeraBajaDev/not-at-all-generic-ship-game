extends Node

@export var winScene: PackedScene
func _ready() -> void:
	GameState.boss_defeated.connect(change_to_win_scene)

func change_to_win_scene() -> void:
	print('jefe eliminado')
	await get_tree().create_timer(3).timeout
	get_tree().change_scene_to_packed(winScene)
