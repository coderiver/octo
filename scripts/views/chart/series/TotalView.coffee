define (require) ->
	View = require 'View'
	utils = require 'utils'


	class TotalView extends View

		initialize: ->
			@listenTo @collection, 'reset add remove', @render


		render: ->
			total = @collection.getTotal()
			@$el.html "Всего: #{ utils.numFormat(total) }"