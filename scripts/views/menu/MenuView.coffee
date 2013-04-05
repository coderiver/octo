define (require) ->
	View = require 'View'
	CategoriesView = require './CategoriesView'
	SubcategoriesView = require './SubcategoriesView'


	class MenuView extends View

		render: ->
			new CategoriesView
				el: @$ '@category'
				model: @model
				autoRender: true

			new SubcategoriesView
				el: @$ '@subcategory'
				model: @model
				autoRender: true


