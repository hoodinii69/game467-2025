extends VBoxContainer

@export var Main : Node

# Called when the node enters the scene tree for the first time.
#For now, this is here in ready().
#This checks (at some point) all of the child nodes
#And connects to any objects clicked signal
#So that we can do some code when they are clicked
func _ready():
	print(Main.get_children())
	for node in Main.get_children():
		if node.is_in_group("Item"):
			node.get_node("Clickable").is_clicked.connect(_is_clicked)
			node.get_node("Clickable").isnt_clicked.connect(_isnt_clicked)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _is_clicked():
	self.show()
	self.position = get_global_mouse_position()
func _isnt_clicked():
	self.hide()
#Some code that when the object is selected it gets fed
#the info from the object (inspect text, can it be taken- dialogue?)
