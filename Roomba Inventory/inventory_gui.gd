extends Control

signal opened
signal closed
#we will use these signals to pause the game while the inventory is open

var isOpen: bool = false

#for when we have a player
#@onready var inventory: Inventory = preload("res://inventory/playerInventory.tres")
@onready var slots: Array = $NinePatchRect/GridContainer.get_children()

#func _ready():
#	update()


#for when we have a player
#func update():
#	for i in range(min(inventory.items.size(), slots.size())):
#		slots[i].update(inventory.items[i])
	

func open():
	visible = true
	isOpen = true
	opened.emit()

func close():
	visible = false
	isOpen = false
	closed.emit()

#Remember to set the CanvasLayer's Process Mode to Always, or the Gui Layer would also be paused and we wouldn't be able to close inventory

func _on_inventory_gui_closed():
	get_tree().paused = false

func _on_inventory_gui_opened():
	get_tree().paused = true
