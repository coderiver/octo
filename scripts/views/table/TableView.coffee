define (require) ->
	$ = require '$'
	View = require 'View'
	RowsView = require 'views/table/RowsView'
	CheckAllView = require 'views/table/CheckAllView'
	TableHeadView = require 'views/table/TableHeadView'


	class TableView extends View

		render: ->
			new RowsView
				el: @$ '@rows'
				collection: @model.rowsCollection
				autoRender: true

			new TableHeadView
				el: @$ '@table-head'
				model: @model
				autoRender: true

			# todo вынести в TableHeadView
			new CheckAllView
				el: @$ '@check-all'
				model: @model
				autoRender: true
