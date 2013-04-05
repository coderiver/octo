define (require) ->
	View = require 'View'


	class TableHeadView extends View

		events:
			'click @sort-by-name @reverse': 'sortByNameReverse'
			'click @sort-by-name @direct': 'sortByNameDirect'

		initialize: ->
			@listenTo @model, 'change:sortAttr change:directOrder', @render


		render: ->
			@renderSortByName()


		renderSortByName: ->
			showDirect = true
			showReverse = true

			if @model.get('sortAttr') == 'name'
				if @model.get('directOrder')
					showDirect = false
				else
					showReverse = false

			@$('@sort-by-name @direct').toggle(showDirect)
			@$('@sort-by-name @reverse').toggle(showReverse)


		sortByNameDirect: ->
			@model.sortBy 'name', true


		sortByNameReverse: ->
			@model.sortBy 'name', false




