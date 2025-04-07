fx_version 'cerulean'

games { 'gta5' }

lua54 'yes'

description 'JOB PACK(Mine, Wood, Cloth) by MRich'

version '1.8.6'

shared_scripts {
	'@PolyZone/client.lua',
    '@PolyZone/CircleZone.lua',
	'@qb-core/shared/locale.lua',
	'config.lua',
	'locales/en.lua'
}

server_scripts {
	'server/chatgo.lua',
	-- 'server/meth.lua',
	'server/daoda.lua',
	'server/detvai.lua',
}

client_scripts {
	'client/daoda.lua',
	-- 'client/meth.lua',
	'client/chatgo.lua',
	'client/detvai.lua',
	'client/target.lua',
}

files {
	'stream/mw_props.ytyp'
}

data_file 'DLC_ITYP_REQUEST' 'stream/mw_props.ytyp'
