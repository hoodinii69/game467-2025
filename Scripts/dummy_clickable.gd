extends CharacterBody2D

var selected : bool

#A bool to determine whether the mouse is highlighting the object
#Maybe add an outline when this is true?
#Either way will run code when clicked to show an
#inspector window
func _on_mouse_entered():
	selected = true

func _on_mouse_exited():
	selected = false


#Not sure if we want anything cool to happen with
#right and left click but we have the option
#to do so
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and selected and event.pressed:
			#Emit a signal which main will listen to
			$Clickable.is_clicked.emit()
		if event.button_index == MOUSE_BUTTON_RIGHT and selected and event.pressed:
			#In case we want to do something with right click????
			print("Right clicked a clickable")
		#Make this a signal or a function in the control ui rn this is BAD	
		elif selected == false: $Clickable.isnt_clicked.emit()
