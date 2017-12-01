axis         = require 'axis'
rupture      = require 'rupture'
autoprefixer = require 'autoprefixer-stylus'
js_pipeline  = require 'js-pipeline'
css_pipeline = require 'css-pipeline'
wordpress    = require 'roots-wordpress'
templates    = require 'client-templates'
config       = require 'roots-config'
records      = require 'roots-records'
fs           = require 'fs'
contentful   = require 'roots-contentful'

##fs.readdir 'views/pages', (err, data) ->
##    navfiles.push(data)
##   console.log(navfiles)

module.exports =
	ignores: ['readme.md', '**/layout.*', '**/_*', '.gitignore', 'ship.*conf']

	extensions: [
		js_pipeline(files: ['assets/js/*.js','assets/js/*.coffee']),
		css_pipeline(files: ['assets/css/*.css','assets/css/*.styl'])
		##wordpress
		##	site:'http://tcfcu1.4cc.co'
		##	post_types:
		##		post: {template:'views/partial/_blog_post.jade'}
		#contentful
			# access_token: 'e75ea3d56e9c47e422e060239a57fa84d6e0dea64478f3edae4e674f65308a60'
			# space_id: 'kzkzhu5buy40'
			# content_types:
				# Rates:
				# 	id: 'loanRates'
					##template: 'views/partial/_cf_post.jade'
					##filters: { 'fields.environment[in]': ['staging', 'production'] }
					##path: (e) -> "blogging/#{e.category}/#{slugify(e.title)}"
					##write: 'data.json'
					##sort: compareFunction
					##transform: transformFunction
				##press_links:
				##	id: 'xxxxxx'
				# Home:
				# 	id: 'homePage'
				# 	##template: 'views/partial/_cf_post.jade'
				# About:
				# 	id: 'aboutPage'
				# 	##template: 'views/partial/_cf_post.jade'
				# Products:
				# 	id: 'productsAndServices'
				# 	##template: 'views/partial/_cf_post.jade'
				# Footer:
				# 	id: 'footer'
				# 	##template: 'views/partial/_cf_post.jade'
				# Alerts:
				# 	id: 'alert'
				# 	##template: 'views/partial/_cf_post.jade'
				# Posts:
				# 	id: 'blogPost'
				# 	template: 'views/partial/_cf_blog_post.jade'
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
