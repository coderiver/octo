define (require) ->
	_ = require '_'
	Collection = require 'Collection'
	SeriesModel = require 'models/SeriesModel'


	class SeriesCollection extends Collection

		model: SeriesModel

		initialize: ->
			@colors = [
				{ mainColor: '#9fc313', borderColor: '#9fc313', used: false }
				{ mainColor: '#60baea', borderColor: '#60baea', used: false }
				{ mainColor: '#f3b140', borderColor: '#f3b140', used: false }
				{ mainColor: '#ed745a', borderColor: '#ed745a', used: false }
				{ mainColor: '#46bfd9', borderColor: '#46bfd9', used: false }
				{ mainColor: '#d8aaeb', borderColor: '#d8aaeb', used: false }
				{ mainColor: '#8cb206', borderColor: '#8cb206', used: false }
				{ mainColor: '#92a7b3', borderColor: '#92a7b3', used: false }
			]

			@listenTo this, 'reset', @onReset
			@listenTo this, 'add', @onAdd
			@listenTo this, 'remove', @onRemove

			@subscribeEvent 'row:checked', @onRowChecked
			@subscribeEvent 'row:unchecked', @onRowUnchecked
			@subscribeEvent 'table:updated', @onTableUpdated


		onReset: ->
			@each @onAdd, this


		onAdd: (seriesModel) ->
			color = _.find @colors, (color) ->
				not color.used

			color.used = true
			seriesModel.set
				color: color.mainColor
				borderColor: color.borderColor


		onRemove: (seriesModel) ->
			seriesColor = seriesModel.get 'color'

			color = _.find @colors, (color) ->
				color.mainColor == seriesColor

			color.used = false


		onRowChecked: (rowModel) ->
			@add rowModel.toJSON()


		onRowUnchecked: (rowModel) ->
			@remove @get(rowModel.id)


		onTableUpdated: (tableCollection) ->
			rows = for row in tableCollection.getCheckedRows()
				row.toJSON()

			@reset rows


		getTotal: ->
			@reduce (memo, rowModel) ->
				memo += rowModel.getTotal()
			, 0




