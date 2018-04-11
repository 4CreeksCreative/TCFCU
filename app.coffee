axis         = require 'axis'
rupture      = require 'rupture'
autoprefixer = require 'autoprefixer-stylus'
js_pipeline  = require 'js-pipeline'
css_pipeline = require 'css-pipeline'
contentful   = require 'roots-contentful'
md           = require 'marked'
date         = new Date()
month        = if (date.getMonth()+1) < 10 then '0'+(date.getMonth()+1) else date.getMonth()+1
day          = if date.getDate() < 10 then '0'+date.getDate() else date.getDate()
today        = date.getFullYear()+'-'+month+'-'+day
subPages = {}

transformFunction = (entry) ->
	subPages[entry.pageName] = entry

module.exports =
	ignores: ['readme.md', '**/layout.*', '**/_*', '.gitignore', 'ship.*conf']

	extensions: [
		js_pipeline(files: ['assets/js/*.js','assets/js/*.coffee']),
		css_pipeline(files: ['assets/css/*.css','assets/css/*.styl'])
		
		contentful
			access_token:'429fe95700ac834cc676275beb8af66d503a93b879ee4db2bbb04441873a56cf'
			preview: true
			#access_token: 'ef4f7d3b1e394c4edf523bbcf0be76031a3046d0811aff6fb4a3ea528f9bec1f'
			space_id: 'ntx0p06grhb8'
			content_types:
				Promotions:
					id: 'promotions'
					template:'views/partial/_promotion.jade'
					filters:{
						'order': '-fields.dateStart'
						'fields.dateStart[lte]': today
						'fields.dateEnd[gte]': today
					}
					path: (e) -> "promo/#{e.slug}"
				notifications:
					id:'notification'
				homePage:
					id:'homePage'
				subpages:
					id:'subPage'
					transform:transformFunction
					template:'views/partial/_subPage.jade'
					path: (e) -> "/#{e.pageName}"
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
