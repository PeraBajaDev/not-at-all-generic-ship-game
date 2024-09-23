extends PowerUp


func apply(body: Node2D):
	var inputHandler =  body.get_node("InputHandler")
	if inputHandler:
		if inputHandler.recoil >= 0.4:
			inputHandler.recoil -= 0.1
