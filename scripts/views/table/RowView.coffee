define (require) ->
	_ = require '_'
	$ = require '$'
	utils = require 'utils'
	View = require 'View'
	template = require 'tpl!templates/row.html'


	class RowView extends View

		template: template

		tagName: 'tr'

		events:
			'change @checkbox': 'onChangeCheckbox'

		initialize: ->
			@listenTo @model, 'change:checked', @renderChecked
			@listenTo @model, 'change:hide', @renderHide


		serialize: ->
			data = @model.toJSON()
			max = _.max data.data, (cell) ->
				cell[1]

			max.isMax = true
			data.numFormat = utils.numFormat

			data


		_render: ->
			@renderHide()
			@renderChecked()


		renderHide: ->
			@$el.toggle !@model.get('hide')


		renderChecked: ->
			@$('@checkbox').prop 'checked', @model.get('checked')


		onChangeCheckbox: (event) =>
			@model.check $(event.target).is(':checked')