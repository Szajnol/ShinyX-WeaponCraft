fx_version 'adamant'
game 'gta5'

server_scripts {
	'server.lua'
}

client_script '@sun_loader/c_loader.lua'
server_script '@sun_loader/s_loader.lua'
my_data 'client_files' { "client.lua" }

lua54 'yes'

shared_script '@es_extended/imports.lua'

ui_page 'ui/index.html'

files {
    'ui/index.html',
    'ui/style.css',
    'ui/main.js',
}