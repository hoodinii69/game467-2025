extends VBoxContainer

@export var Main : Node
@export var inspectable_script = Inspectable
@export var takeable_script = Takeable
@export var talkable_script = Talkable
var selected = GlobalVars.Selected_Object #shorthand
var selected_takeable
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	selected = GlobalVars.Selected_Object

#Not sure if we want anything cool to happen with
#right and left click but we have the option
#to do so
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed and selected != null:
			_is_clicked()
		#elif selected == null: self.hide()
		
func _is_clicked():
	self.show()
	self.position = get_global_mouse_position() + Vector2(60,0)
	check_ability()
#Some code that when the object is selected it gets fed
#the info from the object (inspect text, can it be taken- dialogue?)

#This function checks what the object is and stores data of it
func check_ability():
	$Inspect.hide()
	$Take.hide()
	$Talk.hide()
	if selected.inspectable_text.show == true:
		$Inspect.show()
		inspectable_script = selected.inspectable_text.text
	if selected.takeable_text.show == true:
		$Take.show()
		takeable_script = selected.takeable_text.text
		selected_takeable = selected
	if selected.talkable_text.show == true:
		$Talk.show()
		talkable_script = selected.talkable_text.text

func _on_inspect_pressed():
	print(inspectable_script)
	self.hide()
func _on_take_pressed():
	print(takeable_script)
	#Code to add the selected item to your inventory
	selected_takeable.queue_free()
	self.hide()
func _on_talk_pressed():
	print(talkable_script)
	self.hide()
func _on_cancel_pressed():
	self.hide()
