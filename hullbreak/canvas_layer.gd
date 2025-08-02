extends CanvasLayer


func _process(delta: float) -> void:
	$energy.text = "Energy: " + str(Global.energy)
