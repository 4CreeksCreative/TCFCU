axis         = require 'axis'
rupture      = require 'rupture'
autoprefixer = require 'autoprefixer-stylus'
js_pipeline  = require 'js-pipeline'
css_pipeline = require 'css-pipeline'
contentful   = require 'roots-contentful'
md           = require 'marked'
subPages = {}

transformFunction = (entry) ->
	subPages[entry.pageName] = entry

module.exports =
	ignores: ['readme.md', '**/layout.*', '**/_*', '.gitignore', 'ship.*conf']

	extensions: [
		js_pipeline(files: ['assets/js/*.js','assets/js/*.coffee']),
		css_pipeline(files: ['assets/css/*.css','assets/css/*.styl'])
		
		contentful
			access_token: 'ef4f7d3b1e394c4edf523bbcf0be76031a3046d0811aff6fb4a3ea528f9bec1f'
			space_id: 'ntx0p06grhb8'
			content_types:
				Promotions:
					id: 'promotions'
					template:'views/partial/_promotion.jade'
					filters:{
						'order': '-fields.dateStart'
						'limit': '2'
					}
					path: (e) -> "promo/#{e.slug}"
				activeNotification:
					id:'activeNotification'
				homePage:
					id:'homePage'
				subpages:
					id:'subPage'
					transform:transformFunction
	]

	stylus:
		use: [axis(), rupture(), autoprefixer()]
		sourcemap: true

	'coffee-script':
		sourcemap: true

	jade:
		pretty: true

	server:
		clean_urls:true

	locals:
		testing:'testing'
		basedir: 'views'
		md:require 'marked'
		subPages:subPages
