define (require) ->
	_ = require '_'
	Collection = require 'Collection'
	RowModel = require 'models/RowModel'


	class RowsCollection extends Collection

		url: 'reviews'

		model: RowModel

		initialize: ->
			# todo update
			@listenTo this, 'reset', @onReset


		onReset: ->
			@createAverageRow()
			@createTotalRow()

			@publishEvent 'table:updated', this


		getCheckedRows: ->
			@filter (row) -> row.get 'checked'


		getDates: ->
			row = @at(0).get 'data'

			for cell in row
				cell[0]


		getRowsTotal: ->
			rowsValues = for model in @models
				for cell in model.get 'data'
					cell[1]

			_.reduce rowsValues, (memo, row) ->
				for cell, index in row
					(memo[index] or 0) + cell
			, []


		getRowsAverage: ->
			rowsTotal = @getRowsTotal()
			rowsCount = @length

			for cell in rowsTotal
				Math.round cell / rowsCount


		createAverageRow: ->
			@add
				id: -2
				name: 'Среднее'
				checked: false
				data: _.zip @getDates(), @getRowsAverage()


		createTotalRow: ->
			@add
				id: -1
				name: 'Итого'
				checked: true
				data: _.zip @getDates(), @getRowsTotal()


		getOrdinaryRows: ->
			@filter (row) ->
				row.id > -1


		getTotalRow: ->
			@get -1


		getAverageRow: ->
			@get -2


		checkAll: (checked = true) ->
			@each (row) ->
				row.check checked


		isAllChecked: ->
			@getCheckedRows().length == @length
