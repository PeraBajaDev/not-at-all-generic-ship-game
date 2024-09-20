class_name Bullet
extends Node2D

var damage: int: 
	get: 
		return damage
	set(value):
		damage = value if value >= 1 else 1
