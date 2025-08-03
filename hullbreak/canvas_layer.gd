extends CanvasLayer


func _process(delta: float) -> void:
	$VBoxContainer/energy.text = "Energy: " + str(Global.energy)
