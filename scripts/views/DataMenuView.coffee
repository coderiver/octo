define (require) ->
	View = require 'View'
	template = require 'tpl!templates/data-menu.html'


	class DataMenuView extends View

		template: template

		events:
			'click li': 'changeType'

		initialize: ->
			@listenTo @model, 'change:category', @render
			@listenTo @model, 'change:subcategory', @renderShow
			@listenTo @model, 'change:type', @renderSelect


		serialize: ->
			costName: if @model.get('category') == 'sites' then 'Доходы' else 'Расходы'


		_render: ->
			@renderShow()
			@renderSelect()


		renderSelect: ->
			@deselecAll()
			@select @model.get('type')


		renderShow: ->
			@$el.toggle @model.isCommonSelected()


		select: (name) ->
			@$("[data-name=#{ name }]").addClass('active')


		deselecAll: ->
			@$('li').removeClass('active')


		changeType: (event) ->
			event.stopPropagation()
			event.preventDefault()
			@model.set type: $(event.currentTarget).data('name')
