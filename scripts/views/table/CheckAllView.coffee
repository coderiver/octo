define (require) ->
	View = require 'View'
	RowsView = require 'views/table/RowsView'


	class CheckAllView extends View

		events:
			'change': 'checkAll'

		initialize: ->
			@listenTo @model, 'change:allChecked', @render


		render: ->
			@$el.prop 'checked', @model.get('allChecked')


		checkAll: (event) ->
			event.stopPropagation()
			@model.checkAll $(event.target).is(':checked')