define (require) ->
	View = require 'View'


	class CheckedCountView extends View

		initialize: ->
			@listenTo @model, 'change:checkedCount', @render


		render: ->
			@$el.html @model.get('checkedCount')
