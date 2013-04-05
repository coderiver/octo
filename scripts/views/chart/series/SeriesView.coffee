define (require) ->
	View = require 'View'
	LinearView = require './LinearView'
	MarkersView = require './MarkersView'
	TotalView = require './TotalView'

	template = require 'tpl!templates/chart/series-chart.html'


	class SeriesView extends View

		template: template

		_render: ->
			new LinearView
				el: @$ '@chart'
				collection: @collection
				autoRender: true

			new MarkersView
				el: @$ '@markers'
				collection: @collection
				autoRender: true

			new TotalView
				el: @$ '@total'
				collection: @collection
				autoRender: true
