extends Control

signal on_dialog_finished

var tween: Tween
@onready var label: Label = $MarginContainer/HBoxContainer/Label
@export var textSlownes: int = 2
@export var filePath: String
var skipped := false
func _ready() -> void:
	for line in get_dialog_txt():
		label.text = line
		if skipped:
			continue
		await talk()
	self.hide()
func talk() -> void:
	showText()
	reproduce_sound()
	await tween.finished
	await get_tree().create_timer(1).timeout

func reproduce_sound():
	for n in label.text:
		$Peep.play()
		await $Peep.finished
		if not tween.is_running():
			break

func showText():
	self.show()
	label.visible_ratio = 0
	var text := label.text
	var textDuration = (text.length() / textSlownes) if text.length() < 10 else 2 
	tween = get_tree().create_tween()
	tween.tween_property(label, 'visible_ratio', 1, textDuration)
	
func get_dialog_txt():
	var file = FileAccess.open(filePath, FileAccess.READ)
	return file.get_as_text().split('\n')

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("skip_dialog"):
		skipped = true
