window.require =
	baseUrl: 'scripts'

	paths:
		# Libraries
		$: 'lib/jquery/jquery-1.9.1'
		_: 'lib/lodash'
		Backbone: 'lib/backbone'
		Highcharts: 'lib/Highcharts-2.3.5/js/highcharts.src'
		moment: 'lib/moment'

		# Requirejs's plugins
		text: 'lib/requirejs/text'
		tpl: 'lib/requirejs/tpl'

		# jQuery's plugins
		jquery_role: 'lib/jquery/jquery.role'

		# Templates path
		templates: '../templates'


	map:
		# Aliases
		'*':
			underscore: '_'
			backbone: 'Backbone'
			jquery: '$'
			Collection: 'core/collection'
			View: 'core/view'
			Model: 'core/model'


	# Not AMD modules
	shim:
		Backbone:
			deps: ['$', '_']
			exports: 'Backbone'

		$:
			exports: 'jQuery'

		Highcharts:
			deps: ['$']
			exports: 'Highcharts'

		jquery_role:
			deps: ['$']
