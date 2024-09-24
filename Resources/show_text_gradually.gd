extends Label

signal on_dialog_finished

var tween: Tween
@onready var tutorialNode = $"../../.."
@export var textSpeed: int = 1
var filePath = "res://Assets/Text Dialogs/tutorial_dialog.txt"
func _ready() -> void:
	for line in get_dialog_txt():
		text = line
		await talk()

func talk() -> void:
	showText()
	reproduce_sound()
	await tween.finished
	await get_tree().create_timer(1).timeout
	tutorialNode.hide()

func reproduce_sound():
	for n in text:
		$Peep.play()
		await $Peep.finished
		if not tween.is_running():
			break

func showText():
	tutorialNode.show()
	visible_ratio = 0
	tween = get_tree().create_tween()
	tween.tween_property(self, 'visible_ratio', 1, text.length() / textSpeed)
	
func get_dialog_txt():
	var file = FileAccess.open(filePath, FileAccess.READ)
	return file.get_as_text().split('\n')
