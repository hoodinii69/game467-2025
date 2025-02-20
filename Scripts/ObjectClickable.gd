extends Node2D

#Use this class for anything we want the player to
#be able to click, including NPCs
class_name Clickable

#Everything should be inspectable, ideally.
#Flavor text is awesome
@export var is_inspectable: bool
#Conversant is for NPCs or anything you can talk to
@export var is_conversant: bool
#Takeable is for anything you can bring with you 
#into your inventory
@export var is_takeable: bool

#Signal to connect to main when clicked
signal is_clicked
