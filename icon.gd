extends Sprite

var fadeout = false # are we fading in or out
var shader_value = material.get_shader_param("value") # get the shader value
var speed = 0.03

var noise_texture : NoiseTexture = material.get_shader_param("noise_texture")


func _physics_process(delta: float) -> void:
	if(Input.is_action_just_pressed("ui_accept")):
		fadeout = !fadeout # flip the fade out
		
	if(fadeout):
		shader_value -= speed
	else:
		shader_value += speed	
		
	shader_value = clamp(shader_value,0.0,1.0)
	
	material.set_shader_param("value",shader_value)
	
	if(Input.is_action_just_pressed("ui_right")):
		noise_texture.noise.seed += 1
		material.set_shader_param("noise_texture",noise_texture)
		
	if(Input.is_action_just_pressed("ui_left")):
		noise_texture.noise.period -= 1
		material.set_shader_param("noise_texture" , noise_texture)
