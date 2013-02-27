window.require =
	baseUrl: 'scripts'

	paths:
		# Libraries
		$: 'lib/jquery-1.9.1'
		_: 'lib/lodash'
		Backbone: 'lib/backbone'

		# Requirejs's plugins
		text: 'lib/requirejs/text'
		tpl: 'lib/requirejs/tpl'

		# Templates path
		templates: '../templates'


	map:
		# Aliases
		'*':
			underscore: '_'
			backbone: 'Backbone'
			jquery: '$'


	# Not AMD modules
	shim:
		Backbone:
			deps: ['$', '_']
			exports: 'Backbone'

		$:
			exports: 'jQuery'

