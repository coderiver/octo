define (require) ->
	View = require 'View'
	MarkerView = require './MarkerView'


	class MarkersView extends View

		initialize: ->
			@listenTo @collection, 'reset', @render
			@listenTo @collection, 'add', @addMarker


		render: ->
			@clear()
			@collection.each @addMarker, this


		addMarker: (seriesModel) ->
			markerView = new MarkerView
				model: seriesModel
				autoRender: true

			@append markerView