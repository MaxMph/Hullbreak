extends CanvasLayer


func _process(delta: float) -> void:
	$VBoxContainer/energy.text = "Energy: " + str(Global.energy)
	$VBoxContainer/ammo.text = "Ammo: " + str(Global.ammo)
