extends Node
var musicArray = []
var sfxArray = []
var nowPlaying 

func _ready() -> void:
	for music in $BGM.get_children():
		musicArray.append(music)
	print(musicArray)
	for sfx in $SFX.get_children():
		sfxArray.append(sfx)

func playBGM(newMusic):
	if nowPlaying == null:
		nowPlaying = get_node("/root/Node2D/Sounds/BGM/Sailing1BGM")
	if nowPlaying.name != newMusic:
		for music in musicArray:
			if music.name == newMusic:
				music.play()
				music.volume_db = 0
				print("Now playing: " + str(music))
				nowPlaying = music
				
func playSFX(soundToPlay):
	for sfx in sfxArray:
		if sfx.name == soundToPlay:
			#music.volume_db = 0
			sfx.play()
			print("Playing SFX: " + str(soundToPlay))
	for music in musicArray:
		music.volume_db = -60

func _physics_process(delta: float) -> void:
	if nowPlaying != null:
		for music in musicArray:
			if music.name != nowPlaying.name:
				music.volume_db -= 0.8
				if music.volume_db < 50:
					music.stop()
			if music.name == nowPlaying.name:
				if music.volume_db < 0:
					music.volume_db += 0.8
				if music.volume_db > 0:
					music.volume_db = 0
	
	if Engine.get_physics_frames()%600 == 0 and nowPlaying != null:
		print("(Playing: " + str(nowPlaying) + " at " + str(nowPlaying.volume_db) + " db.)")
