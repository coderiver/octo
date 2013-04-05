define (require) ->
	$ = require '$'
	View = require 'View'


	class SubcategoriesView extends View

		events:
			'click li': 'changeSubcategory'

		initialize: ->
			@listenTo @model, 'change:subcategory', @render


		render: ->
			@deselecAll()
			@select @model.get('subcategory')


		select: (name) ->
			@$("[data-name=#{ name }]").addClass('active')


		deselecAll: ->
			@$('li').removeClass('active')


		changeSubcategory: (event) ->
			event.stopPropagation()
			event.preventDefault()
			@model.set subcategory: $(event.currentTarget).data('name')



