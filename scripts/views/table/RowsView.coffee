define (require) ->
	$ = require '$'
	_ = require '_'
	View = require 'View'
	RowView = require 'views/table/RowView'
	AverageRowView = require 'views/table/AverageRowView'
	TotalRowView = require 'views/table/TotalRowView'


	class RowsView extends View

		initialize: ->
			@listenTo @collection, 'reset sort', @render
			@listenTo @collection, 'reset change:checked', @updateScroll

			@subscribeEvent 'row:uncheck', @uncheckRow


		render: ->
			@clear()

			_.each @collection.getOrdinaryRows(), (row) => @addRow(row, RowView)

			if averageRow = @collection.getAverageRow()
				@addRow averageRow, AverageRowView

			if totalRow = @collection.getTotalRow()
				@addRow totalRow, TotalRowView


		updateScroll: ->
			# todo Почему-то не раб
			$('@scroll-wrapper').trigger('sizeChange')


		addRow: (row, RowView) ->
			view = new RowView
				model: row
				autoRender: true

			@append view


		uncheckRow: (id) ->
			@collection.get(id).set checked: false
