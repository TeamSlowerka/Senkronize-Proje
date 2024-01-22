extends Node2D

var cloud_texture : Texture
var cloud_sprites : Array = []
var blur_alpha_threshold = 100
var cloud_speed = Vector2(0.06, 1000.0)  # Hareket hızını ayarladık (x, y)
var fade_speed = 1  # Opaklık değişim hızı
var start_positions : Array = []  # Başlangıç x pozisyonlarını saklamak için dizi

func _ready():
	var cloud_data = [
		{"position": Vector2(100, 100), "alpha": 100},
		{"position": Vector2(200, 150), "alpha": 100},
		{"position": Vector2(300, 200), "alpha": 100}
	]

	cloud_texture = preload("res://PlewrPack/Clouds.png")
	for data in cloud_data:
		var cloud_sprite = Sprite.new()
		cloud_sprite.texture = cloud_texture
		cloud_sprite.position = data.position
		cloud_sprite.modulate = Color(1, 1, 1, data.alpha / 450.0)
		cloud_sprites.append(cloud_sprite)
		start_positions.append(data.position.x)  # Başlangıç x pozisyonunu sakla
		add_child(cloud_sprite)

func _process(delta):
	for i in range(cloud_sprites.size()):
		var cloud = cloud_sprites[i]
		var start_x = start_positions[i]

		# Bulutları ileri doğru hareket ettirin
		cloud.position.x += cloud_speed.x
		cloud.position.y += sin(cloud.position.x / 8) * 0.025  # Y ekseninde dalgalı hareket

		# Bulutlar belirli bir noktaya ulaştıklarında geri dönmelerini sağlayın
		if cloud.position.x >= start_x + get_viewport_rect().size.x:
			cloud.position.x = start_x - cloud_texture.get_width()  # Başlangıç x pozisyonuna geri dön

		# Y ekseninde sonsuz döngü oluşturmak için kontrol
		if cloud.position.y > get_viewport_rect().size.y:
			cloud.position.y = -cloud_texture.get_height()
		elif cloud.position.y < -cloud_texture.get_height():
			cloud.position.y = get_viewport_rect().size.y

		# Opaklık değişimi
		var current_alpha = cloud.modulate.a * 255.0
		if current_alpha < blur_alpha_threshold:
			# Yavaşça opaklaşma
			current_alpha += fade_speed * delta
			cloud.modulate.a = current_alpha / 255.0
		else:
			# Yavaşça normale dönme
			current_alpha -= fade_speed * delta
			cloud.modulate.a = current_alpha / 255.0 if current_alpha > 0 else 1.0 / 255.0
