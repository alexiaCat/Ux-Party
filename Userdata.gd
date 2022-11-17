extends Node

#singleton para guardar los datos de la partida y configuracion en el telefono

enum BUS {MASTER, MUSICA, EFECTOS}

const CONFIG_FILE := "user://config.cfg"
const SAVE_FILE := "user://save."

var default_config: Dictionary = {
	#Volumes are declared in linear energy so we can use a 0-100% slider;
	#0 linear is -inf db, which doesn't support being stored as float
	#so we store an unconverted value
	"volume_master": 0,
	"volume_music": 0,
	"volume_efects": 0,
}


func _init():
	load_config()


func load_config() -> void:
	var cfg = ConfigFile.new()
	var unexistant = cfg.load(CONFIG_FILE) #Checks if the config file exists;
	if unexistant: 
		revert_config(cfg)
		#This function will be recalled by revert_config so let's end it;
		return

	set_audio(BUS.MASTER, cfg.get_value("settings", "volume_master"))
	set_audio(BUS.MUSICA, cfg.get_value("settings", "volume_music"))
	set_audio(BUS.EFECTOS, cfg.get_value("settings", "volume_efects"))

func revert_config(cfg: ConfigFile):
	#Write default settings to cfg;
	for key in default_config.keys():
		cfg.set_value("settings", key, default_config[str(key)])
	cfg.save(CONFIG_FILE)
	load_config()
	return cfg


func save_config(setting: String, value):
	var cfg = ConfigFile.new()
	var unexistant = cfg.load(CONFIG_FILE)
	#Check if the file went away during runtime;
	if unexistant: cfg = revert_config(cfg)
	cfg.set_value("settings", setting, value)
	cfg.save(CONFIG_FILE)

func get_config(setting):
	var cfg = ConfigFile.new()
	var unexistant = cfg.load(CONFIG_FILE)
	if unexistant: cfg = revert_config(cfg)
	var value = cfg.get_value("settings", setting)
	return value

func set_audio(bus, value):
	AudioServer.set_bus_volume_db(bus, linear2db(value))


