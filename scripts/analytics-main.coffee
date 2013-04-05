define (require) ->
	require 'jquery_role'

	AnalyticsView = require 'views/AnalyticsView'
	AnalyticsModel = require 'models/AnalyticsModel'


	new AnalyticsView
		el: '@analytics'
		model: new AnalyticsModel()
		autoRender: true

