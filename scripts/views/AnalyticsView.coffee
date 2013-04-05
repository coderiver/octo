define (require) ->
	View = require 'View'

	MenuView = require 'views/menu/MenuView'

	DataMenuView = require 'views/DataMenuView'

	ChartView = require 'views/chart/ChartView'

	TableModel = require 'models/TableModel'
	TableView = require 'views/table/TableView'
	TableTopView = require 'views/table-top/TableTopView'


	class AnalyticsView extends View

		initialize: ->
			@listenTo @model, 'change', @onContextChange

			@tableModel = new TableModel()


		render: ->
			# todo ??
			@fetchData()

			new MenuView
				el: @$ '@menu'
				model: @model
				autoRender: true

			new DataMenuView
				el: @$ '@data-menu'
				model: @model
				autoRender: true

			new ChartView
				el: @$ '@chart'
				model: @model
				autoRender: true

			# todo выделить
			new TableView
				el: @$ '@table'
				model: @tableModel
				autoRender: true

			new TableTopView
				el: @$ '@table-top'
				model: @tableModel
				autoRender: true


		fetchData: ->
			@tableModel.rowsCollection.fetch()


		onContextChange: ->
			@fetchData()
