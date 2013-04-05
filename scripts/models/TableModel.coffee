define (require) ->
	Model = require 'Model'
	RowsCollection = require 'models/RowsCollection'


	class TableModel extends Model

		defaults:
			showAll: true

		initialize: ->
			@rowsCollection = new RowsCollection()

			@listenTo @rowsCollection, 'change:checked add remove reset', @updateChecked
			@listenTo this, 'change:showAll', @updateShowAll


		updateChecked: ->
			@set checkedCount: @rowsCollection.getCheckedRows().length
			@set allChecked: @rowsCollection.isAllChecked()

			@updateShowAll()

		# todo: refact
		updateShowAll: ->
			showAll =  @get('showAll')
			if showAll
				@rowsCollection.each (row) ->
					row.set hide: false
			else
				@rowsCollection.each (row) ->
					row.set hide: !row.get('checked')


		sortBy: (attr, directOrder = true) ->
			@set sortAttr: attr
			@set directOrder: directOrder

			# todo проверить порядок
			@rowsCollection.comparator = (model1, model2) ->
				value1 = model1.get attr
				value2 = model2.get attr

				if directOrder
					[value1, value2] = [value2, value1]

				if value1 > value2
					1
				else
					-1

			@rowsCollection.sort()


		checkAll: (checked = true) ->
			@rowsCollection.checkAll checked

