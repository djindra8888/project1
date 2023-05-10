
fx_version 'cerulean'
game 'gta5'

author 'Clau#1981 / DISCORD = https://discord.io/ultracode' 
lua54 'yes'

description 'Ultra 5G HUD 2.7'

client_scripts {
    'Client/*.lua',
}

server_scripts {
    'Server/*.lua',
}

shared_scripts {
    '@es_extended/imports.lua',
    --'@qb-core/shared/locale.lua',                   -- IF YOU USE QBCORE, UNCOMMENT THIS
    --'locales/*.lua',                               -- IF YOU USE QBCORE, UNCOMMENT THIS
    'Config.lua'
}

ui_page {
    'html/index.html',
}

files {
	'html/index.html',
	'html/app.js', 
    'html/style.css',
    'html/responsive.css',
    'html/dist/**'
}

exports {
    'Alert'
}

escrow_ignore {
    'Config.lua',
    'Client/MiniMap.lua',
    'Client/Vehicle.lua',
    'Client/Notifications.lua',
    --'locales/*.lua',                                 -- IF YOU USE QBCORE, UNCOMMENT THIS
}
dependency '/assetpacks'