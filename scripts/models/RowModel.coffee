define (require) ->
	Model = require 'Model'


	class RowModel extends Model

		defaults:
			checked: false

		initialize: ->
			@listenTo this, 'change:checked', @onChangeChecked


		onChangeChecked: ->
			if @get 'checked'
				@publishEvent 'row:checked', this
			else
				@publishEvent 'row:unchecked', this


		getTotal: ->
			total = 0
			for cell in @get('data')
				total += cell[1]

			total


		getAverage: ->
			Math.round @getTotal() / @get('data').length


		check: (checked = true) ->
			@set checked: checked