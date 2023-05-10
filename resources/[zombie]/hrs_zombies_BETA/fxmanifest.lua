fx_version 'cerulean'

lua54 'yes'

game 'gta5'

description 'update 25/04/2023 00:52'

version '1.0'

files {
	"dlc_hrsz/zombie_sounds.awc",
	"data/hrsz_sounds.dat54.nametable",
	"data/hrsz_sounds.dat54.rel"
}

client_scripts {
	'config.lua',
	'opensource/client.lua',
	'escrow/client.lua'
}

server_scripts {
	'config.lua',
	'opensource/server.lua',
	'escrow/server.lua'
}

escrow_ignore {
	'config.lua',
	'opensource/client.lua',
	'opensource/server.lua'
}

data_file "AUDIO_WAVEPACK" "dlc_hrsz"
data_file "AUDIO_SOUNDDATA" "data/hrsz_sounds.dat"


dependency '/assetpacks'