extends Area2D


signal bananas_sold


var player_in_range: bool = false


func set_active(is_active: bool) -> void:
	visible = is_active
	monitoring = is_active


func _ready() -> void:
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)


func _process(_delta: float) -> void:
	if player_in_range and Input.is_action_just_pressed("interact"):
		_sell_all_bananas()


func _sell_all_bananas() -> void:
	if GameState.bananas <= 0:
		return

	var total: int = GameState.bananas * 3
	GameState.money += total
	GameState.bananas = 0
	bananas_sold.emit()


func _on_body_entered(body: Node) -> void:
	if body.is_in_group("player"):
		player_in_range = true


func _on_body_exited(body: Node) -> void:
	if body.is_in_group("player"):
		player_in_range = false
