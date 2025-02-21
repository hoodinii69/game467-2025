extends Node2D

var is_options_showing

# Called when the node enters the scene tree for the first time.

#For now, this is here in ready().
#This checks (at some point) all of the child nodes
#And connects to any objects clicked signal
#So that we can do some code when they are clicked
func _ready():
	print(self.get_children())
	for node in self.get_children():
		if node.is_in_group("Item"):
			node.get_node("Clickable").is_clicked.connect(_is_clicked)
			node.get_node("Clickable").isnt_clicked.connect(_isnt_clicked)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	
#Code that runs when the mouse clicks on a clickable object
func _is_clicked():
	$ClickableOptions.show()
	$ClickableOptions.position = get_global_mouse_position()
func _isnt_clicked():
	$ClickableOptions.hide()
