extends Control

var perclick = 1
var score = 0

# Referencje do węzłów
onready var score_label = $ScoreLabel
onready var button = $Button
onready var button_2 = $Button2
onready var button_3 = $Button3

func _ready():
	button.connect("pressed", self, "_on_Button_pressed")
	button_2.connect("pressed", self, "_on_Button2_pressed")
	button_3.connect("pressed", self, "_on_Button3_pressed")
	_load_game()  # Załaduj zapisane dane przy starcie gry

func _on_Button_pressed():
	score += perclick
	score_label.text = "" + str(score)
	_save_game()  # Zapisz dane po każdym kliknięciu

func _on_Button2_pressed():
	if score >= 10:
		perclick += 1
		score -= 10
		score_label.text = "" + str(score)  # Aktualizuj etykietę
		_save_game()  # Zapisz dane po ulepszeniu
	else:
		print("You are nooby")

func _save_game():
	var save_data = {
		"score": score,
		"perclick": perclick
	}
	var save_file = File.new()
	if save_file.open("user://save_game.json", File.WRITE) == OK:
		save_file.store_string(to_json(save_data))
		save_file.close()

func _load_game():
	var save_file = File.new()
	if save_file.file_exists("user://save_game.json"):
		if save_file.open("user://save_game.json", File.READ) == OK:
			var save_data = parse_json(save_file.get_as_text())
			if typeof(save_data) == TYPE_DICTIONARY:
				score = save_data.get("score", 0)
				perclick = save_data.get("perclick", 1)
				score_label.text = "" + str(score)
			save_file.close()



func _on_Button3_pressed():
	if score >= 20:
		perclick += 3
		score -= 20
		score_label.text = "" + str(score)  # Aktualizuj etykietę
		_save_game()  # Zapisz dane po ulepszeniu
	else:
		print("You are nooby")
