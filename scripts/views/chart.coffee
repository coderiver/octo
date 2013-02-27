define (require) ->

	View = require 'core/view'


	class ChartView extends View

		initialize: ->
			@listenTo @model, 'change', @render


		render: ->
			@$el.html 'RENDER'
			console.log @serialize()