extends CanvasLayer


@onready var money = $HBoxContainer/StatsContainer/MoneyContainer/MoneyValue
@onready var tree = $HBoxContainer/StatsContainer/TreeContainer/TreeValue
@onready var banana = $HBoxContainer/StatsContainer/BananaContainer/BananaValue
@onready var year = $HBoxContainer/InfoContainer/YearContainer/YearValue


func update() -> void:
	money.text = str(GameState.money)
	tree.text = str(GameState.saplings)
	banana.text = str(GameState.bananas)
	if GameState.is_future:
		year.text = str(2162)
		$ColorRect.color = Color(0.4, 0.2, 0.6, 0.2)
	else:
		year.text = str(2144)
		$ColorRect.color = Color(0, 0, 0, 0)
