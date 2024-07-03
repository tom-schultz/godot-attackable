extends Node
class_name Attackable

signal attacked()

func attack():
	attacked.emit()
