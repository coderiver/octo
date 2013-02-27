require 'compass'
require 'sinatra'
require 'sass'
require 'coffee-script'


set :public_folder, settings.root
set :views, settings.root

configure do
	c = Compass.configuration

	c.sass_dir = 'styles'
	c.images_dir = 'images'
	c.http_path = '/'
	c.http_images_path = '/images'
	c.http_stylesheets_path = '/styles'
end


get '/*.css' do |filename|
	scss filename.to_sym, Compass.sass_engine_options
end

get '/*.js' do |filename|
	coffee filename.to_sym
end