define (require) ->
	View = require 'View'
	ColumnsView = require './ColumnsView'
	DonutView = require './DonutView'

	template = require 'tpl!templates/chart/parts-chart.html'


	class PartsView extends View

		template: template

		_render: ->
			new ColumnsView
				el: @$ '@columns'
				collection: @collection
				autoRender: true

			new DonutView
				el: @$ '@donut'
				collection: @collection
				autoRender: true