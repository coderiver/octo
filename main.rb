# coding: utf-8

require 'rubygems'
require 'compass'
require 'sinatra'
require 'sass'
require 'coffee-script'
require 'json'

set :public_folder, settings.root
set :views, settings.root

c = Compass.configuration
c.sass_dir = 'styles'
c.images_dir = 'images'
c.http_path = '/'
c.http_images_path = '/images'
c.http_stylesheets_path = '/styles'


get '/*.css' do |filename|
	content_type 'text/css', :charset => 'utf-8'

	Sass.compile_file File.join(settings.root, filename + '.scss'), Compass.sass_engine_options
end

get '/*.js' do |filename|
	content_type 'application/javascript', :charset => 'utf-8'

	io = File.read File.join(settings.root, filename + '.coffee')
	CoffeeScript.compile io
end

get '/reviews' do
	def to_js_date(*args)
		Time.utc(*args).to_i * 1000
	end

	content_type :json

	[
		{
			:id => 1,
			:name => 'Реклама для каналов',
			:data => [
				[to_js_date(2012, 9), 50],
				[to_js_date(2012, 10), 210],
				[to_js_date(2012, 11), 305],
				[to_js_date(2012, 12), 195],
				[to_js_date(2013, 1), 270],
				[to_js_date(2013, 2), 360],
				[to_js_date(2013, 3), 420],
				[to_js_date(2013, 4), 470],
			]
		},
		{
			:id => 2,
			:name => 'Colins Collection',
			:data => [
				[to_js_date(2012, 9), 100],
				[to_js_date(2012, 10), 105],
				[to_js_date(2012, 11), 210],
				[to_js_date(2012, 12), 150],
				[to_js_date(2013, 1), 160],
				[to_js_date(2013, 2), 400],
				[to_js_date(2013, 3), 390],
				[to_js_date(2013, 4), 200],
			]
		},
		{
			:id => 5,
			:name => 'Ipad Ad',
			:data => [
				[to_js_date(2012, 9), 160],
				[to_js_date(2012, 10), 405],
				[to_js_date(2012, 11), 350],
				[to_js_date(2012, 12), 170],
				[to_js_date(2013, 1), 100],
				[to_js_date(2013, 2), 220],
				[to_js_date(2013, 3), 350],
				[to_js_date(2013, 4), 100],
			]
		}
	].to_json

end

get '/timeline' do

	case params[:type]
		when 'clicks'
			'CLICKS'
		when 'impressions'
			'IMPRESSIONS'
		when 'ctr'
			'CTR'
		when 'cost'
			'COST'
		else
			'ELSE'
	end
end
