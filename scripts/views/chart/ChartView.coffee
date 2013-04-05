define (require) ->
	View = require 'View'

	PartsCollection = require 'models/PartsCollection'
	PartsView = require './parts/PartsView'

	SeriesCollection = require 'models/SeriesCollection'
	SeriesView = require './series/SeriesView'


	class ChartView extends View

		initialize: ->
			@listenTo @model, 'change:subcategory', @render


		render: ->
			if @model.isCommonSelected()
				@switchToLinear()
			else
				@switchToColumns()


		disposeChart: (chartView) ->
			# todo в core!
			chartView.collection.off()
			chartView.collection = null

			chartView.remove()


		switchChart: (chartView) ->
			if @chartView
				@disposeChart @chartView

			@chartView = chartView
			@append chartView


		switchToLinear: ->
			@switchChart new SeriesView
				collection: new SeriesCollection()
				autoRender: true


		switchToColumns: ->
			@switchChart new PartsView
				collection: new PartsCollection()
				autoRender: true

