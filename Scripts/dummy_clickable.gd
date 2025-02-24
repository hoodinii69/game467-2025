extends CharacterBody2D
class_name Interactable
@export var inspectable_text = Inspectable
@export var takeable_text = Takeable
@export var talkable_text = Talkable
#A bool to determine whether the mouse is highlighting the object
#Maybe add an outline when this is true?
#Either way will run code when clicked to show an
#inspector window
func _on_mouse_entered():
	$Sprite2D.modulate = Color(1,1,1)
	GlobalVars.Selected_Object = self

func _on_mouse_exited():
	$Sprite2D.modulate = Color(0,0,0)
	GlobalVars.Selected_Object = null

