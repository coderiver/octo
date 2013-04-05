define (require) ->
	Model = require 'Model'


	class SeriesModel extends Model

		getTotal: ->
			total = 0
			for cell in @get('data')
				total += cell[1]

			total


		select: ->
			@set selected: true


		deselect: ->
			@set selected: false

