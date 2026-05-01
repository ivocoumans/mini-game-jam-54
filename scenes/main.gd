extends Node2D

@onready var shrine: Area2D = $Objects/Shrine


func _ready() -> void:
	shrine.shrine_activated.connect(_on_shrine_activated)
	var trees = $Trees.get_children()
	for tree in trees:
		tree.planted.connect(_on_tree_planted)
		tree.harvested.connect(_on_tree_harvested)
	$NPCs/Capitalist.bananas_sold.connect(_on_bananas_sold)
	$NPCs/Farmer.saplings_purchased.connect(_on_saplings_purchased)
	$UI.update()
	_refresh_world()


func _on_shrine_activated() -> void:
	_toggle_timeline()


func _toggle_timeline() -> void:
	GameState.is_future = !GameState.is_future
	_refresh_world()
	$UI.update()


func _refresh_world() -> void:
	$Objects/Barn.visible = GameState.is_future
	$NPCs/Farmer.visible = GameState.is_future
	$Objects/Stall.visible = !GameState.is_future
	$NPCs/Capitalist.set_active(!GameState.is_future)
	
	var trees = $Trees.get_children()
	for tree in trees:
		tree.toggle_state()


func _on_tree_planted() -> void:
	$UI.update()


func _on_tree_harvested() -> void:
	$UI.update()


func _on_bananas_sold() -> void:
	$UI.update()


func _on_saplings_purchased() -> void:
	$UI.update()


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()
